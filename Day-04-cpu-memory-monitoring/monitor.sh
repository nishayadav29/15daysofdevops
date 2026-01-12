#!/bin/bash

# Thresholds
CPU_THRESHOLD=80
MEM_THRESHOLD=80

# Get CPU usage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')

# Get Memory usage
MEM_USAGE=$(free | awk '/Mem/ {printf("%.0f"), $3/$2 * 100}')

echo "CPU Usage: $CPU_USAGE%"
echo "Memory Usage: $MEM_USAGE%"

# Check CPU
if [ "$CPU_USAGE" -gt "$CPU_THRESHOLD" ]; then
    echo "⚠️ ALERT: CPU usage is above $CPU_THRESHOLD%"
fi

# Check Memory
if [ "$MEM_USAGE" -gt "$MEM_THRESHOLD" ]; then
    echo "⚠️ ALERT: Memory usage is above $MEM_THRESHOLD%"
fi
