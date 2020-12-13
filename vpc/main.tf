resource "aws_vpc" "main_vpc" {
  cidr_block = var.cidr_block
}

resource "aws_internet_gateway" "main_internet_gateway" {
  vpc_id = main_vpc.main_vpc.id
}