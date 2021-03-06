output "eks_role_arn" {
  value = aws_iam_role.eks_role.arn
}

output "endpoint" {
  value = aws_eks_cluster.eks_cluster.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.eks_cluster.certificate_authority[0].data
}

output "node_group_resources" {
  value = aws_eks_node_group.eks_node_group.resources
}

output "node_group_status" {
  value = aws_eks_node_group.eks_node_group.status
}