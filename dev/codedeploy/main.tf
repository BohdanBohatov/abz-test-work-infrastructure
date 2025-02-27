module "wordpress_codedeploy" {
  source = "../../modules/codedeploy"

  env = "dev"
}