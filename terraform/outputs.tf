# Instance Information
output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.web.public_ip
}

output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.web.id
}

# SSH Connection
output "ssh_command" {
  description = "SSH command to connect to the instance"
  value       = "ssh -i royal-hotel-key.pem ec2-user@${aws_instance.web.public_ip}"
}

# Infrastructure Details
output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.main.id
}

output "security_group_id" {
  description = "ID of the security group"
  value       = aws_security_group.web.id
}
