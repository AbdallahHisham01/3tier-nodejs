resource "aws_subnet" "nat-subnet" {
  vpc_id = var.vpc_id
  cidr_block = "10.0.4.0/24"
}

resource "aws_route_table_association" "nat-assoc-nat" {
  route_table_id = aws_route_table.main-rt.id
  subnet_id = aws_subnet.nat-subnet.id
}