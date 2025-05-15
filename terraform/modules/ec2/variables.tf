variable "sg-ec2" {}
variable "secondary-priv-subnet-id" {}
variable "main-priv-subnet-id" {}
variable "ami" {
    default = "ami-0e449927258d45bc4"
}
variable "instance_type" {
  default = "t2.micro"
}
variable "key" {
  default = "abdallah"
}
variable "main-subnet-id" {}
variable "sg-bastion" {}