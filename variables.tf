variable "main_region" {
  description = "The AWS region to create things in."
  default     = "us-east-1"
}

variable "organization" {
  description = "terraform organization name"
}

variable "workspace_name" {
  description = "terraform workspace_name name"
}

variable "provider_aws" {
  default = "aws"
}

variable "provider_random" {
  default = "random"
}

variable "provider_null" {
  default = "null"
}


variable "required_providers" {
  description = "All the required providers"
  type = "map"
}