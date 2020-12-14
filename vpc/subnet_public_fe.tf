resource "aws_subnet" "public_fe" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true
  depends_on = [aws_internet_gateway.main_internet_gateway]

  tags = {
    Name = "Public"
  }
}