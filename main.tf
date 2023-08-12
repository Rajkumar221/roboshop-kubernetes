esource "aws_eks_cluster" "eks" {
  name     = "${var.env}-eks"
  role_arn = aws_iam_role.example.arn

  vpc_config {
    subnet_ids = var.subnet_ids
  }
}

resource "aws_eks_node_group" "nodes" {
  cluster_name    = aws_eks_cluster.example.name
  node_group_name = "${var.env}-ng"
  node_role_arn   = aws_iam_role.node-role.arn
  subnet_ids      = var.subnet_ids

  scaling_config {
    desired_size = var.desired_size
    max_size     = var.max_size
    min_size     = var.min_size
  }
}
