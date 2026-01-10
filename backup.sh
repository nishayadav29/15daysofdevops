#!/bin/bash

# Source directory to back up
SOURCE_DIR="$HOME/devops-projects"

# Backup destination directory
BACKUP_DIR="$HOME/backups"

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Get current date and time
DATE=$(date +"%Y-%m-%d_%H-%M-%S")

# Backup file name
BACKUP_FILE="backup_$DATE.tar.gz"

# Create compressed backup
tar -czf "$BACKUP_DIR/$BACKUP_FILE" "$SOURCE_DIR"

echo "Backup completed successfully"
echo "Backup saved as: $BACKUP_DIR/$BACKUP_FILE"
