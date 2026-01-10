#!/bin/bash

LOG_FILE="/var/log/syslog"

echo "===== Last 100 Logs ====="
tail -n 100 "$LOG_FILE"

echo ""
echo "===== ERROR Logs ====="
grep -i "error" "$LOG_FILE"

echo ""
echo "===== WARNING Logs ====="
grep -i "warn" "$LOG_FILE"
