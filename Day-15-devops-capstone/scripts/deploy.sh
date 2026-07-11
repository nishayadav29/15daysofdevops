#!/bin/bash

IMAGE_NAME="day15-capstone"
CONTAINER_NAME="day15-container"

echo "========================================="
echo "       DEPLOYMENT STARTED"
echo "========================================="
echo

echo "Stopping existing container..."

docker stop $CONTAINER_NAME 2>/dev/null
docker rm $CONTAINER_NAME 2>/dev/null

echo
echo "Starting new container..."

docker run -d \
--name $CONTAINER_NAME \
-p 8080:80 \
$IMAGE_NAME

echo
echo "Deployment Completed Successfully."