resource "aws_secretsmanager_secret" "create_secret_subnet" {
  name                    = "${var.environment}/vpc"
  description             = "VPC Serverless Sunbet IDs"
  recovery_window_in_days = "0"
}

#used to create the secret value and pair for rds root user.
resource "aws_secretsmanager_secret_version" "subnet_secret" {
  secret_id = aws_secretsmanager_secret.create_secret_subnet.id
   secret_string = <<EOF
{
    "securityGroupIds": "${aws_security_group.vpc_endpoints.id}",
    "subnetIds": ["${aws_subnet.serverless_private[0].id}", "${aws_subnet.serverless_private[1].id}"]
}
EOF
}
