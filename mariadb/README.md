# binaryoverload/mariadb-client

![GitHub Workflow Status (with event)](https://img.shields.io/github/actions/workflow/status/binaryoverload/docker-backup-clients/docker-mariadb.yml) [![Docker Hub](https://img.shields.io/badge/Docker%20Hub-gray?logo=docker)](https://hub.docker.com/r/binaryoverload/mariadb-client) [![GitHub](https://img.shields.io/badge/GitHub-black?logo=github&logoColor=white)](https://github.com/binaryoverload/docker-backup-clients/)

A Docker image for all of the MariaDB (aka MySQL) client executables, including:

- `mariadb`/`mysql` - MariaDB command-line client
- `mariadb-dump`/`mysqldump` - Dump a database or a collection of databases to a file
- `mariadb-restore`/`mysqlrestore` - Restore a database from a dump file
- `mariadb-show`/`mysqlshow` - Display database and table information
- `mariadbadmin`/`mysqladmin` - Perform administrative operations on a MariaDB server
- `mariadbcheck`/`mysqlcheck` - Check and repair tables in a MariaDB server

The image also includes common file transfer utilities to allow use of this image for backup and restore operations, including:

- `curl`, `wget` - Download files from the internet
- `tar`, `gzip`, `zip` and `xz` - Archive and compress files
- `openssl` and `gpg` - Encrypt and decrypt files
- `rsync` - Synchronize files and directories between two locations
- `rclone` - https://rclone.org/ - Sync files and directories to and from cloud storage providers

This image is intended to be used as a base image for running MariaDB scripts and as such is deployed in both Ubuntu (Default) and Alpine distro variants.
