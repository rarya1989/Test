#---Main.tf-------

provider "aws" {
  region  = "${var.region}"
  version = "~> 1.45"
}

data "template_file" "user-init" {
  template = "${file("${path.module}/userdata.tpl")}"
}

#--Compute-----------

module "ec2_cluster" {
  source                  = "terraform-aws-modules/ec2-instance/aws"
  version                 = "1.12.0"
  name                    = "${var.name}"
  instance_count          = "${var.instance_count}"
  ami                     = "${var.ami}"
  instance_type           = "${var.instance_type}"
  subnet_id               = "${var.subnet_id}"
  key_name                = "${var.key_name}"
  vpc_security_group_ids  = ["${var.vpc_security_group_ids}"]
  disable_api_termination = "${var.disable_api_termination}"
}
