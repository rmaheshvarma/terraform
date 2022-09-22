output "aws_vpc" {
  value       = aws_vpc.default.id
  description = "VPC ID"
}

output "public_subnet_ids" {
  value       = aws_subnet.public.*.id
  description = "List of public subnet IDs"
}

output "private_subnet_ids" {
  value       = aws_subnet.private.*.id
  description = "List of private subnet IDs"
}

output "db_private_subnet_ids" {
  value       = aws_subnet.db_private.*.id
  description = "List of private subnet IDs"
}

output "serverless_private_subnet_ids" {
  value       = aws_subnet.serverless_private.*.id
  description = "List of private subnet IDs"
}

output "nat_gateway_ips" {
  value       = aws_eip.nat.*.public_ip
  description = "List of Elastic IPs associated with NAT gateways"
}
