output "worker-node-role" {
  value = "${aws_iam_role.worker-node-role.arn}"
}

output "cluster-name" {
  value = "${var.cluster-name}"
}
