module "ec2_instance" {
  source = "../../modules/ec2"

  instance_ami   = "ami-087a0156cb826e921"
  instance_type  = "t2.micro"
  env            = "dev"
  subnet_id      = data.terraform_remote_state.subnets.outputs.public_subnet_1_id
  security_group = data.terraform_remote_state.ec2_security_group.outputs.security_group_id
  key_name       = data.terraform_remote_state.key_pair.outputs.key_name
}