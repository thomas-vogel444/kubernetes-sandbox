data "terraform_remote_state" "networking" {
  backend = "s3" 
  config {
      bucket = "thomas-vogel444-terraform-remote-state-storage-s3"
      key = "kubernetes-sandbox/networking.tfstate"
      region = "eu-west-1"
      profile = "personal"
  }
}

resource "aws_eks_cluster" "kubernetes-sandbox-eks" {
    name = "kubernetes-sandbox-cluster"
    depends_on = ["aws_iam_role.kubernetes-role"]

    vpc_config = {
        subnet_ids = [
                "${data.terraform_remote_state.networking.subnet_a_id}", 
                "${data.terraform_remote_state.networking.subnet_b_id}"
            ]
    }
    role_arn = "${aws_iam_role.kubernetes-role.arn}"
}