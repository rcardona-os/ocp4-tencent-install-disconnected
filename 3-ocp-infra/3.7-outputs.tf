output "ocp_cluster_name" {
  value = var.ocp_cluster_name
}

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

output "master_lb_id" {
  value = tencentcloud_lb.master_lb.id
}

output "master_listener_6443_id" {
  value = tencentcloud_clb_listener.master_listener_6443.id
}

output "master_listener_22623_id" {
  value = tencentcloud_clb_listener.master_listener_22623.id
}

output "coreos_image_id" {
  value = var.coreos_image_id
}

output "availability_zone_1" {
  value = var.availability_zone_1
}