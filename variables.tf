variable "main_region" {
  default = "us-east-1"
}

variable "eks_rolearn" {
  type = string
  description = "arn of the EKS cluster."
}