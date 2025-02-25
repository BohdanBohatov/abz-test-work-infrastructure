module "ec2_role" {
  source = "../../../modules/iam_roles/ec2_role"

  env = "dev"
}