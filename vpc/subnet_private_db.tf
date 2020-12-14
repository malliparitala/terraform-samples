resource "aws_subnet" "private_db" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = "10.0.200.0/24"
  availability_zone = "us-east-1c"
  depends_on = [aws_internet_gateway.main_internet_gateway]

  tags = {
    Name = "Private"
  }
}