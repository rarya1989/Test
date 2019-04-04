#----main-terraform.tf------

# the region in which the vpc is being created. refer https://docs.aws.amazon.com/general/latest/gr/rande.html
region = "eu-west-1"

# name to be given to the instace 
name = "terraform"

# number of instances that are required
instance_count = 1

# ami to be used for creating the service groups
ami = "ami-45a1a0af"

# instance type to be used
instance_type = "t2.micro"

# the SSH key that will be used during isntance creation
key_name = "Ireland-prodkey"

# list of the SG ids that need to be associated to the isntance
vpc_security_group_ids = ["sg-95b916f3", "sg-d7b916b1"]

# subnet ID where the instance will be launched
subnet_id = "subnet-7801281d"

# termination protection state
disable_api_termination = "true"
