data "terraform_remote_state" "subnets" {
  backend = "local"
  config = {
    path = "../subnet/terraform.tfstate"
  }
}

data "terraform_remote_state" "key_pair" {
  backend = "local"
  config = {
    path = "../key_pair/terraform.tfstate"
  }
}

data "terraform_remote_state" "ec2_security_group" {
  backend = "local"
  config = {
    path = "../ec2_security_groups/terraform.tfstate"
  }
}