# 📦 Day 14 - Linux Automated Backup Script

## 📌 Project Overview

This project is a Linux shell script that automates the process of backing up files and directories. It creates compressed timestamped backups, maintains backup logs, verifies backups, and automatically removes old backups based on a configurable retention policy.

This project demonstrates practical Linux automation skills commonly used by System Administrators and DevOps Engineers.

---

## 🚀 Features

- ✅ Automated directory backup
- ✅ Compressed `.tar.gz` backup creation
- ✅ Timestamped backup filenames
- ✅ Configurable backup source and destination
- ✅ Automatic backup verification
- ✅ Backup activity logging
- ✅ Automatic cleanup of old backups
- ✅ Configurable retention period
- ✅ Colored terminal output
- ✅ Modular Bash scripting

---

## 🛠 Technologies Used

- Bash Shell Scripting
- Linux
- tar
- gzip
- find
- date
- mkdir
- ls

---

## 📁 Project Structure

```
Day-14-linux-backup-script/
│
├── backup.sh
├── README.md
├── .gitignore
├── source/
│   ├── file1.txt
│   ├── file2.txt
│   └── project.txt
├── backups/
├── logs/
│   └── backup.log
└── screenshots/
```

---

## ⚙️ Configuration

Modify these variables at the top of the script according to your environment.

```bash
SOURCE_DIR="./source"
BACKUP_DIR="./backups"
LOG_FILE="./logs/backup.log"

RETENTION_DAYS=7
```

---

## ▶️ How to Run

Give execute permission:

```bash
chmod +x backup.sh
```

Run the script:

```bash
./backup.sh
```

---

## 📋 Sample Output

```
==================================================
         LINUX AUTOMATED BACKUP SCRIPT
==================================================
Generated On : Sat Jul 11 15:45:42 UTC 2026

Creating Backup
--------------------------------------------------
Backup created successfully!
Backup File : ./backups/backup_2026-07-11_15-45-42.tar.gz

Cleaning Old Backups
--------------------------------------------------
Old backups older than 7 days removed.

Backup Verification
--------------------------------------------------
backup_2026-07-11_15-45-42.tar.gz
```

---

## 📄 Log File

Each successful backup is recorded in:

```
logs/backup.log
```

Example:

```
Sat Jul 11 15:45:42 UTC 2026 : Backup created -> backup_2026-07-11_15-45-42.tar.gz
```

---

## 📸 Screenshots

### Script

_Add screenshot here_

### Output

_Add screenshot here_

---

## 💡 DevOps Concepts Covered

- Linux Automation
- Bash Scripting
- File Compression
- Backup Management
- Logging
- Directory Management
- Retention Policy
- Timestamping
- Shell Functions
- Production-style Script Structure

---

## 👨‍💻 Author

**Nisha Yadav**

AWS | Linux | Terraform | Docker | Kubernetes | DevOps Engineer

---

## ⭐ Learning Outcome

By completing this project, I learned how to:

- Automate Linux backup operations
- Create compressed archives using `tar`
- Implement configurable backup policies
- Manage backup retention automatically
- Maintain execution logs
- Build modular and reusable Bash scripts

---

## 📜 License

This project is created for learning and portfolio purposes.