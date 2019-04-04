variable "environment" {
  description = "a name for the environment that is being created"
  default     = ""
}

variable "region" {
  description = "the AWS region name where the env will be brought up"
  default     = "eu-west-1"
}

variable "aws_eip_name" {
  description = "name of the elastic ip"
  default     = ""
}

variable "vpc_name" {
  description = "the name of the VPC that needs to be created"
  default     = ""
}

variable "vpc_cidr_block" {
  description = "the private CIDR block to be used for the VPC"
  default     = ""
}

variable "azs" {
  description = "a list of availability zones that have to be used"
  type        = "list"
  default     = []
}

variable "private_subnet_suffix" {
  type        = "string"
  description = "Suffix to append to private subnets name"
  default     = "prv"
}

variable "public_subnet_suffix" {
  type        = "string"
  description = "Suffix to append to public subnets name"
  default     = "pub"
}

variable "private_subnets" {
  description = "the list of subnets for private_subnets "
  type        = "list"
  default     = []
}

variable "public_subnets" {
  description = "the list of subnets for public_subnets"
  type        = "list"
  default     = []
}
