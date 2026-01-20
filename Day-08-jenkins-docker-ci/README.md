Day 08 – Jenkins CI Pipeline with Docker
📌 Project Overview

This project demonstrates how to build a CI pipeline using Jenkins to automatically build and run a Dockerized web application from a GitHub repository.
The pipeline pulls source code, builds a Docker image, and runs the application container automatically.

This project simulates a real-world CI workflow used in DevOps teams.

🛠️ Tools & Technologies Used

Jenkins (CI automation)

Docker (containerization)

Git & GitHub (version control)

Linux (Ubuntu / WSL)

Python (Flask web app)

📂 Project Structure
Day-08-jenkins-docker-ci/
├── app.py
├── Dockerfile
├── requirements.txt
├── Jenkinsfile
└── README.md

⚙️ What This Project Does

Jenkins pulls the source code from GitHub

Jenkins reads the Jenkinsfile

Docker image is built automatically

Old container is stopped and removed (if exists)

New container is launched

Application is accessible on localhost:5000

🧪 Local Validation (Before CI)

Before running Jenkins, the application was:

Built locally using Docker

Tested on http://localhost:5000

Verified to work correctly

This follows best DevOps practice:

Fix locally → Test locally → Commit → CI build

🧾 Jenkins Pipeline (Jenkinsfile)
pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                sh '''
                cd Day-08-jenkins-docker-ci
                docker build -t day08-jenkins-app .
                '''
            }
        }

        stage('Run Container') {
            steps {
                sh '''
                docker stop day08-ci || true
                docker rm day08-ci || true
                docker run -d --network host --name day08-ci day08-jenkins-app
                '''
            }
        }
    }
}

🔍 Key Challenges Faced & Fixes

Docker not found in Jenkins
→ Installed Docker CLI inside Jenkins container

Dockerfile not found error
→ Fixed by changing directory inside Jenkinsfile

Permission issues
→ Mounted Docker socket and added Jenkins to Docker group

These issues reflect real production CI debugging scenarios.

📈 Skills Demonstrated

Jenkins CI pipeline creation

Docker image build & container deployment

CI troubleshooting and debugging

GitHub integration with Jenkins

Real-world DevOps workflow implementation

🎯 Outcome

Jenkins pipeline runs successfully (GREEN build)

Docker container runs automatically

Application accessible at:

http://localhost:5000
