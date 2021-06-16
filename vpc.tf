resource "aws_vpc" "main" {
cidr_block = "10.0.0.0/16"
instance_tenancy = "default"
enable_dns_support = "true"
enable_dns_hostnames  = "true"
tags = {
Name = "my_vpc"
}
}

resource "aws_subnet" "pub_subnet" {
vpc_id = "${aws_vpc.main.id}"
cidr_block = "10.0.1.0/24"
availability_zone = "us-east-1a"

map_public_ip_on_launch = "true"

tags = {
Name = "pubsubnet"
}
}
resource "aws_subnet" "private_subnet" {
 vpc_id = "${aws_vpc.main.id}"
cidr_block = "10.0.2.0/24"
availability_zone = "us-east-1b"

map_public_ip_on_launch = "false"
tags = {
Name = "privsubnet"
}
}
resource "aws_internet_gateway" "aws_igw" {

vpc_id = "${aws_vpc.main.id}"
tags = {
Name = "sigw"
}
}
resource "aws_route_table" "pub_route"{
vpc_id = "${aws_vpc.main.id}"
route {
cidr_block = "0.0.0.0/0"
gateway_id = "${aws_internet_gateway.aws_igw.id}"
}
tags = {
Name = "mypublicroute"
}
}
resource "aws_route_table_association" "public_ass_route"{
subnet_id = "${aws_subnet.pub_subnet.id}"
route_table_id = "${aws_route_table.pub_route.id}"
}


