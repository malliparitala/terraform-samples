resource "aws_subnet" "private_be" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = "10.0.100.0/24"
  depends_on = [aws_internet_gateway.main_internet_gateway]

  tags = {
    Name = "Private"
  }
}