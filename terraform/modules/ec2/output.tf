output "ec2-id" {
  value = aws_instance.main.id
}
output "secondary-id" {
  value = aws_instance.secondary.id
}