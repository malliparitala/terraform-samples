resource "aws_nat_gateway" "nat_gw_be" {
  allocation_id = aws_eip.nat_be.id
  subnet_id     = aws_subnet.private_be.id
  depends_on = [aws_internet_gateway.main_internet_gateway]
}