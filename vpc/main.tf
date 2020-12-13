resource "main_vpc" "main_vpc" {
  cidr_block = var.cidr_block
}

resource "igateway" "main_internet_gateway" {
  vpc_id = main_vpc.main_vpc.id
}