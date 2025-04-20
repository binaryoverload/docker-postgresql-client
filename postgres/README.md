# binaryoverload/postgresql-client

![GitHub Workflow Status (with event)](https://img.shields.io/github/actions/workflow/status/binaryoverload/docker-backup-clients/docker-postgres.yml) [![Docker Hub](https://img.shields.io/badge/Docker%20Hub-gray?logo=docker)](https://hub.docker.com/r/binaryoverload/postgresql-client) [![GitHub](https://img.shields.io/badge/GitHub-black?logo=github&logoColor=white)](https://github.com/binaryoverload/docker-backup-clients/)

A Docker image for all of the PostgreSQL client executables, including:

- `pg_dump` - Extract a PostgreSQL database into a script file or other archive file
- `pg_dumpall` - Extract a PostgreSQL database cluster into a script file
- `pg_restore` - Restore a PostgreSQL database from an archive file created by pg_dump
- `psql` - PostgreSQL interactive terminal
- `pg_isready` - Check the connection status of a PostgreSQL server
- `pg_basebackup` - Take a base backup of a PostgreSQL cluster
- `pg_verifybackup` - Verify the integrity of a base backup of a PostgreSQL cluster
- [And many more...](https://www.postgresql.org/docs/current/reference-client.html)

The image also includes common file transfer utilities to allow use of this image for backup and restore operations, including:

- `curl`, `wget` - Download files from the internet
- `tar`, `gzip`, `zip` and `xz` - Archive and compress files
- `openssl` and `gpg` - Encrypt and decrypt files
- `rsync` - Synchronize files and directories between two locations
- `rclone` - https://rclone.org/ - Sync files and directories to and from cloud storage providers

This image is intended to be used as a base image for running PostgreSQL scripts and as such is deployed in both Ubuntu (Default) and Alpine distro variants with all major supported versions:

- 17
- 16
- 15
- 14 (Ubuntu only)
- 13 (Ubuntu only)
- 12 (Ubuntu only)

Information on the versions of PostgreSQL and their support periods can be found [at the link here](https://www.postgresql.org/support/versioning/).
