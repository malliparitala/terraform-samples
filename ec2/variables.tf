variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "ami_id" {
  description = "AMI ID"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "key_name" {
  description = "EC2 key pair name"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
}

variable "min_size" {
  description = "Minimum number of instances in the autoscaling group"
  type        = number
}

variable "max_size" {
  description = "Maximum number of instances in the autoscaling group"
  type        = number
}

variable "desired_capacity" {
  description = "Desired number of instances in the autoscaling group"
  type        = number
}
