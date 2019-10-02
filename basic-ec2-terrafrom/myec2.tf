resource "aws_instance" "myec2" {
    ami= "${var.ami}"
    instance_type = "${var.instancetype}"
    key_name = "${var.keyname}"
    vpc_security_group_ids = "${var.secgroupids}"

}

output "publicip" {
  value = "${aws_instance.myec2.public_ip}"
}
