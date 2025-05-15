resource "aws_route_table" "nat-route-table" {
  vpc_id = var.vpc_id
  tags = {
    Name = "nat-rt"
  }
}

resource "aws_route" "nat_route" {
  route_table_id         = aws_route_table.nat-route-table.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = var.nat_gateway_id
}

resource "aws_route_table_association" "nat-rt-main" {
  subnet_id      = aws_subnet.main-priv-subnet.id
  route_table_id = aws_route_table.nat-route-table.id
}

resource "aws_route_table_association" "nat-rt-sec" {
  subnet_id      = aws_subnet.secondary-priv-subnet.id
  route_table_id = aws_route_table.nat-route-table.id
}
