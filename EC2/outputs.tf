#---main-output.tf----------

output "instance_id" {
  value = "${module.ec2_cluster.id}"
}

output "private_ip" {
  value = "${module.ec2_cluster.private_ip}"
}
