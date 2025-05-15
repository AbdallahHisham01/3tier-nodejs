output "main-subnet-id" {
  value = aws_subnet.main-subnet.id
}

output "secondary-subnet-id" {
  value = aws_subnet.secondary-subnet.id
}
output "main-priv-subnet-id" {
  value = aws_subnet.main-priv-subnet.id
}

output "sec-priv-subnet-id" {
  value = aws_subnet.secondary-priv-subnet.id
}
output "nat-subnet-id" {
  value = aws_subnet.nat-subnet.id
}