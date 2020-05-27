wget https://releases.hashicorp.com/terraform/0.12.25/terraform_0.12.25_linux_amd64.zip
unzip terraform*.zip
rm terraform*.zip
echo "export PATH=\$PATH:$(pwd)" >> ~/.bashrc
echo "exec bash"
