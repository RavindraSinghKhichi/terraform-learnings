### Outputs

output "instance_id" {
    value = aws_instance.ec2_instance.id
}

output "ami" {
  value = aws_instance.ec2_instance.ami
}

output "instance_security_group" {
  value = aws_instance.ec2_instance.security_groups
}

output "private_ip" {
  value = aws_instance.ec2_instance.private_ip
  sensitive = true
}

output "private_dns" {
  value = aws_instance.ec2_instance.private_dns
}
