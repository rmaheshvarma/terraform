variable "ami" {
    type = "string"
    default = "ami-0cfee17793b08a293"
}

variable "secgroupids" {
  type = "list"
  default = ["sg-03fc8c398e05ec82f"]
}


variable "instancetype" {
    type = "string"
    default = "t2.micro"
  
}

variable "keyname" {
    type = "string"
    default = "mine"
  
}


variable "myaccesskey" {
  type = "string"
}

variable "mysecretkey" {
  type = "string"
}

variable "myregion" {
  type = "string"
  default = "us-east-1"
}
