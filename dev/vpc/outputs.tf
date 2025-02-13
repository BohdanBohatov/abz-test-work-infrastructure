output "vpc_id" {
  description = "VPC id."
  value       = module.vpc.vpc_id
}

output "vpc_arn" {
  description = "VPC arn."
  value       = module.vpc.vpc_arn
}