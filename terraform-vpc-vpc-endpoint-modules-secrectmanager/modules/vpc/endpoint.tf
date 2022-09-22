resource "aws_vpc_endpoint" "secretsmanager" {
  service_name      = "${var.endpoint_secretsmanager}"
  subnet_ids        = aws_subnet.serverless_private[*].id
  vpc_id            = aws_vpc.default.id
  vpc_endpoint_type = "Interface"
  security_group_ids = [aws_security_group.vpc_endpoints.id]
  tags = {
    Name        = "${var.environment}-secretsmanager-endpoint"
    Environment = "${var.environment}"
  }
}



resource "aws_vpc_endpoint" "lambda" {
  service_name      = "${var.endpoint_lambda}"
  subnet_ids        = aws_subnet.serverless_private[*].id
  vpc_id            = aws_vpc.default.id
  vpc_endpoint_type = "Interface"
  security_group_ids = [aws_security_group.vpc_endpoints.id]
  tags = {
    Name        = "${var.environment}-lambda-endpoint"
    Environment = "${var.environment}"
  }
}


resource "aws_vpc_endpoint" "rds" {
  service_name      = "${var.endpoint_rds}"
  subnet_ids        = aws_subnet.serverless_private[*].id
  vpc_id            = aws_vpc.default.id
  vpc_endpoint_type = "Interface"
  security_group_ids = [aws_security_group.vpc_endpoints.id]
  tags = {
    Name        = "${var.environment}-rds-endpoint"
    Environment = "${var.environment}"
  }
}

