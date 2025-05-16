resource "aws_instance" "main" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key
  subnet_id = var.main-priv-subnet-id
  vpc_security_group_ids = [ var.sg-ec2 ]
  tags = {
    Name = "main" 
  }
}

resource "aws_instance" "secondary" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key
  subnet_id = var.secondary-priv-subnet-id
  vpc_security_group_ids = [ var.sg-ec2 ]
  tags = {
    Name = "secondary" 
  }
}

resource "aws_instance" "bastion" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key
  subnet_id = var.main-subnet-id
  vpc_security_group_ids = [ var.sg-bastion ]
  associate_public_ip_address = true
  tags = {
    Name = "bastion"
  }
}

resource "aws_instance" "jenkins" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key
  subnet_id = var.main-priv-subnet-id
  vpc_security_group_ids = [ var.sg-ec2 ]
  tags = {
    Name = "Jenkins" 
  }
}