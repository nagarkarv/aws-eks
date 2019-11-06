variable "cluster-name" {
  default = "k8s-cog-poc-cluster"
}

variable "kubernetes-server-instance-sg" {
  description = "Kubenetes control server security group"
}

variable "worker_subnet" {
  type = "list"
}

variable "worker_ami" {}

variable "vpc_id" {}

variable "subnet_ids" {
  type = "list"
}
