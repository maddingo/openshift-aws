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
