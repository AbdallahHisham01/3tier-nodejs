output "vpc_id" {
  value = aws_vpc.main-vpc.id
}

output "vpc_cidr" {
  value = aws_vpc.main-vpc.cidr_block
}