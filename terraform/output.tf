output "vpc_id" {
  description = "ID of the enterprise VPC"
  value       = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "IDs of public subnets"
  value       = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  description = "IDs of private subnets"
  value       = aws_subnet.private[*].id
}

output "web_security_group_id" {
  description = "Web tier Security Group ID"
  value       = aws_security_group.web.id
}

output "app_security_group_id" {
  description = "Application tier Security Group ID"
  value       = aws_security_group.app.id
}

output "database_security_group_id" {
  description = "Database tier Security Group ID"
  value       = aws_security_group.database.id
}
