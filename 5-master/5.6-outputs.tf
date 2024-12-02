# Outputs
output "master_1_ip" {
  value = tencentcloud_instance.master-1.private_ip
}

output "master_1_ip_login" {
  value = "To connect to master-1 host: ssh -i PATH_INSTALLATION_SSH_KEY core@${tencentcloud_private_dns_record.master_1_a_record.record_value}"
}

# Outputs
output "master_2_ip" {
  value = tencentcloud_instance.master-2.private_ip
}

output "master_2_ip_login" {
  value = "To connect to master-2 host: ssh -i PATH_INSTALLATION_SSH_KEY core@${tencentcloud_instance.master-2.private_ip}"
}

# Outputs
output "master_3_ip" {
  value = tencentcloud_instance.master-3.private_ip
}

output "master_3_ip_login" {
  value = "To connect to master-3 host: ssh -i PATH_INSTALLATION_SSH_KEY core@${tencentcloud_instance.master-3.private_ip}"
}