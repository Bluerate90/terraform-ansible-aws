[webserver]
${server_ip} ansible_user=ec2-user ansible_ssh_private_key_file=../terraform/royal-hotel-key.pem ansible_ssh_common_args='-o StrictHostKeyChecking=no'
