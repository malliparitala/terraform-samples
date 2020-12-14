variable "main_region" {
  default = "us-east-1"
}

variable "eks_role_arn" {
  type = string
  default = "arn:aws:iam::801210904757:role/eks-cluster-role"
}