data "aws_iam_policy" "AmazonEKSClusterPolicy" {
  arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

data "aws_iam_policy" "AmazonEKSServicePolicy" {
  arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
}

resource "aws_iam_role" "eks-role" {
    name = "EKSRole"
    description = "Role to allow a EKS to create resources"
    assume_role_policy = <<EOF
{
        "Version": "2012-10-17",
        "Statement": [
            {
                "Action": "sts:AssumeRole",
                "Principal": { "Service": "eks.amazonaws.com" },
                "Effect": "Allow",
                "Sid": ""
            }
        ]
    }
    EOF

    tags {
        Name = "Kubernetes Sandbox"
    }
}

resource "aws_iam_role_policy_attachment" "eks_cluster_policy_attachement" {
    role = "${aws_iam_role.eks-role.id}"
    policy_arn = "${data.aws_iam_policy.AmazonEKSClusterPolicy.id}"
}

resource "aws_iam_role_policy_attachment" "eks_service_policy_attachement" {
    role = "${aws_iam_role.eks-role.id}"
    policy_arn = "${data.aws_iam_policy.AmazonEKSServicePolicy.id}"
}