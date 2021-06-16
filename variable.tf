variable "aws_instance_type" {
type = string
default = "t2.micro"
}

variable "aws_region" {
type = string
default = "us-east-1"

}

variable "aws_count" {
type = number
default = 1

}

#variable "aws_instance_type_list" {
#type = list(string)
#default = ["t2.small","t2.micro","t2.large"]
#}

variable "aws_tags" {
type = map(string)
default = {
Name = "webapp"
tiertype ="ec2web"
}
}
