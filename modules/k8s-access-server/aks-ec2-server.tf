// Security Group for AKS Server
resource "aws_security_group" "kubernetes-server-instance-sg" {
  name        = "kubernetes-server-instance-sg"
  description = "kubectl_instance_sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "kubectl_server-SG"
  }
}

// EC2 to manage the AKS cluster

resource "aws_instance" "kubernetes-server" {
  instance_type          = "${var.instance_type}"
  ami                    = "${var.instance_ami}"
  key_name               = "${var.instance_key}"
  subnet_id              = "${var.k8-server-subnet}"
  vpc_security_group_ids = ["${aws_security_group.kubernetes-server-instance-sg.id}"]

  root_block_device {
    volume_type           = "gp2"
    volume_size           = "50"
    delete_on_termination = "true"
  }

  tags {
    Name = "${var.server-name}"
  }
}
