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


#Internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = var.vpc_id

  tags = {
    Name = "${var.env}-igw"
  }
}


#Route tables
resource "aws_route_table" "public_route_table" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.env}-public-rt"
  }
}

resource "aws_route_table" "private_route_table" {
  vpc_id = var.vpc_id

  route {
    cidr_block = var.vpc_cidr_block
    gateway_id = "local"
  }

  tags = {
    Name = "${var.env}-private-rt"
  }
}


#Route table association
resource "aws_route_table_association" "public_1st_subnet_route_table_association" {
  subnet_id      = aws_subnet.public_zone_1.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "public_2nd_subnet_route_table_association" {
  subnet_id      = aws_subnet.public_zone_2.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "private_1nd_subnet_route_table_association" {
  subnet_id      = aws_subnet.private_zone_1.id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route_table_association" "private_2nd_subnet_route_table_association" {
  subnet_id      = aws_subnet.private_zone_2.id
  route_table_id = aws_route_table.private_route_table.id
}