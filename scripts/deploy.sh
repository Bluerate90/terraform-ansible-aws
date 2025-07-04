#!/bin/bash

# Royal Hotel Infrastructure Deployment Script
# This script automates the complete deployment process

set -e

echo "🚀 Starting Royal Hotel Infrastructure Deployment..."
echo "================================================="

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check prerequisites
print_status "Checking prerequisites..."

# Check if AWS CLI is configured
if ! aws sts get-caller-identity &> /dev/null; then
    print_error "AWS CLI is not configured. Please run 'aws configure' first."
    exit 1
fi

# Check if Terraform is installed
if ! command -v terraform &> /dev/null; then
    print_error "Terraform is not installed. Please install Terraform first."
    exit 1
fi

# Check if Ansible is installed
if ! command -v ansible &> /dev/null; then
    print_error "Ansible is not installed. Please install Ansible first."
    exit 1
fi

print_success "All prerequisites met!"

# Deploy infrastructure with Terraform
print_status "Deploying AWS infrastructure with Terraform..."
cd terraform/

# Initialize Terraform
print_status "Initializing Terraform..."
terraform init

# Plan the deployment
print_status "Creating Terraform plan..."
terraform plan -out=tfplan

# Apply the plan
print_status "Applying Terraform configuration..."
terraform apply tfplan

# Get outputs
INSTANCE_IP=$(terraform output -raw instance_public_ip)
INSTANCE_ID=$(terraform output -raw instance_id)

print_success "Infrastructure deployed successfully!"
echo "Instance ID: $INSTANCE_ID"
echo "Instance IP: $INSTANCE_IP"

# Wait for instance to be ready
print_status "Waiting for instance to be ready..."
aws ec2 wait instance-running --instance-ids $INSTANCE_ID
print_success "Instance is running!"

# Wait a bit more for SSH to be available
print_status "Waiting for SSH to be available..."
sleep 30

# Test SSH connectivity
print_status "Testing SSH connectivity..."
max_attempts=12
attempt=1

while [ $attempt -le $max_attempts ]; do
    if ssh -i royal-hotel-key.pem -o StrictHostKeyChecking=no -o ConnectTimeout=5 ec2-user@$INSTANCE_IP "echo 'SSH connection successful'" &> /dev/null; then
        print_success "SSH connection established!"
        break
    else
        print_warning "SSH attempt $attempt/$max_attempts failed. Retrying in 10 seconds..."
        sleep 10
        ((attempt++))
    fi
done

if [ $attempt -gt $max_attempts ]; then
    print_error "Could not establish SSH connection after $max_attempts attempts."
    exit 1
fi

# Run Ansible configuration
print_status "Configuring server with Ansible..."
cd ../ansible/

# Run the playbook
ansible-playbook -i inventory.ini playbook.yml

print_success "Server configuration completed!"

# Final summary
echo ""
echo "🎉 Deployment Completed Successfully!"
echo "====================================="
echo "Instance IP: $INSTANCE_IP"
echo "SSH Command: ssh -i terraform/royal-hotel-key.pem ec2-user@$INSTANCE_IP"
echo ""
echo "Your Royal Hotel development server is ready for use!"
echo "Check /opt/royal-hotel/server-info.txt on the server for more details."

# Return to original directory
cd ..
