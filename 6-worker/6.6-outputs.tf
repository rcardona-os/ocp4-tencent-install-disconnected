# Outputs
output "worker_1_ip" {
  value = tencentcloud_instance.worker-1.private_ip
}

output "worker_1_ip_login" {
  value = "To connect to worker-1 host: ssh -i PATH_INSTALLATION_SSH_KEY core@${tencentcloud_private_dns_record.worker_1_a_record.record_value}"
}

# Outputs
output "worker_2_ip" {
  value = tencentcloud_instance.worker-2.private_ip
}

output "worker_2_ip_login" {
  value = "To connect to worker-2 host: ssh -i PATH_INSTALLATION_SSH_KEY core@${tencentcloud_instance.worker-2.private_ip}"
}

# Outputs
output "worker_3_ip" {
  value = tencentcloud_instance.worker-3.private_ip
}

output "worker_3_ip_login" {
  value = "To connect to worker-3 host: ssh -i PATH_INSTALLATION_SSH_KEY core@${tencentcloud_instance.worker-3.private_ip}"
}