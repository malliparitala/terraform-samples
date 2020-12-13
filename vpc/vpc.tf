resource "main_vpc" "main_vpc" {
    cidr_block = "10.0.0.0/24"
}

resource "igateway" "main_internet_gateway" {
    vpc_id = main_vpc.main_vpc.id
}