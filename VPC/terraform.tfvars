# the env that is being brought up
environment = "test"

# the region in which the vpc is being created. refer https://docs.aws.amazon.com/general/latest/gr/rande.html
region = "eu-west-1"

# the name of the elastic ip for the NAT gateway
aws_eip_name = "test-nat"

# the name of the vpc that is being created
vpc_name = "test"

# the CIDR block for the VPC
vpc_cidr_block = "172.20.0.0/16"

# the list of available zones for the AWS region. refer https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-regions-availability-zones.html or run "aws ec2 describe-availability-zones --region <region code>" from cli (aws cli needs to be configured)
azs = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]

# the list of subnets for private_subnets
private_subnets = ["172.20.20.0/24"]

# the list of subnets for public_subnets 
public_subnets = ["172.20.10.0/24"]

