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

variable "rds_private_subnet_cidr_blocks" {
  type        = list
  description = "List of private subnet CIDR blocks"
}



variable "availability_zones" {
  type        = list
  description = "List of availability zones"
}




variable "backup_retention_period" {
  type        = string
  description = "backup_retention_period"
}


variable "engine" {
  type        = string
  description = "RDS engine like mysql postgress"
}

variable "engine_version" {
  type        = string
  description = "engine_version"
}

variable "identifier" {
  default     = ""
  type        = string
  description = "identifier"
}

variable "instance_class" {
  default     = ""
  type        = string
  description = "RDS DB instance_class"
}

variable "multi_az" {
  type        = bool
  description = "multi_az"
}

variable "name" {
  default     = ""
  type        = string
  description = "name"
}

variable "password" {
  default     = ""
  type        = string
  description = "password"
}

variable "publicly_accessible" {
  type        = bool
  description = "publicly_accessible"
}

variable "storage_encrypted" {
  type        = bool
  description = "storage_encrypted"
}

variable "storage_type" {
  default     = ""
  type        = string
  description = "storage_type"
}

variable "username" {
  default     = ""
  type        = string
  description = "username"
}

variable "allocated_storage" {
  default     = ""
  type        = string
  description = "allocated_storage"
}


variable "port" {
  default     = ""
  type        = string
  description = "Port"
}










