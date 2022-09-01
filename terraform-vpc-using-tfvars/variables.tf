#variable "access_key" {
#     description = "Access key to AWS console"
     
#}
#variable "secret_key" {
#     description = "Secret key to AWS console"
     
#}

variable "region" {
  default     = ""
  type        = string
  description = "Region of the VPC"
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
variable "web_app_subnet_cidr_blocks" {
  type        = list
  description = "List of private subnet CIDR blocks"
}


variable "availability_zones" {
  type        = list
  description = "List of availability zones"
}




