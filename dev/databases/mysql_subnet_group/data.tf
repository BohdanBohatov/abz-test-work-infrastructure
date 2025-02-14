data "terraform_remote_state" "subnets" {
  backend = "local"
  config = {
    path = "../../subnet/terraform.tfstate"
  }
}