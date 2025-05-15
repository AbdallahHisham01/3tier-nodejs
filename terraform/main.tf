module "vpc" {
  source = "./modules/vpc"
}

module "subnet" {
  source = "./modules/subnet"
  vpc_id = module.vpc.vpc_id
  nat_gateway_id = module.natgw.nat_gateway_id
}

module "sg" {
  source = "./modules/sg"
  vpc_id = module.vpc.vpc_id
  vpc_cidr = module.vpc.vpc_cidr
}

module "key" {
  source = "./modules/key"
}

module "ec2" {
  source = "./modules/ec2"
  main-priv-subnet-id = module.subnet.main-priv-subnet-id
  secondary-priv-subnet-id = module.subnet.sec-priv-subnet-id
  sg-ec2 = module.sg.sg-ec2
  main-subnet-id = module.subnet.main-subnet-id
  sg-bastion = module.sg.sg-bastion
}

module "elb" {
  source = "./modules/elb"
  sg-elb = module.sg.sg-elb
  secondary-subnet-id = module.subnet.secondary-subnet-id
  main-subnet-id = module.subnet.main-subnet-id
  ec2-id = module.ec2.ec2-id
  secondary-id = module.ec2.secondary-id
  vpc_id = module.vpc.vpc_id
}

module "natgw" {
  source = "./modules/natgw"
  main-subnet-id = module.subnet.main-subnet-id
  vpc_id = module.vpc.vpc_id
  nat-subnet-id = module.subnet.nat-subnet-id
}