variable "aws_region" {
  default     = "us-east-1"
  type        = string
  description = "Region of the VPC"
}

variable "cidr_block" {
  default     = "10.0.0.0/16"
  type        = string
  description = "CIDR block for the VPC"
}

variable "availability_zones" {
  type        = list
  default     = ["us-east-1a", "us-east-1b"]
}

variable "public_subnet_cidr_blocks" {
  type        = list
  description = "List of public subnet CIDR blocks"
  default    = ["10.0.0.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidr_blocks" {
  type        = list
  description = "List of private subnet CIDR blocks"
  default  =   ["10.0.1.0/24", "10.0.3.0/24"]
}


variable "db_subnet_cidr_blocks" {
  type        = list
  description = "List of private subnet CIDR blocks"
  default  = ["10.0.4.0/24", "10.0.5.0/24"]
}


variable "serverless_subnet_cidr_blocks" {
  type        = list
  description = "List of private subnet CIDR blocks"
  default = ["10.0.6.0/24", "10.0.7.0/24"]
}

variable "environment" {
  description = "A logical name that will be used as prefix and tag for the created resources."
  type        = string
  default     = "dev"
}


variable "endpoint_secretsmanager" {
  type        = string
  description = "List of private subnet CIDR blocks"
  default = "com.amazonaws.us-east-1.secretsmanager"
}

variable "endpoint_lambda" {
  type        = string
  description = "List of private subnet CIDR blocks"
  default = "com.amazonaws.us-east-1.lambda"
}

variable "endpoint_rds" {
  type        = string
  description = "List of private subnet CIDR blocks"
  default = "com.amazonaws.us-east-1.rds"
}



