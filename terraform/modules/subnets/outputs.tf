output "public_subnet_1_id" {
  description = "The ID of the first public subnet"
  value       = aws_subnet.public-1.id
}

output "public_subnet_2_id" {
  description = "The ID of the second public subnet"
  value       = aws_subnet.public-2.id
}

output "public_subnets" {
  description = "IDs of public subnets"
  value       = [aws_subnet.public-1.id, aws_subnet.public-2.id]
}