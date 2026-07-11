data "aws_ami" "amazon_linux" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023*-kernel-6.1-x86_64"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_key_pair" "day12_key" {
  key_name   = "day12-terraform-key"
  public_key = file("/home/nisha/.ssh/day12-terraform-key.pub")
}
resource "aws_sns_topic" "cloudwatch_alerts" {
  name = "${local.project_name}-ec2-cpu-alarm"

  tags = merge(
    local.common_tags,
    {
      Name = "${local.project_name}-cloudwatch-alerts"
    }
  )
}
resource "aws_sns_topic_subscription" "email_notification" {
  topic_arn = aws_sns_topic.cloudwatch_alerts.arn
  protocol  = "email"
  endpoint  = var.notification_email
}
resource "aws_cloudwatch_metric_alarm" "cpu_alarm" {
  alarm_name          = "day12-ec2-cpu-alarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 300
  statistic           = "Average"
  threshold           = 50

  alarm_description = "Alarm when EC2 CPU exceeds 50%"

  dimensions = {
    InstanceId = aws_instance.day12_ec2.id
  }

  alarm_actions = [
    aws_sns_topic.cloudwatch_alerts.arn
  ]

  tags = {
    Name = "day12-ec2-cpu-alarm"
  }
}
resource "aws_security_group" "devops_sg" {
  name        = "${local.project_name}-cloudwatch-sg"
  description = "Security group for Day 12 EC2 instance"

  ingress {
    description = "SSH Access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP Access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    local.common_tags,
    {
      Name = "${local.project_name}-cloudwatch-sg"
    }
  )
}

resource "aws_instance" "day12_ec2" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.day12_key.key_name
  vpc_security_group_ids = [aws_security_group.devops_sg.id]


  monitoring = true

  tags = merge(
    local.common_tags,
    {
      Name = "${local.project_name}-cloudwatch-ec2"
    }
  )
}