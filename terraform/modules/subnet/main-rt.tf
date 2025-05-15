resource "aws_internet_gateway" "main-igw" {
  vpc_id = var.vpc_id
  tags = {
    Name = "main-igw"
  }
}

resource "aws_route_table" "main-rt" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main-igw.id
  }

  route {
     cidr_block = "10.0.0.0/16"
     gateway_id = "local"
  }

  tags = {
    Name = "main-rt"
  }
}

resource "aws_route_table_association" "main-rt-assoc" {
  subnet_id      = aws_subnet.main-subnet.id
  route_table_id = aws_route_table.main-rt.id
}

resource "aws_route_table_association" "sec-rt-assoc" {
  subnet_id      = aws_subnet.secondary-subnet.id
  route_table_id = aws_route_table.main-rt.id
}