output "vpc_id" {
  value = tencentcloud_vpc.ocp_vpc.id
}

output "subnet_id" {
  value = tencentcloud_subnet.ocp_public_subnet.id
}

# Output the public IP address of the CVM
output "cvm_public_ip" {
  value = tencentcloud_instance.registry_cvm.public_ip
}