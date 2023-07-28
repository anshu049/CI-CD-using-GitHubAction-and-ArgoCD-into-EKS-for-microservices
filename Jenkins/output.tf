output "ec2_public_ip" {
  description = "EC2 Public IP"
  value       = aws_instance.instance1.public_ip
}