data "terraform_remote_state" "mysql" {
  backend = "local"
  config = {
    path = "../../databases/mysql_rds/terraform.tfstate"
  }
}