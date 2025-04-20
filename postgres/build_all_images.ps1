$oses = @("ubuntu", "alpine")
$postgresVersions = @(12, 13, 14, 15, 16, 17)
$exclusions = @(
    @{ os = "alpine"; postgres_version = 12 },
    @{ os = "alpine"; postgres_version = 13 },
    @{ os = "alpine"; postgres_version = 14 }
)

$successfulBuilds = @()
$failedBuilds = @()

foreach ($os in $oses) {
    foreach ($version in $postgresVersions) {
        $isExcluded = $false
        foreach ($exclusion in $exclusions) {
            if ($exclusion.os -eq $os -and $exclusion.postgres_version -eq $version) {
                $isExcluded = $true
                break
            }
        }

        if ($isExcluded) {
            Write-Host "Skipping excluded combination: OS=$os, PostgreSQL=$version"
            continue
        }

        $tags = @("binaryoverload/postgresql-client:$version-$os")
        if ($os -eq "ubuntu") {
            $tags += "binaryoverload/postgresql-client:$version"
        }

        Write-Host ""
        Write-Host "───────────────────────────────────────────────"
        Write-Host "Building image for OS=$os, PostgreSQL=$version"
        Write-Host "Tags: $($tags -join ', ')"
        Write-Host "───────────────────────────────────────────────"

        $tagArgs = $tags | ForEach-Object { "--tag=$_" }

        $buildArgs = @(
            "buildx", "build",
            "--file", "./Dockerfile.$os",
            "--build-arg", "POSTGRES_VERSION=$version"
        ) + $tagArgs + "."

        Write-Host "Running Docker command:"
        Write-Host "docker $($buildArgs -join ' ')"

        docker @buildArgs

        if ($LASTEXITCODE -ne 0) {
            Write-Warning "Build failed for OS=$os, PostgreSQL=$version"
            $failedBuilds += "$os/$version"
        }
        else {
            $successfulBuilds += "$os/$version"
        }

        Write-Host ""
    }
}

# Summary report
Write-Host "`n=================== Build Summary ==================="
Write-Host "✅ Successful builds:"
if ($successfulBuilds.Count -eq 0) {
    Write-Host "  (none)"
}
else {
    $successfulBuilds | ForEach-Object { Write-Host "  $_" }
}

Write-Host "`n❌ Failed builds:"
if ($failedBuilds.Count -eq 0) {
    Write-Host "  (none)"
}
else {
    $failedBuilds | ForEach-Object { Write-Host "  $_" }
}
Write-Host "======================================================`n"
