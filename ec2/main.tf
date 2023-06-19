provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "ec2_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  tags = {
    Name = "EC2Instance"
  }
}

resource "aws_launch_configuration" "launch_config" {
  name          = "example-launch-config"
  image_id      = var.ami_id
  instance_type = var.instance_type
}

resource "aws_autoscaling_group" "autoscaling_group" {
  name                 = "example-autoscaling-group"
  launch_configuration = aws_launch_configuration.launch_config.name
  min_size             = var.min_size
  max_size             = var.max_size
  desired_capacity     = var.desired_capacity
  vpc_zone_identifier  = [var.subnet_id]
}