output "sg-ec2" {
  value = aws_security_group.ec2-sg.id
}

output "sg-elb" {
  value = aws_security_group.elb-sg.id
}

output "sg-bastion" {
  value = aws_security_group.bastion_sg.id
}