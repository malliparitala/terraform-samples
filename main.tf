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
  version = "~> 3.0"
}

module "vpc" {
  source = "./vpc"
}