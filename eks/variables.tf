variable "eks_role_arn" {
  type = string
  description = "arn of the EKS cluster."
  default = "arn:aws:iam::801210904757:role/eks-cluster-role"
}