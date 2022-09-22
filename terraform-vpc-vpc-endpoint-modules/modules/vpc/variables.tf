
variable "aws_region" {
  default     = ""
  type        = string
  description = "Region of the VPC"
}


variable "availability_zones" {
  type        = list
}

variable "cidr_block" {
  default     = ""
  type        = string
  description = "CIDR block for the VPC"
}

variable "public_subnet_cidr_blocks" {
  type        = list
  description = "List of public subnet CIDR blocks"
}

variable "private_subnet_cidr_blocks" {
  type        = list
  description = "List of private subnet CIDR blocks"
}


variable "db_subnet_cidr_blocks" {
  type        = list
  description = "List of private subnet CIDR blocks"
}


variable "serverless_subnet_cidr_blocks" {
  type        = list
  description = "List of private subnet CIDR blocks"
}

variable "environment" {
  description = "A logical name that will be used as prefix and tag for the created resources."
  type        = string
  default     = ""
}


variable "endpoint_secretsmanager" {
  type        = string
  description = "List of private subnet CIDR blocks"
}

variable "endpoint_lambda" {
  type        = string
  description = "List of private subnet CIDR blocks"
}

variable "endpoint_rds" {
  type        = string
  description = "List of private subnet CIDR blocks"
}
