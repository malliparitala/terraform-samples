variable "eks_role_arn" {
  type = string
  description = "arn of the EKS cluster."
  default = aws_iam_role.eks_role.arn
}