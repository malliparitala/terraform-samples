resource "aws_eip" "nat_db" {
  vpc      = true
  depends_on = [aws_internet_gateway.main_internet_gateway]
}