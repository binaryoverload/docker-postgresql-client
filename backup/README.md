# binaryoverload/backup-client

![GitHub Workflow Status (with event)](https://img.shields.io/github/actions/workflow/status/binaryoverload/docker-backup-clients/docker-backup.yml) [![Docker Hub](https://img.shields.io/badge/Docker%20Hub-gray?logo=docker)](https://hub.docker.com/r/binaryoverload/backup-client) [![GitHub](https://img.shields.io/badge/GitHub-black?logo=github&logoColor=white)](https://github.com/binaryoverload/docker-backup-clients/)

A Docker image containing common backup and file transfer utilities for use in backup and restore operations, including:

- `curl`, `wget` - Download files from the internet
- `tar`, `gzip`, `zip` and `xz` - Archive and compress files
- `openssl` and `gpg` - Encrypt and decrypt files
- `rsync` - Synchronize files and directories between two locations
- `rclone` - https://rclone.org/ - Sync files and directories to and from cloud storage providers

This image is intended to be used as a base image for running scripts and as such is deployed in both Ubuntu (Default) and Alpine distro variants.
