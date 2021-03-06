resource "aws_vpc" "kubernetes-sandbox-vpc" {
  cidr_block = "10.0.0.0/16"
  
  tags {
      Name = "${var.name}"
  }
}

resource "aws_subnet" "kubernetes_public_subnet_a" {
  vpc_id = "${aws_vpc.kubernetes-sandbox-vpc.id}"
  cidr_block = "10.0.1.0/24"
  availability_zone = "eu-west-1a"

  tags {
      Name = "${var.name}"
  }
}

resource "aws_subnet" "kubernetes_public_subnet_b" {
  vpc_id = "${aws_vpc.kubernetes-sandbox-vpc.id}"
  cidr_block = "10.0.2.0/24"
  availability_zone = "eu-west-1b"

  tags {
      Name = "${var.name}"
  }
}