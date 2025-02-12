resource "aws_subnet" "private_zone_1" {
  vpc_id            = var.vpc_id
  cidr_block        = var.cidr_block_private_subnet_1
  availability_zone = var.availability_zone_1
  tags = {
    "Name" = "${var.env}-private_zone_1"
  }
}

resource "aws_subnet" "public_zone_1" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.cidr_block_public_subnet_1
  availability_zone       = var.availability_zone_1
  map_public_ip_on_launch = true
  tags = {
    "Name" = "${var.env}-public_zone_1"
  }
}

resource "aws_subnet" "private_zone_2" {
  vpc_id            = var.vpc_id
  cidr_block        = var.cidr_block_private_subnet_2
  availability_zone = var.availability_zone_2
  tags = {
    "Name" = "${var.env}-private_zone_2"
  }
}

resource "aws_subnet" "public_zone_2" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.cidr_block_public_subnet_2
  availability_zone       = var.availability_zone_2
  map_public_ip_on_launch = true
  tags = {
    "Name" = "${var.env}-public_zone_2"
  }
}