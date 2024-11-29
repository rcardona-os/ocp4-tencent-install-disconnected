
output "master_security_group_id" {
  value = tencentcloud_security_group.master_security_group.id
}

output "worker_security_group_id" {
  value = tencentcloud_security_group.worker_security_group.id
}

output "ocp_private_subnet_1_id" {
  value = tencentcloud_subnet.ocp_private_subnet_1.id
}

output "ocp_private_subnet_2_id" {
  value = tencentcloud_subnet.ocp_private_subnet_2.id
}

output "ocp_private_subnet_3_id" {
  value = tencentcloud_subnet.ocp_private_subnet_3.id
}