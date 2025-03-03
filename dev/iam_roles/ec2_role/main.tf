module "ec2_role" {
  source = "../../../modules/iam_roles/ec2_role"

  env              = "dev"
  mysql_secret_arn = data.terraform_remote_state.mysql.outputs.secret_arn
}