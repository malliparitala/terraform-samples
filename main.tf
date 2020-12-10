# The configuration for the `remote` backend.
terraform {
  required_providers {
    aws = {
      source = var.required_providers[var.aws]
      #source = "hashicorp/aws"
    }
    random = {
      source = var.required_providers[var.random]
      #source = "hashicorp/random"
    }
    null = {
      source = var.required_providers[var.null]
      #source = "hashicorp/null"
    }
  }

  backend "remote" {
    # The name of your Terraform Cloud organization.
    organization = var.organization

    # The name of the Terraform Cloud workspace to store Terraform state files in.
    workspaces {
      name = var.workspace_name
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