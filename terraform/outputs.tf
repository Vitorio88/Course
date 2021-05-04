output "rds_endpoint" {
  description = "The address of the RDS instance"
  value       = aws_db_instance.lesson9-rds.endpoint
}

output "ec2_endpoint" {
  description = "The address of the EC2 instance"
  value       = aws_instance.linux-instance.public_ip
}
