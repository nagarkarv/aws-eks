module "network" {
  source = "../modules/k8s-network"
}
module "k8s-access-server" {
  source        = "../modules/k8s-access-server"
  instance_type = "${var.instance_type}"
  instance_ami  = "${var.instance_ami}"
  server-name   = "${var.server-name}"
  instance_key  = "${var.instance_key}"
  //vpc_id        = "${module.vpc.vpc_id}"
  //k8-subnet     = "${module.vpc.public_subnet[0]}"
}

module "eks-cluster" {
  source                        = "../modules/k8s-cluster"
  //TODO vpc_id                        = "${module.vpc.vpc_id}"
  cluster-name                  = "${var.cluster-name}"
  kubernetes-server-instance-sg = "${module.k8s-access-server.kubernetes-server-instance-sg}"
  //TODO eks_subnets                   = ["${module.vpc.master_subnet}"]
  worker_subnet                 = ["${module.network.subnets}"]
  //TODO subnet_ids                    = ["${module.vpc.master_subnet}", "${module.vpc.worker_node_subnet}"]
}

