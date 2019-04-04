#---main/variable.tf----------------
#----Compute----------------
variable "region" {
  description = "the AWS region name where the env will be brought up"
  default     = "eu-west-1"
}

variable "name" {
  type        = "string"
  default     = ""
  description = "name to be given to the instace "
}

variable "instance_count" {
  description = "Number of instances to launch"
  default     = 1
}

variable "ami" {
  description = "ID of AMI to use for the instance"
}

variable "disable_api_termination" {
  description = "If true, enables EC2 Instance Termination Protection"
  default     = true
}

variable "instance_type" {
  description = "The type of instance to start"
}

variable "key_name" {
  description = "The key name to use for the instance"
  default     = "Zeo-Prod-Ireland"
}

variable "vpc_security_group_ids" {
  description = "A list of security group IDs to associate with"
  type        = "list"
}

variable "subnet_id" {
  description = "The VPC Subnet ID to launch in"
  default     = ""
}
