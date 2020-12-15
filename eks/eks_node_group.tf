resource "aws_eks_node_group" "eks_node_group" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "eks_node_group"
  node_role_arn   = aws_iam_role.eks_node_group_role.arn
  subnet_ids      = [var.subnet_fe_id, var.subnet_be_id, var.subnet_db_id]

  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.eks-node-group-role-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.eks-node-group-role-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.eks-node-group-role-AmazonEC2ContainerRegistryReadOnly,
  ]
}