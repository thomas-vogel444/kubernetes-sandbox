output "eks-cluster-endpoint" {
  value = "${aws_eks_cluster.kubernetes-sandbox-eks.endpoint}"
}

output "eks-cluster-certificate-data" {
  value = "${aws_eks_cluster.kubernetes-sandbox-eks.certificate_authority.data}"
}