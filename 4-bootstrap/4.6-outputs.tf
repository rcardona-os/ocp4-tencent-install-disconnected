# Outputs
output "bootstrap_ip" {
  value = tencentcloud_instance.bootstrap.private_ip
}

output "bootstrap_ip_login" {
  value = "To connect to bootstrap host: ssh -i PATH_INSTALLATION_SSH_KEY core@${tencentcloud_instance.bootstrap.private_ip}"
}