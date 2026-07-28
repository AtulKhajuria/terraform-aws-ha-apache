# Terraform AWS Highly Available Apache Web Server

A production-style Infrastructure as Code (IaC) project built with **Terraform** that deploys a highly available Apache web server on AWS.

The infrastructure is designed using modular Terraform code and follows AWS best practices by leveraging an Application Load Balancer, Auto Scaling Group, IAM Roles, and AWS Systems Manager Session Manager for secure administration.

---

# Architecture

```
                    Internet
                        │
                        │
                 Application Load Balancer
                        │
          ┌─────────────┴─────────────┐
          │                           │
     Public Subnet A             Public Subnet B
          │                           │
      EC2 Instance               EC2 Instance
          │                           │
          └─────────────┬─────────────┘
                        │
                Auto Scaling Group
                        │
               Launch Template
                        │
                Apache Web Server

```

---

# Project Structure

```
terraform-aws-ha-apache/
│
├── backend.tf
├── provider.tf
├── versions.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
├── locals.tf
│
├── modules/
│   ├── network/
│   ├── security/
│   ├── compute/
│   ├── alb/
│   └── iam/
│
└── README.md
```

---

# Features

## Networking

- Custom VPC
- Internet Gateway
- Public Route Table
- Two Public Subnets across different Availability Zones
- Highly available architecture

---

## Security

- Separate Security Groups for:
  - Application Load Balancer
  - EC2 Instances
- Least privilege IAM Role
- IAM Instance Profile
- AWS Systems Manager Session Manager (No SSH Required)

---

## Compute

- Latest Ubuntu AMI (Dynamic Lookup)
- Launch Template
- Apache installation using User Data
- Consistent resource tagging
- EBS Volume tagging

---

## Load Balancing

- Application Load Balancer
- HTTP Listener
- Target Group
- Health Checks

---

## Auto Scaling

- Auto Scaling Group
- Minimum Capacity: 2
- Desired Capacity: 2
- Maximum Capacity: 4
- Launch Template integration
- Automatic instance registration with Target Group

---

## Monitoring

CloudWatch Alarms for:

- High CPU Utilization
- Low CPU Utilization

Auto Scaling Policies:

- Scale Out (+1 Instance)
- Scale In (-1 Instance)

---

## Secure Instance Access

Instead of opening port **22**, this project uses:

- IAM Role
- Instance Profile
- AmazonSSMManagedInstanceCore Policy
- AWS Systems Manager Session Manager

This enables secure shell access without SSH keys or public SSH ports.

---

# Technologies Used

- Terraform
- AWS EC2
- AWS VPC
- Application Load Balancer
- Auto Scaling Group
- Launch Templates
- IAM
- AWS Systems Manager
- CloudWatch
- Apache HTTP Server

---

# Deployment

Initialize Terraform

```bash
terraform init
```

Validate Configuration

```bash
terraform validate
```

Review Execution Plan

```bash
terraform plan
```

Deploy Infrastructure

```bash
terraform apply
```

Destroy Infrastructure

```bash
terraform destroy
```

---

# Auto Scaling Test

SSH is intentionally disabled.

Connect to an instance using:

```
AWS Systems Manager
→ Session Manager
→ Start Session
```

Install stress tool

```bash
sudo apt update
sudo apt install stress -y
```

Generate CPU Load

```bash
stress --cpu 4 --timeout 600
```

Observe:

- CloudWatch Alarm changes to ALARM
- Auto Scaling Group launches a new EC2 instance
- New instance becomes healthy behind the ALB

---

# Security Highlights

- No SSH access
- No Key Pair required
- IAM-based authentication
- Systems Manager Session Manager
- Security Groups following least privilege
- Modular Terraform design

---

# Future Enhancements

- HTTPS using ACM
- Route53 Custom Domain
- AWS WAF
- ALB Access Logs
- CloudWatch Agent
- Instance Refresh
- GitHub Actions / Jenkins CI/CD Pipeline
- Private Subnets with NAT Gateway

---

# Learning Outcomes

This project demonstrates practical knowledge of:

- Infrastructure as Code (Terraform)
- Modular Terraform Architecture
- AWS Networking
- IAM Best Practices
- High Availability Design
- Load Balancing
- Auto Scaling
- Monitoring with CloudWatch
- Secure EC2 Administration using Systems Manager

---

# Author

**Atul Khajuria**

DevOps Engineer

Skills:
- Terraform
- AWS
- Docker
- Kubernetes
- Jenkins
- GitHub Actions
- Linux
- Bash