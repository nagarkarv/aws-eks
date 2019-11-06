module "network" {
  source = "../modules/k8s-network"
}
module "k8s-access-server" {
  source        = "../modules/k8s-access-server"
  instance_type = "${var.instance_type}"
  instance_ami  = "${var.instance_ami}"
  server-name   = "${var.server-name}"
  instance_key  = "${var.instance_key}"
  //k8-subnet     = "${module.vpc.public_subnet[0]}"
}

module "eks-cluster" {
  source                        = "../modules/k8s-cluster"
  worker_ami                    = "${var.worker_ami}"
  vpc_id                        = "${module.network.vpc_id}"
  cluster-name                  = "${var.cluster-name}"
  kubernetes-server-instance-sg = "${module.k8s-access-server.kubernetes-server-instance-sg}"
  //TODO eks_subnets                   = ["${module.vpc.master_subnet}"]
  worker_subnet                 = ["${module.network.subnets}"]
  subnet_ids                    = "${module.network.subnets}"
}

