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

module "vpc" {
  source = "./vpc"
}

module "iam" {
  source = "./iam"
}

module "eks" {
  source = "./eks"
  depends_on = [
    module.iam.eks_role_arn
  ]
}