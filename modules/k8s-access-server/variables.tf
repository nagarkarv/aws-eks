variable "instance_type" {
  default = "t2.micro"
}

variable "instance_ami" {}

variable "server-name" {
  default = "k8s-server"
}

variable "instance_key" {
  default = "k8s-server-key"
}

