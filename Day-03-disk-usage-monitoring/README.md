# Day 03 – Disk Usage Monitoring Script

## Objective
Monitor disk usage on a Linux system and alert when usage crosses a defined threshold.

## What the Script Does
- Uses `df -h` to check disk usage
- Parses usage percentage
- Triggers alert if usage >= 80%

## Tools Used
- Linux
- Bash
- df
- cron (can be added later)

## How to Run
```bash
chmod +x disk_monitor.sh
./disk_monitor.sh
