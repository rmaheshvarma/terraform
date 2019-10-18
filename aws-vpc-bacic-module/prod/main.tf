provider "aws" {
  access_key = "${var.myaccesskey}"
  secret_key = "${var.mysecretkey}"
  region = "${var.myregion}"
}

module "my_vpc" {
  source      = "../modules/vpc"
  vpc_cidr    = "192.168.0.0/16"
  tenancy     = "default"
  vpc_id      = "${module.my_vpc.vpc_id}"
  subnet_cidr = "192.168.1.0/24"
}

module "my_ec2" {
  source        = "../modules/ec2"
  ec2_count     = 2
  ami_id        = "ami-0bce08e823ed38bdd"
  instance_type = "t2.micro"
  subnet_id     = "${module.my_vpc.subnet_id}"
}
  
