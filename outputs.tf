output "vpc_id" {
  value = module.vpc.vpc_id
}

output "eks_role_arn" {
  value = module.iam.eks_role_arn
  depends_on = [
    module.iam
  ]
}