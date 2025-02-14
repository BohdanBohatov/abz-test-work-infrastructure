module "mysql_subnet_group" {
  source = "../../../modules/databases/mysql_subnet_group"

  env = "dev"
  private_subnet_ids = tolist([data.terraform_remote_state.subnets.outputs.private_subnet_1_id,
  data.terraform_remote_state.subnets.outputs.private_subnet_2_id])
}