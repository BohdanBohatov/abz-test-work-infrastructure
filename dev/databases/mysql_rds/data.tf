data "terraform_remote_state" "vpc" {
  backend = "local"
  config = {
    path = "../../vpc/terraform.tfstate"
  }
}

data "terraform_remote_state" "mysql_security_group_id" {
  backend = "local"
  config = {
    path = "../../security_groups/mysql_security_group/terraform.tfstate"
  }
}

data "terraform_remote_state" "mysql_subnet_group_id" {
  backend = "local"
  config = {
    path = "../mysql_subnet_group/terraform.tfstate"
  }
}
