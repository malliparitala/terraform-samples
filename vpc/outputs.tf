output "vpc_id" {
  value = aws_vpc.main_vpc.id
}

output "subnet_fe_id" {
  value = aws_subnet.public_fe.id
}

output "subnet_be_id" {
  value = aws_subnet.private_be.id
}

output "subnet_db_id" {
  value = aws_subnet.private_db.id
}