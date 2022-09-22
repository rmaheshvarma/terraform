resource "aws_route_table" "private" {
 vpc_id = aws_vpc.default.id
 tags = {
    Name        = "${var.environment}-private-rt"
    Environment = "${var.environment}"
  }
}

resource "aws_route" "private" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = element(aws_nat_gateway.default.*.id, 0)

}

