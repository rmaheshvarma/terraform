resource "aws_subnet" "db_private" {
  count = length(var.db_subnet_cidr_blocks)

  vpc_id            = aws_vpc.default.id
  cidr_block        = var.db_subnet_cidr_blocks[count.index]
  availability_zone = var.availability_zones[count.index]
  tags = {
    Name        = "${var.environment}-db_subnet_az${count.index + 1}"
    Environment = "${var.environment}"
  }

}

resource "aws_route_table_association" "dbrt" {
  count = length(var.db_subnet_cidr_blocks)

  subnet_id      = aws_subnet.db_private[count.index].id
  route_table_id = aws_route_table.private.id
}
