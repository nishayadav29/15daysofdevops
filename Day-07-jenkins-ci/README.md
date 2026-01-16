# Day 07 – Jenkins Continuous Integration (CI)

## Objective
To set up Jenkins and create a Continuous Integration job connected to a GitHub repository.

## Tools Used
- Jenkins
- Docker
- Git
- GitHub
- Linux (WSL)

## Jenkins Setup
- Jenkins installed using Docker
- Jenkins accessed via http://localhost:8080
- Initial admin password retrieved from container

## CI Job Configuration
- Job Type: Freestyle Project
- Source Code Management: Git
- Repository: https://github.com/nishayadav29/15daysofdevops.git
- Branch: main

## Build Steps
```bash
echo "CI build started"
ls
echo "CI build completed successfully"

