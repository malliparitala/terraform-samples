#!/bin/bash

# Install Terraform
echo "Installing Terraform..."
TERRAFORM_VERSION="1.13.1"
TERRAFORM_ZIP="terraform_${TERRAFORM_VERSION}_linux_amd64.zip"
TERRAFORM_URL="https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/${TERRAFORM_ZIP}"
TERRAFORM_DIR="/usr/local/bin"
TEMP_DIR=$(mktemp -d)

cd "$TEMP_DIR" || exit
curl -LO "$TERRAFORM_URL"
unzip "$TERRAFORM_ZIP"
sudo mv terraform "$TERRAFORM_DIR"
rm -f "$TERRAFORM_ZIP"

# Configure Terraform
echo "Configuring Terraform..."
read -p "Enter your AWS access key ID: " AWS_ACCESS_KEY_ID
read -p "Enter your AWS secret access key: " AWS_SECRET_ACCESS_KEY
read -p "Enter your terraform backend token: " TERRAFORM_API_TOKEN

cat <<EOF > ~/.terraformrc
credentials "aws" {
  access_key = "$AWS_ACCESS_KEY_ID"
  secret_access_key = "$AWS_SECRET_ACCESS_KEY"
}

credentials "app.terraform.io" {
  token = "$TERRAFORM_API_TOKEN"
}

EOF

echo "Terraform installation and configuration completed."
