variable "openshift_vpc_name" {
    description = "VPC tag:Name of the VPC for Openshift"
    default = "Default-VPC"
}

variable "ami_filter" {
  description = "Name expression of the AMI"
  default = "CentOS Linux 7 x86_64 HVM EBS ENA *"
}

variable "access_cidr_ssh" {
  description = "CIDR for SSH access"
  type = list
}

variable "keyname" {
  description = "Name of the SSH key"
}

variable "volume_size" {
  description = "Disk size"
  default = "30"
}

variable "instance_type" {
  description = "AWS instance type"
  default = "t3.micro"
}
