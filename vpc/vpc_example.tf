provider "aws" {
	region = var.region
}

resource "aws_vpc" "vpc_example" {
	cidr_block = "10.0.0.0/16"
	instance_tenancy = "dedicated"

	tags = {
		Name = "vpc_main"
	}
	
}

resource "aws_subnet" "subnets_example" {
	vpc_id = aws_vpc.vpc_example.id
	cidr_block = "10.0.1.0/28"

	tags = {
		Name = "Subnets"
	}
}
