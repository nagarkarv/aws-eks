variable "region" {
  default = "eu-central-1"
  //default = "eu-west-2"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "instance_ami" {
  default = "ami-010fae13a16763bb4"
}

variable "worker_ami" {
  default = "ami-0e21bc066a9dbabfa"
}

variable "server-name" {
  default = "k8s-server"
}

variable "instance_key" {
  default = "k8s-server-key"
}

variable "cluster-name" {
  default = "k8s-cog-poc-cluster"
}
