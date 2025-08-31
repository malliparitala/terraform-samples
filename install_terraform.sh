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

# Detect architecture
ARCH=$(uname -m)
if [ "$ARCH" = "x86_64" ]; then
  PKG="awscli-exe-linux-x86_64.zip"
elif [ "$ARCH" = "aarch64" ] || [ "$ARCH" = "arm64" ]; then
  PKG="awscli-exe-linux-aarch64.zip"
else
  echo "Unsupported architecture: $ARCH"
  exit 1
fi

# Download and install
curl "https://awscli.amazonaws.com/${PKG}" -o "awscliv2.zip"
unzip -q awscliv2.zip
sudo ./aws/install

# Verify
aws --version

rm -rf aws awscliv2.zip AWSCLIV2.pkg

