resource "aws_instance" "word_press_instance" {
  ami                    = var.instance_ami
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.security_group]
  key_name               = var.key_name

  tags = {
    "Name" = "${var.env}-WordPress-instance"
  }
}