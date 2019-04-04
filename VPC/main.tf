#### common tags to be used for the env. These will be added to all the resources where ever applicable when they are included with the merge() fucntion in the tags part of the resource
locals {
  common_tags = "${map(
    "Environment", "${var.environment}",
    "Terraform", "true"
  )}"
}

#### default provider being used 
provider "aws" {
  region  = "${var.region}"
  version = "~> 1.45"
}

#### elastic IP for the NAT gateway
resource "aws_eip" "this" {
  count = 1
  vpc   = true

  tags = "${merge(
    local.common_tags,
    map("Name", format("%s", var.vpc_name))
  )}"
}

#### using the terraform AWS VPC module to create the VPC along with the subnets (private,public) and the NAT gateway (one per VPC)
module "vpc" {
  source          = "terraform-aws-modules/vpc/aws"
  version         = "1.46.0"
  name            = "${var.vpc_name}"
  cidr            = "${var.vpc_cidr_block}"
  azs             = "${var.azs}"
  private_subnets = "${var.private_subnets}"
  public_subnets  = "${var.public_subnets}"

  enable_nat_gateway = true
  single_nat_gateway = true
  enable_vpn_gateway = false

  tags = "${merge(
    local.common_tags
  )}"
}

# NACL rule for public subnets
resource "aws_network_acl" "public_subnets_nacl" {
  vpc_id     = "${module.vpc.vpc_id}"
  subnet_ids = ["${module.vpc.public_subnets}"]

  tags = "${merge(
    local.common_tags,
    map("Name", "public_subnets_nacl")
  )}"
}

resource "aws_network_acl_rule" "pub_ingress" {
  network_acl_id = "${aws_network_acl.public_subnets_nacl.id}"

  # count       = "${length(var.public_subnets)}"
  # rule_number = "${50 + count.index}"
  rule_number = 9000

  egress      = false
  protocol    = "-1"
  rule_action = "allow"

  # cidr_block  = "${element(var.public_subnets, count.index)}"
  cidr_block = "0.0.0.0/0"
}

resource "aws_network_acl_rule" "pub_egress" {
  network_acl_id = "${aws_network_acl.public_subnets_nacl.id}"

  # count       = "${length(var.public_subnets)}"
  # rule_number = "${50 + count.index}"
  rule_number = 9000

  egress      = true
  protocol    = "-1"
  rule_action = "allow"

  # cidr_block  = "${element(var.public_subnets, count.index)}"
  cidr_block = "0.0.0.0/0"
}

# NACL rule for private subnets
resource "aws_network_acl" "private_subnets_nacl" {
  vpc_id     = "${module.vpc.vpc_id}"
  subnet_ids = ["${module.vpc.private_subnets}"]

  tags = "${merge(
    local.common_tags,
    map("Name", "private_subnets_nacl")
  )}"
}

resource "aws_network_acl_rule" "pvt_ingress" {
  network_acl_id = "${aws_network_acl.private_subnets_nacl.id}"

  # count       = "${length(var.private_subnets)}"
  # rule_number = "${50 + count.index}"
  rule_number = 9000

  egress      = false
  protocol    = "-1"
  rule_action = "allow"

  # cidr_block  = "${element(var.private_subnets, count.index)}"
  cidr_block = "0.0.0.0/0"
}

resource "aws_network_acl_rule" "pvt_egress" {
  network_acl_id = "${aws_network_acl.private_subnets_nacl.id}"

  # count       = "${length(var.private_subnets)}"
  # rule_number = "${50 + count.index}"
  rule_number = 9000

  egress      = true
  protocol    = "-1"
  rule_action = "allow"

  # cidr_block  = "${element(var.private_subnets, count.index)}"
  cidr_block = "0.0.0.0/0"
}
