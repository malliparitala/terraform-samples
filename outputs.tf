output "vpc_id" {
  value = module.vpc.vpc_id
}

output "eks_role_arn" {
  value = module.eks.eks_role_arn
}