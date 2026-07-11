#!/bin/bash

URL="http://localhost:8080"

echo "========================================="
echo "        APPLICATION HEALTH CHECK"
echo "========================================="
echo

STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$URL")

if [ "$STATUS" -eq 200 ]; then
    echo "Application Status : RUNNING"
    echo "HTTP Status Code  : $STATUS"
    echo "Health Check      : PASSED"
    exit 0
else
    echo "Application Status : DOWN"
    echo "HTTP Status Code  : $STATUS"
    echo "Health Check      : FAILED"
    exit 1
fi