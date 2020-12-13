resource "aws_subnet" "public_fe" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "Public"
  }
}

resource "aws_subnet" "private_be" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = "10.0.100.0/24"

  tags = {
    Name = "Private"
  }
}

resource "aws_subnet" "private_db" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = "10.0.200.0/24"

  tags = {
    Name = "Private"
  }
}