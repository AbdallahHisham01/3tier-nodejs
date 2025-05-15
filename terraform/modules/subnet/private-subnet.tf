resource "aws_subnet" "main-priv-subnet" {
  vpc_id = var.vpc_id
  cidr_block = "10.0.2.0/24"
  availability_zone = var.main-az
}

resource "aws_subnet" "secondary-priv-subnet" {
  vpc_id = var.vpc_id
  cidr_block = "10.0.3.0/24"
  availability_zone = var.sec-az
}