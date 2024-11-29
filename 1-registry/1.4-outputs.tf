# Output the public IP address of the CVM
output "registry_public_ip" {
  value = tencentcloud_instance.registry.public_ip
}

output "ssh_key_pair_id" {
  value = tencentcloud_key_pair.ssh_key_pair.id
}

output "ssh_key_pair_content" {
  value = var.public_key
}