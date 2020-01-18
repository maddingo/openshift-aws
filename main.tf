provider "aws" {
  region = "eu-central-1"
  version = "~> 2.7"
}


# openshift master
data "aws_ami" "openshift_master" {
  most_recent = true

  filter {
    name   = "name"
    values = ["${var.ami_filter}"]
  }

#  owners = ["self"]
  owners = ["679593333241"] # centos.org?
}

resource "aws_instance" "master_node" {
  ami                         = "${data.aws_ami.openshift_master.id}"
  instance_type               = "${var.instance_type}"
#  subnet_id                   = "${random_shuffle.subnet.result[0]}"
  associate_public_ip_address = "true"

  vpc_security_group_ids = ["${aws_security_group.master_node.id}"]
  # spot_type              = "one-time"
  key_name               = "${var.keyname}"

  # wait_for_fulfillment = true

  root_block_device {
    volume_size = "${var.volume_size}"
    volume_type = "gp2"
  }

  tags = {
    Name = "Openshift Master"
  }
}
