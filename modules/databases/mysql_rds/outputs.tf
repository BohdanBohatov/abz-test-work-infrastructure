output "mysql_endpoint" {
  description = "MySql instance endpoint."
  value       = aws_db_instance.mysql.endpoint
}

output "mysql_id" {
  description = "MySql instance ID"
  value       = aws_db_instance.mysql.id
}
