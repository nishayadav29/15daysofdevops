# Day 09 – Docker App Deployment on AWS EC2

## Overview
In this project, a Dockerized web application was deployed on an AWS EC2 instance and exposed using a public IP address.

The application was accessed successfully via browser after configuring EC2 security groups.

## Tech Stack
- AWS EC2 (Amazon Linux 2023)
- Docker
- Linux
- SSH
- Git

## What Was Done
- Launched an EC2 instance
- Connected via SSH using PEM key
- Installed Docker on EC2
- Built Docker image on EC2
- Ran container exposing port 5000
- Configured Security Group to allow inbound traffic
- Accessed app using EC2 public IP

## Verification
Application accessible at:
http://<EC2_PUBLIC_IP>:5000


## Key Learning
- Cloud VM deployment
- Docker on AWS EC2
- Security Groups & networking
- Real-world deployment debugging

