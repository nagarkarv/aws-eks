variable "region" {
  default = "eu-central-1"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "instance_ami" {
  default = "ami-010fae13a16763bb4"
}

variable "server-name" {
  default = "k8s-server"
}

variable "instance_key" {
  default = "k8s-server-key"
}

