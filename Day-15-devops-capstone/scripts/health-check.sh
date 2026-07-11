#!/bin/bash

URL="http://localhost:8080"

echo "========================================="
echo "        APPLICATION HEALTH CHECK"
echo "========================================="
echo

for i in {1..10}
do
    STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$URL")

    if [ "$STATUS" -eq 200 ]; then
        echo "Application Status : RUNNING"
        echo "HTTP Status Code  : $STATUS"
        echo "Health Check      : PASSED"
        exit 0
    fi

    echo "Waiting for application... ($i/10)"
    sleep 2
done

echo "Application Status : DOWN"
echo "HTTP Status Code  : $STATUS"
echo "Health Check      : FAILED"

exit 1