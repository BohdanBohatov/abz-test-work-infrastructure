output "mysql_subnet_group_id" {
  description = "MySql subnet group ID."
  value       = aws_db_subnet_group.mysql_subnet_group.id
}

output "mysql_subnet_group_name" {
  description = "MySql subnet group name."
  value       = aws_db_subnet_group.mysql_subnet_group.name
}

