output "eks_role_arn" {
  value = "${aws_iam_role.eks-role.arn}"
}
