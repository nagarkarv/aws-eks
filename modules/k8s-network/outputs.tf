output "subnets" {
  value = "${data.aws_subnet_ids.default.ids}"
}
