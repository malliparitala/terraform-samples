# Configuration for the `remote` backend.
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
    random = {
      source = "hashicorp/random"
    }
    null = {
      source = "hashicorp/null"
    }
  }

  backend "remote" {
    # The name of your Terraform Cloud organization.
    organization = "naga-paritala"

    # The name of the Terraform Cloud workspace to store Terraform state files in.
    workspaces {
      name = "terraform-samples"
    }
  }
}

module "ec2" {
  source = "./ec2"
  aws_region    = "us-east-1"
  ami_id        = "ami-022e1a32d3f742bd8"
  instance_type = "t2.micro"
  subnet_id     = "subnet-9fc9dea1"
  min_size      = 1
  max_size      = 3
  desired_capacity = 2
}