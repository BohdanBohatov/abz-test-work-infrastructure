output "vpc_arn" {
  description = "VPC arn."
  value = aws_vpc.main.arn
}

output "vpc_id" {
  description = "VPC id."
  value = aws_vpc.main.id
}