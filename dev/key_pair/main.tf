module "vpc" {
  source = "../../modules/key_pair"

  env      = "dev"
  key_path = file("~/.ssh/asus-laptop.pub")
}