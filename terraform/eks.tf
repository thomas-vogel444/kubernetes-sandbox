resource "aws_eks_cluster" "kubernetes-sandbox-eks" {
    name = "kubernetes-sandbox-cluster"
    depends_on = ["aws_iam_role.kubernetes-role"]

    vpc_config = {
        subnet_ids = ["${aws_subnet.kubernetes_public_subnet_a.id}", "${aws_subnet.kubernetes_public_subnet_b.id}"]
    }
    role_arn = "${aws_iam_role.kubernetes-role.arn}"

}