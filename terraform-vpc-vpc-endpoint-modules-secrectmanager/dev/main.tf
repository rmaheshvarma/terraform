
provider "aws" {
  region = "${var.aws_region}"
}



module "my_vpc" {
 source      = "../modules/vpc"
 aws_region = var.aws_region
 cidr_block = var.cidr_block
 availability_zones = var.availability_zones
 public_subnet_cidr_blocks = var.public_subnet_cidr_blocks
 private_subnet_cidr_blocks = var.private_subnet_cidr_blocks
 db_subnet_cidr_blocks =  var.db_subnet_cidr_blocks
 serverless_subnet_cidr_blocks = var.serverless_subnet_cidr_blocks
 environment = var.environment
 endpoint_secretsmanager = var.endpoint_secretsmanager
 endpoint_lambda = var.endpoint_lambda
 endpoint_rds = var.endpoint_rds

}


