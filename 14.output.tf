output "vpc_id" {
  description = "terraform created vpc id"
  value       = aws_vpc.default.id
}

output "public_subnets" {
  description = "terraform created vpc publie subnts"
  value       = aws_subnet.public_subent[*].id
}

output "private_subnets" {
  description = "terraform created vpc publie subnts"
  value       = aws_subnet.private_subent[*].id
}

output "data_vpc" {
  description = "Already avaliable vpc id in aws"
  value       = data.aws_vpc.ansible_vpc.id
}

output "data_subnets" {
  description = "Already avaliable vpc id subenets in aws"
  value       = data.aws_subnets.ansible_subnets.ids
}

