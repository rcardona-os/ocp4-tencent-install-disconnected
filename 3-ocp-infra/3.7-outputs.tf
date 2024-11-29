# Output the public IP address of the CVM
output "registry_public_ip" {
  value = tencentcloud_instance.registry.public_ip
}

output "ssh_key_pair_id" {
  value = tencentcloud_key_pair.ssh_key_pair.id
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