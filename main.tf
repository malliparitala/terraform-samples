# Configuration for the `remote` backend.
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
    azurerm = {
      source = "hashicorp/azurerm"
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


provider "azurerm" {
  features {}
}

#module "ec2" {
#  source           = "./aws/ec2"
#  aws_region       = "us-east-1"
#  ami_id           = "ami-022e1a32d3f742bd8"
#  instance_type    = "t2.micro"
#  subnet_id        = "subnet-9fc9dea1"
#  min_size         = 1
#  max_size         = 3
#  desired_capacity = 2
#}

module "azure_vm" {
  source              = "./azure/vm"
  resource_group_name = "terraform-samples"
  location            = "East US"
  vm_name             = "terraform-samples-vm"
  vm_size             = "Standard_DS2_v2"
  subnet_id           = "/subscriptions/7155632b-3d2b-4a7c-91fd-0773b0e8b906/resourceGroups/terraform-samples/providers/Microsoft.Network/virtualNetworks/terraform-samples-vnet/subnets/terraform-samples-subnet"
  image_publisher     = "Canonical"
  image_offer         = "UbuntuServer"
  image_sku           = "18.04-LTS"
  admin_username      = ""
  admin_password      = ""
  min_capacity        = 1
  max_capacity        = 3
  cpu_threshold       = 75
  upgrade_policy_mode = "Automatic"
}