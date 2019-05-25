output "subnet_a_id" {
  value = "${aws_subnet.kubernetes_public_subnet_a.id}"
}

output "subnet_b_id" {
  value = "${aws_subnet.kubernetes_public_subnet_b.id}"
}