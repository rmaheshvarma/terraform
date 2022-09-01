provider "aws" {
      region     = "${var.region}"
}


# VPC resources: This will create 1 VPC with 4 Subnets, 1 Internet Gateway, 4 Route Tables.

resource "aws_vpc" "default" {
  cidr_block           = var.cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "dev_vpc"
  }
}

resource "aws_internet_gateway" "default" {
  vpc_id = aws_vpc.default.id
  tags = {
    Name = "dev_vpc_igw"
  }
}

resource "aws_route_table" "private_rt" {
  count = length(var.private_subnet_cidr_blocks)

  vpc_id = aws_vpc.default.id
  tags = {
    Name = "dev_vpc_private_rt"
  }
}

resource "aws_route" "private_rt" {
  count = length(var.private_subnet_cidr_blocks)

  route_table_id         = aws_route_table.private_rt[count.index].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.default[count.index].id
}

resource "aws_route_table" "public_rt" {
  count = length(var.public_subnet_cidr_blocks)
  vpc_id = aws_vpc.default.id
  tags = {
    Name = "dev_vpc_public_rt"
  }
}

resource "aws_route" "public_rt" {
  count = length(var.public_subnet_cidr_blocks)
  route_table_id         = aws_route_table.public_rt[count.index].id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.default.id
}

resource "aws_subnet" "private_subnet" {
  count = length(var.private_subnet_cidr_blocks)

  vpc_id            = aws_vpc.default.id
  cidr_block        = var.private_subnet_cidr_blocks[count.index]
  availability_zone = var.availability_zones[count.index]
  tags = {
    Name = "dev_vpc_private_subnet"
  }
}

resource "aws_subnet" "public_subnet" {
  count = length(var.public_subnet_cidr_blocks)

  vpc_id                  = aws_vpc.default.id
  cidr_block              = var.public_subnet_cidr_blocks[count.index]
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name = "dev_vpc_public_subnet"
  }
}

resource "aws_route_table_association" "private_subnet" {
  count = length(var.private_subnet_cidr_blocks)

  subnet_id      = aws_subnet.private_subnet[count.index].id
  route_table_id = aws_route_table.private_rt[count.index].id
}

resource "aws_route_table_association" "public_subnet" {
  count = length(var.public_subnet_cidr_blocks)

  subnet_id      = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.public_rt[count.index].id
}

resource "aws_subnet" "db_subnet" {
  count = length(var.db_subnet_cidr_blocks)

  vpc_id            = aws_vpc.default.id
  cidr_block        = var.db_subnet_cidr_blocks[count.index]
  availability_zone = var.availability_zones[count.index]
  tags = {
    Name = "dev_vpc_db_subnet"
  }
}

resource "aws_route_table_association" "db_subnet" {
  count = length(var.db_subnet_cidr_blocks)

  subnet_id      = aws_subnet.db_subnet[count.index].id
  route_table_id = aws_route_table.private_rt[count.index].id
}


resource "aws_subnet" "serverless_subnet" {
  count = length(var.serverless_subnet_cidr_blocks)

  vpc_id            = aws_vpc.default.id
  cidr_block        = var.serverless_subnet_cidr_blocks[count.index]
  availability_zone = var.availability_zones[count.index]
  tags = {
    Name = "dev_vpc_serverless_subnet"
  }
}

resource "aws_route_table_association" "serverless_subnet" {
  count = length(var.serverless_subnet_cidr_blocks)

  subnet_id      = aws_subnet.serverless_subnet[count.index].id
  route_table_id = aws_route_table.private_rt[count.index].id
}

resource "aws_subnet" "web_app_subnet" {
  count = length(var.web_app_subnet_cidr_blocks)

  vpc_id            = aws_vpc.default.id
  cidr_block        = var.web_app_subnet_cidr_blocks[count.index]
  availability_zone = var.availability_zones[count.index]
  tags = {
    Name = "dev_vpc_web_app_subnet"
  }
}

resource "aws_route_table_association" "web_app_subnet" {
  count = length(var.web_app_subnet_cidr_blocks)

  subnet_id      = aws_subnet.web_app_subnet[count.index].id
  route_table_id = aws_route_table.private_rt[count.index].id
}

resource "aws_eip" "nat" {
  count = length(var.public_subnet_cidr_blocks)

  vpc = true
  tags = {
    Name = "dev_vpc_eip"
  }
}

resource "aws_nat_gateway" "default" {
  depends_on = [aws_internet_gateway.default]

  count = length(var.public_subnet_cidr_blocks)

  allocation_id = aws_eip.nat[count.index].id
  subnet_id     = aws_subnet.public_subnet[count.index].id
  tags = {
    Name = "dev_vpc_nat_gateway"
  }
}

