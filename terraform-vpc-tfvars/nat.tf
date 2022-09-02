resource "aws_eip" "nat" {
  count = length(var.public_subnet_cidr_blocks)

  vpc = true
  tags = {
    Name        = "${var.environment}-nat_eip"
    Environment = "${var.environment}"
  }

}

resource "aws_nat_gateway" "default" {
  depends_on = [aws_internet_gateway.default]

  allocation_id = element(aws_eip.nat.*.id, 0)
  subnet_id     = element(aws_subnet.public.*.id,0)
  tags = {
    Name        = "${var.environment}-natgateway"
    Environment = "${var.environment}"
  }

}

