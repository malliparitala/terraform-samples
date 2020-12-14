resource "aws_eks_cluster" "eks_cluster" {
  name     = "eks_cluster"
  role_arn = var.eks_role_arn

  vpc_config {
    subnet_ids = [aws_subnet.public_fe.id, aws_subnet.private_be.id, aws_subnet.private_db.id]
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    aws_iam_role_policy_attachment.eks_role-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.eks_role-AmazonEKSVPCResourceController,
  ]
}