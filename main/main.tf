module "network" {
  source = "../modules/k8s-network"
}

// Server to access or execute k8s commands
module "k8s-access-server" {
  source        = "../modules/k8s-access-server"
  instance_type = "${var.instance_type}"
  instance_ami  = "${var.instance_ami}"
  server-name   = "${var.server-name}"
  instance_key  = "${var.instance_key}"

  // Create the K8s Access sever in the 2nd subnet
  // This should ideally be in a seperate subnet of its own 
  k8-server-subnet  = "${module.network.subnets[1]}"
}

module "eks-cluster" {
  source                        = "../modules/k8s-cluster"
  worker_ami                    = "${var.worker_ami}"
  vpc_id                        = "${module.network.vpc_id}"
  cluster-name                  = "${var.cluster-name}"
  kubernetes-server-instance-sg = "${module.k8s-access-server.kubernetes-server-instance-sg}"
  worker_subnet                 = ["${module.network.subnets}"]
  subnet_ids                    = "${module.network.subnets}"
}
