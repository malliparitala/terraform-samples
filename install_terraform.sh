#!/bin/bash

# Install Terraform
echo "Installing Terraform..."
TERRAFORM_VERSION="1.5.0"
TERRAFORM_ZIP="terraform_${TERRAFORM_VERSION}_linux_amd64.zip"
TERRAFORM_URL="https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/${TERRAFORM_ZIP}"
TERRAFORM_DIR="/usr/local/bin"
TEMP_DIR=$(mktemp -d)

cd "$TEMP_DIR" || exit
curl -LO "$TERRAFORM_URL"
unzip "$TERRAFORM_ZIP"
sudo mv terraform "$TERRAFORM_DIR"
rm -f "$TERRAFORM_ZIP"

sudo apt-get update
sudo apt-get install -y curl apt-transport-https lsb-release gnupg
curl -sL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/microsoft.asc.gpg >/dev/null
AZ_REPO=$(lsb_release -cs)
echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | sudo tee /etc/apt/sources.list.d/azure-cli.list
sudo apt-get update
sudo apt-get install -y azure-cli
export PATH=$PATH:/usr/local/bin/az
export PATH=$PATH:/usr/bin/az

# Configure Terraform
echo "Configuring Terraform..."
read -p "Enter your AWS access key ID: " AWS_ACCESS_KEY_ID
read -p "Enter your AWS secret access key: " AWS_SECRET_ACCESS_KEY
read -p "Enter your Azure ARM subscription id: " ARM_SUBSCRIPTION_ID
read -p "Enter your Azure ARM tenant id: " ARM_TENANT_ID
read -p "Enter your Azure ARM client id: " ARM_CLIENT_ID
read -p "Enter your Azure ARM client secret: " ARM_CLIENT_SECRET
read -p "Enter your terraform backend token: " TERRAFORM_API_TOKEN

cat <<EOF > ~/.terraformrc
credentials "aws" {
  access_key = "$AWS_ACCESS_KEY_ID"
  secret_access_key = "$AWS_SECRET_ACCESS_KEY"
}

credentials "azurerm" {
  subscription_id = "$ARM_SUBSCRIPTION_ID"
  client_id       = "$ARM_CLIENT_ID"
  client_secret   = "$ARM_CLIENT_SECRET"
  tenant_id       = "$ARM_TENANT_ID"
}

credentials "app.terraform.io" {
  token = "$TERRAFORM_API_TOKEN"
}

EOF

echo "Terraform installation and configuration completed."
