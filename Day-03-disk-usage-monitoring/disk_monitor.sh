#!/bin/bash

THRESHOLD=80

echo "===== Disk Usage Check ====="

df -h | grep '^/dev/' | while read filesystem size used avail percent mount
do
  usage=$(echo $percent | sed 's/%//')

  if [ "$usage" -ge "$THRESHOLD" ]; then
    echo "⚠️ ALERT: $filesystem mounted on $mount is ${usage}% full"
  else
    echo "✅ OK: $filesystem mounted on $mount is ${usage}% used"
  fi
done
