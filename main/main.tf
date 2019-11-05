module "k8s-access-server" {
  source        = "../modules/k8s-access-server"
  instance_type = "${var.instance_type}"
  instance_ami  = "${var.instance_ami}"
  server-name   = "${var.server-name}"
  instance_key  = "${var.instance_key}"
  //vpc_id        = "${module.vpc.vpc_id}"
  //k8-subnet     = "${module.vpc.public_subnet[0]}"
}

