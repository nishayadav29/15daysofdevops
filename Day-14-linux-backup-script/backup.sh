#!/bin/bash

# =====================================
# Linux Automated Backup Script
# Author: Nisha Yadav
# =====================================

GREEN='\033[0;32m'
RED='\033[0;31m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Backup Configuration
SOURCE_DIR="./source"
BACKUP_DIR="./backups"
LOG_FILE="./logs/backup.log"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_NAME="backup_$TIMESTAMP.tar.gz"
RETENTION_DAYS=7

print_header() {

    echo -e "${BLUE}"
    echo "=================================================="
    echo "         LINUX AUTOMATED BACKUP SCRIPT"
    echo "=================================================="
    echo "Generated On : $(date)"
    echo -e "${NC}"

}

create_backup() {

    echo -e "${YELLOW}Creating Backup${NC}"
    echo "--------------------------------------------------"

    tar -czf "$BACKUP_DIR/$BACKUP_NAME" "$SOURCE_DIR"

    if [ $? -eq 0 ]; then
        echo -e "${GREEN}Backup created successfully!${NC}"
        echo "Backup File : $BACKUP_DIR/$BACKUP_NAME"
    else
        echo -e "${RED}Backup failed!${NC}"
    fi

    echo
}

cleanup_old_backups() {

    echo -e "${YELLOW}Cleaning Old Backups${NC}"
    echo "--------------------------------------------------"

    find "$BACKUP_DIR" -name "*.tar.gz" -mtime +"$RETENTION_DAYS" -delete

    echo "Old backups older than 7 days removed."

    echo
}

write_logs() {

    echo "$(date) : Backup created -> $BACKUP_NAME" >> "$LOG_FILE"

}

verify_backup() {

    echo -e "${YELLOW}Backup Verification${NC}"
    echo "--------------------------------------------------"

    ls -lh "$BACKUP_DIR"

    echo
}

main() {

    mkdir -p "$BACKUP_DIR"
    mkdir -p "$(dirname "$LOG_FILE")"
    print_header
    create_backup
    cleanup_old_backups
    write_logs
    verify_backup
}

main