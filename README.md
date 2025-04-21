# Backup Clients

This repo contains Docker images for with backup and restore utilities for the following databases:

- [PostgreSQL](./postgres)
- [MariaDB](./mariadb) (aka MySQL)
- [MongoDB](./mongodb)

It also contains an [image without any database client](./backup), but with the same utilities.

These images are designed to be used as base images for running backup and restore scripts, and are deployed in both Ubuntu (Default) and Alpine distro variants with all major supported versions of the database clients.

The primary motivation for creating these images was having an image that could be used in Kubernetes jobs to run backup and restore scripts.

Each image contains the following utilities along with the database client:

- `curl`, `wget` - Download files from the internet
- `tar`, `gzip`, `zip` and `xz` - Archive and compress files
- `openssl` and `gpg` - Encrypt and decrypt files
- `rsync` - Synchronize files and directories between two locations
- `rclone` - https://rclone.org/ - Sync files and directories to and from cloud storage providers
- `cron` - Schedule tasks to run at specific intervals
