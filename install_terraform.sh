echo "export PATH=\$PATH:$(pwd)" >> ~/.bashrc 
wget https://releases.hashicorp.com/terraform/0.12.25/terraform_0.12.25_linux_amd64.zip
unzip -o terraform*.zip
rm terraform*.zip
echo "exec bash"
cp ./getting_started/.credentials /home/gitpod/.aws/credentials
