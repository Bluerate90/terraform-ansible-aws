# terraform-ansible-aws

# Infrastructure Automation with Terraform & Ansible

> **DevOps Project**: Automated AWS infrastructure provisioning and configuration management

## 🚀 Project Overview

This project demonstrates **Infrastructure as Code (IaC)** by automating the provisioning of AWS infrastructure using **Terraform** and configuring it with **Ansible**. Built for Royal Hotel's development environment automation needs.

## 🎯 What This Project Does

- **Provisions AWS Infrastructure**: Creates VPC, subnets, security groups, and EC2 instances
- **Automates Configuration**: Installs and configures development tools via Ansible
- **Integrates Tools**: Terraform triggers Ansible playbooks automatically
- **Ensures Consistency**: Repeatable, version-controlled infrastructure setup

## 🛠️ Tech Stack

| Tool | Purpose |
|------|---------|
| **Terraform** | Infrastructure provisioning |
| **Ansible** | Configuration management |
| **AWS** | Cloud provider |
| **Linux** | Operating system |

## 📁 Repository Structure

```
terraform-ansible-aws/
├── README.md              # Professional project documentation
├── .gitignore            # Security and cleanup
├── terraform/
│   ├── main.tf           # Core infrastructure code
│   ├── variables.tf      # Configuration variables
│   ├── outputs.tf        # Important outputs
│   └── inventory.tpl     # Ansible inventory template
├── ansible/
│   ├── playbook.yml      # Server configuration
│   └── ansible.cfg       # Ansible settings
└── scripts/
    └── deploy.sh         # One-click deployment
```

## ⚡ Quick Start

### Prerequisites
```bash
# Install required tools
sudo apt update
sudo apt install -y awscli terraform ansible
aws configure  # Set your AWS credentials
```

### Deploy Infrastructure
```bash
# Clone repository
git clone https://github.com/Bluerate90/terraform-ansible-aws.git
cd terraform-ansible-aws

# Deploy everything
chmod +x scripts/deploy.sh
./scripts/deploy.sh
```

### Manual Steps
```bash
# 1. Provision infrastructure
cd terraform/
terraform init
terraform plan
terraform apply

# 2. Configure servers
cd ../ansible/
ansible-playbook -i inventory.ini playbook.yml
```

## 🏗️ Infrastructure Architecture

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Developer     │    │   Terraform     │    │   AWS Cloud     │
│   Workstation   │───▶│   Controller    │───▶│   Resources     │
└─────────────────┘    └─────────────────┘    └─────────────────┘
                                │                       ▲
                                │                       │
                                ▼                       │
                       ┌─────────────────┐              │
                       │   Ansible       │──────────────┘
                       │   Playbooks     │
                       └─────────────────┘
```

## 🔧 What Gets Created

### AWS Resources
- **VPC** with public subnet (10.0.0.0/16)
- **Internet Gateway** for public access
- **Security Group** allowing SSH, HTTP, HTTPS, and custom ports
- **EC2 Instance** (t2.micro) with Amazon Linux 2
- **Key Pair** for secure SSH access

### Server Configuration
- **Python 3** development environment
- **Maven** for Java projects
- **System updates** and security patches
- **Custom application directories**

## 📊 Key Features

✅ **Automated Infrastructure**: One-command deployment  
✅ **Version Control**: All infrastructure as code  
✅ **Idempotent**: Safe to run multiple times  
✅ **Scalable**: Easy to modify and extend  
✅ **Secure**: SSH key-based authentication  
✅ **Documented**: Clear, professional documentation  

## 🔍 Project Highlights

This project demonstrates:
- **DevOps Best Practices**: IaC, automation, documentation
- **Cloud Expertise**: AWS services and networking
- **Tool Integration**: Terraform + Ansible workflow
- **Security Awareness**: Proper key management and access control
- **Problem Solving**: Real-world hotel industry use case

## 🎓 Learning Outcomes

- Infrastructure as Code principles
- AWS networking and security
- Terraform resource management
- Ansible configuration management
- DevOps automation workflows
- Cloud cost optimization

## 💼 Professional Skills Showcased

- **Cloud Platforms**: AWS EC2, VPC, Security Groups
- **IaC Tools**: Terraform, Ansible
- **Scripting**: Bash, YAML, HCL
- **Networking**: VPC, subnets, routing
- **Security**: SSH keys, security groups
- **Documentation**: Professional README, code comments

## 🚀 Future Enhancements

- [ ] Multi-environment support (dev/staging/prod)
- [ ] Auto-scaling groups
- [ ] Load balancer integration
- [ ] CI/CD pipeline integration
- [ ] Monitoring and alerting
- [ ] Cost optimization

## 📞 Contact

**Your Name** - DevOps Engineer  
📧 tib9051@gmail.com  
🔗 [LinkedIn](https://linkedin.com/in/profile)  
🐙 [GitHub](https://github.com/Bluerate90)

---

*This project demonstrates practical DevOps skills in infrastructure automation and cloud management.*
