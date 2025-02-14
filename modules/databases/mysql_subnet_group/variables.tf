variable "env" {
  description = "Environment."
}

variable "private_subnet_ids" {
  description = "Private subnets ids."
  type        = list(string)
}