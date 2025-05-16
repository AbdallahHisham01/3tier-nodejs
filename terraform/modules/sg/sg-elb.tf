resource "aws_security_group" "elb-sg" {
  name = "elb-sg"
  vpc_id = var.vpc_id
}

resource "aws_vpc_security_group_ingress_rule" "elb-ingress-http" {
  security_group_id = aws_security_group.elb-sg.id
  cidr_ipv4 = "0.0.0.0/0"
  ip_protocol = "tcp"
  from_port = 80
  to_port = 80
}

resource "aws_vpc_security_group_ingress_rule" "elb-ingress-jenkins" {
  security_group_id = aws_security_group.elb-sg.id
  cidr_ipv4 = "0.0.0.0/0"
  ip_protocol = "tcp"
  from_port = 8080
  to_port = 8080
}

resource "aws_vpc_security_group_egress_rule" "elb-egress-to-ec2" {
  security_group_id = aws_security_group.elb-sg.id
  ip_protocol       = "-1"
  cidr_ipv4         = var.vpc_cidr
}
