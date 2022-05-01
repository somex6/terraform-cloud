output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet-1" {
  value       = aws_subnet.public[0].id
  description = "public subnet 1"
}

output "public_subnet-2" {
  value       = aws_subnet.public[1].id
  description = "public subnet 2"
}

output "private_subnet-1" {
  value       = aws_subnet.private[0].id
  description = "private subnet 1"
}

output "private_subnet-2" {
  value       = aws_subnet.private[1].id
  description = "private subnet 2"
}
output "private_subnet-3" {
  value       = aws_subnet.private[2].id
  description = "private subnet 3"
}
output "private_subnet-4" {
  value       = aws_subnet.private[3].id
  description = "private subnet 4"
}

output "instance-profile" {
  value = aws_iam_instance_profile.ip.id
}
