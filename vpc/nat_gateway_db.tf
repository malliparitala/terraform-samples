resource "aws_nat_gateway" "nat_gw_db" {
  allocation_id = aws_eip.nat_db.id
  subnet_id     = aws_subnet.private_db.id
  depends_on = [aws_internet_gateway.main_internet_gateway]
}