resource "aws_route53_zone" "main" {
  name = "alphabetagamazeta.site"

  tags = {
    CreatedBy   = "Terraform"
    Name        = "${var.env}-route53"
    Environment = "${var.env}"
  }
}