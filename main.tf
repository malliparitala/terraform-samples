# The configuration for the `remote` backend.
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

# Configure the AWS Provider
provider "aws" {
  region = var.main_region
}

# Create a VPC
resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
}