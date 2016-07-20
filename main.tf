#
# DO NOT DELETE THESE LINES!
#
# Your subnet ID is:
#
#     subnet-5a424367
#
# Your security group ID is:
#
#     sg-ca91a0b1
#
# Your AMI ID is:
#
#     ami-db24d8b6
#
# Your Identity is:
#
#     manheim-d3d9446802a44259755d38e6d163e820
#

variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region" {
  default = "us-east-1"
}

provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.aws_region}"
}

resource "aws_instance" "web" {
    ami = "ami-db24d8b6"
    instance_type = "t2.micro"
    count = "1"

    subnet_id = "subnet-5a424367"
    vpc_security_group_ids = ["sg-ca91a0b1"]

    tags {
     Identity = "manheim-d3d9446802a44259755d38e6d163e820"
     Name = "WaycoolWeb"
     Project = "training"
 }
}

output "public_ip" {
   value = "${join(", ", aws_instance.web.*.public_ip)}"

}

output "public_dns" {
   value = "${join(", ", aws_instance.web.*.public_dns)}"
}

