output "vpc_id" {
  value = module.vpc.vpc_id
}

output "eks_role_arn" {
  value = module.eks.eks_role_arn
}

output "endpoint" {
  value = module.eks.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = module.eks.kubeconfig-certificate-authority-data
}