resource "aws_subnet" "private_be" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = "10.0.100.0/24"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = true
  depends_on = [aws_internet_gateway.main_internet_gateway]

  tags = {
    Name = "Public"
  }
}