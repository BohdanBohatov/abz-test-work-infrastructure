resource "aws_s3_bucket" "CodeDeploy_S3_Bucket" {
  bucket = "${var.env}-codeDeploy-s3-bucket"

  tags = {
    Name        = "${var.env}-codeDeploy-s3-bucket"
    Environment = "${var.env}"
  }
}