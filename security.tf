resource "aws_security_group" "master_node" {
    vpc_id = "${data.aws_vpc.openshift_vpc.id}"
}

resource "aws_security_group_rule" "ssh" {
    type = "ingress"
    from_port = "22"
    to_port = "22"
    protocol = "tcp"
    cidr_blocks = "${var.access_cidr_ssh}"

    security_group_id = "${aws_security_group.master_node.id}"
}

resource "aws_security_group_rule" "egress_allow_all" {
    type = "egress"
    from_port = 0
    to_port = 0
    protocol = "-1"
    security_group_id = "${aws_security_group.master_node.id}"
}
