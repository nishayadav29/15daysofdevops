# Day 12 - AWS CloudWatch Monitoring with Terraform

## 📌 Project Overview

This project demonstrates how to provision AWS infrastructure using Terraform and monitor an EC2 instance using Amazon CloudWatch. A CloudWatch alarm was configured to monitor CPU utilization and trigger an Amazon SNS notification when CPU usage exceeded the configured threshold.

---

## 🛠 Technologies Used

- Terraform
- AWS EC2
- Amazon CloudWatch
- Amazon SNS
- Amazon Linux 2023
- Bash
- SSH

---

## 📁 Project Structure


Day-12-cloudwatch-monitoring/
│── main.tf
│── variables.tf
│── outputs.tf
│── terraform.tfvars
│── provider.tf
│── .gitignore
│── README.md
└── screenshots/


---

## 🚀 Infrastructure Provisioned

- EC2 Instance
- Security Group
- AWS Key Pair
- CloudWatch Metrics
- CloudWatch Alarm
- Amazon SNS Topic

---

## 📊 Monitoring Workflow


Terraform
│
▼
EC2 Instance
│
▼
CloudWatch Metrics
│
▼
CloudWatch Alarm
│
▼
Amazon SNS


---

## 🧪 Testing

A CPU stress test was performed using:

```bash
stress --cpu 2 --timeout 300
The CPU utilization exceeded the configured threshold, causing the CloudWatch alarm to transition to the ALARM state.

🔍 Troubleshooting

During testing, the CloudWatch alarm initially monitored an outdated EC2 Instance ID because Terraform recreated the instance after adding an AWS Key Pair.

The alarm was updated to monitor the newly created EC2 instance, after which it successfully entered the ALARM state.

This demonstrates a common Infrastructure as Code scenario where dependent resources must reference the current infrastructure.

📸 Screenshots
Terraform Apply
EC2 Instance
CloudWatch Alarm
CPU Utilization Graph
Alarm History
Stress Test
🎯 Learning Outcomes
Provision infrastructure using Terraform
Create reusable AWS infrastructure
Configure CloudWatch metrics and alarms
Generate CPU load using Linux tools
Monitor EC2 health
Troubleshoot CloudWatch alarms
Understand infrastructure recreation with Terraform
👩‍💻 Author

Nisha Yadav