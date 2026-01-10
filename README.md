# Day 02 – Automated Backup Script

## Objective
Automate the backup of important directories using a Bash script.

## What the Script Does
- Takes backup of a specified directory
- Compresses the backup using tar
- Adds timestamp to each backup
- Stores backups in a dedicated folder

## Tools Used
- Linux
- Bash
- tar
- cron

## How to Run
```bash
chmod +x backup.sh
./backup.sh
