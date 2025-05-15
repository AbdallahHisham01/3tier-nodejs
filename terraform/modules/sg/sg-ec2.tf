resource "aws_security_group" "ec2-sg" {
  name = "ec2-sg"
  vpc_id = var.vpc_id
}

resource "aws_vpc_security_group_ingress_rule" "ec2-ingress-http" {
  security_group_id = aws_security_group.ec2-sg.id
  cidr_ipv4 = var.vpc_cidr
  ip_protocol = "tcp"
  from_port = "80"
  to_port = "80"
}

resource "aws_vpc_security_group_ingress_rule" "ec2-ingress-ssh" {
  cidr_ipv4 = var.vpc_cidr
  security_group_id = aws_security_group.ec2-sg.id
  ip_protocol = "tcp"
  from_port = 22
  to_port = 22
}

resource "aws_vpc_security_group_ingress_rule" "ec2-ingress-icmp" {
  security_group_id = aws_security_group.ec2-sg.id
  cidr_ipv4 = "0.0.0.0/0" 
  ip_protocol = "icmp"
  from_port = "-1"
  to_port = "-1"
}

resource "aws_vpc_security_group_egress_rule" "ec2-egress-all" {
  cidr_ipv4 = "0.0.0.0/0"
  security_group_id = aws_security_group.ec2-sg.id
  ip_protocol = "-1"
}