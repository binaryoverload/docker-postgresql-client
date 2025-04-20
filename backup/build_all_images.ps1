$oses = @("ubuntu", "alpine")

$successfulBuilds = @()
$failedBuilds = @()

foreach ($os in $oses) {
    $tags = @("binaryoverload/backup-client:$os")
    if ($os -eq "ubuntu") {
        $tags += "binaryoverload/backup-client:latest"
    }

    Write-Host ""
    Write-Host "───────────────────────────────────────────────"
    Write-Host "Building image for OS=$os"
    Write-Host "Tags: $($tags -join ', ')"
    Write-Host "───────────────────────────────────────────────"

    $tagArgs = $tags | ForEach-Object { "--tag=$_" }

    $buildArgs = @(
        "buildx", "build",
        "--file", "./Dockerfile.$os"
    ) + $tagArgs + "."

    Write-Host "Running Docker command:"
    Write-Host "docker $($buildArgs -join ' ')"

    docker @buildArgs

    if ($LASTEXITCODE -ne 0) {
        Write-Warning "Build failed for OS=$os"
        $failedBuilds += "$os"
    }
    else {
        $successfulBuilds += "$os"
    }

    Write-Host ""
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
