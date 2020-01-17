resource "aws_security_group" "masternode" {
    vpc_id = "${data.aws_vpc.openshift_vpc.id}"
}

resource "aws_security_group_rule" "ssh" {
    type = "ingress"
    from_port = "22"
    to_port = "22"
    protocol = "tcp"
    cidr_blocks = "${var.access_cidr_ssh}"

    security_group_id = "${aws_security_group.masternode.id}"
}
