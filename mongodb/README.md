# binaryoverload/mongodb-client

![GitHub Workflow Status (with event)](https://img.shields.io/github/actions/workflow/status/binaryoverload/docker-backup-clients/docker-mongodb.yml) [![Docker Hub](https://img.shields.io/badge/Docker%20Hub-gray?logo=docker)](https://hub.docker.com/r/binaryoverload/mongodb-client) [![GitHub](https://img.shields.io/badge/GitHub-black?logo=github&logoColor=white)](https://github.com/binaryoverload/docker-backup-clients/)

A Docker image for all of the MongoDB client executables, including:

- `mongosh` - The mongodb shell, a command-line interface for interacting with a mongodb server
- `mongodump` - Dump a database or a collection of databases to a file
- `mongorestore` - Restore a database from a dump file
- `bsondump` - Convert BSON files to JSON
- `mongoexport` - Export data from a database to a file
- `mongofiles` - Upload and download files to and from a mongodb server
- `mongoimport` - Import data from a file to a database
- `mongostat` - Display statistics about a mongodb server
- `mongotop` - Monitor the performance of a mongodb server

The image also includes common file transfer utilities to allow use of this image for backup and restore operations, including:

- `curl`, `wget` - Download files from the internet
- `tar`, `gzip`, `zip` and `xz` - Archive and compress files
- `openssl` and `gpg` - Encrypt and decrypt files
- `rsync` - Synchronize files and directories between two locations
- `rclone` - https://rclone.org/ - Sync files and directories to and from cloud storage providers
- `cron` - Schedule tasks to run at specific intervals

This image is intended to be used as a base image for running MongoDB scripts and as such is deployed in both Ubuntu (Default) and Alpine distro variants.
