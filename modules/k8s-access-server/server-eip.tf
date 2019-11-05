resource "aws_eip" "ip" {
  instance = "${aws_instance.kubernetes-server.id}"
  vpc      = true

  tags = {
    Name = "server_eip"
  }
}
