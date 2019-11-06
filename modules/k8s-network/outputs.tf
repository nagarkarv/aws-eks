output "subnets" {
  value = "${data.aws_subnet_ids.default.ids}"
}

output "vpc_id" {
  value = "${aws_default_vpc.default.id}"
}
