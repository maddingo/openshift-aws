data "aws_vpc" "openshift_vpc" {
    filter {
        name = "tag:Name"
        values = ["${var.openshift_vpc_name}"]
    }
}
