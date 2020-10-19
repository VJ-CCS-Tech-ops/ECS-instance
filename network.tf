resource "aws_vpc" "vpc" {
    cidr_block = "10.0.0.0/24"
    enable_dns_support   = true
    enable_dns_hostnames = true
    tags       = {
        Name = "Terraform-ecs VPC"
    }
}

resource "aws_subnet" "pub_subnet" {
    vpc_id                  = "${aws_vpc.vpc.id}"
    cidr_block              = "10.1.0.0/22"
}
