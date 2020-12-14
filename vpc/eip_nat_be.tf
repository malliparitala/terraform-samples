resource "aws_eip" "nat_be" {
  vpc      = true
  depends_on = [aws_internet_gateway.main_internet_gateway]
}

