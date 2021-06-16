resource "aws_instance" "sample"{
ami = "ami-0b0af3577fe5e3532"
instance_type = var.aws_instance_type
vpc_security_group_ids = ["${aws_security_group.public_secgrp.id}"]
subnet_id = "${aws_subnet.pub_subnet.id}"
key_name = "${aws_key_pair.mykeypair.id}"
#count = var.aws_count
tags = var.aws_tags
}
