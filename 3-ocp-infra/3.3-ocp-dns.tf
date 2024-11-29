# API Server and App Ingress Router endpoints

# Add an A Record to the Private Zone
resource "tencentcloud_private_dns_record" "api_server_a_record" {
  zone_id      = data.terraform_remote_state.cloud_infra_for_ocp.outputs.private_zone.id
  record_type  = "A"                             # Record type (A record for IPv4 address)
  record_value = "10.0.1.6"                      # The private IP address
  ttl          = 60                              # Time to live (TTL) in seconds
  sub_domain   = "api.${var.ocp_cluster_name}"   # Resolves to app.mydomain.local
}

resource "tencentcloud_private_dns_record" "app_ingress_a_record" {
  zone_id      = data.terraform_remote_state.cloud_infra_for_ocp.outputs.private_zone.id
  record_type  = "A"                                # Record type (A record for IPv4 address)
  record_value = "10.0.1.7"                         # The private IP address
  ttl          = 60                                 # Time to live (TTL) in seconds
  sub_domain   = "*.apps.${var.ocp_cluster_name}"   # Resolves to app.mydomain.local
}

# Bootstrap record

# Add an A Record to the Private Zone
resource "tencentcloud_private_dns_record" "master_0_a_record" {
  zone_id      = data.terraform_remote_state.cloud_infra_for_ocp.outputs.private_zone.id
  record_type  = "A"                     # Record type (A record for IPv4 address)
  record_value = "10.0.1.8"              # The private IP address
  ttl          = 60                      # Time to live (TTL) in seconds
  sub_domain   = "bootstrap"              # Resolves to app.mydomain.local
}

# Master records

# Add an A Record to the Private Zone
resource "tencentcloud_private_dns_record" "master_0_a_record" {
  zone_id      = data.terraform_remote_state.cloud_infra_for_ocp.outputs.private_zone.id
  record_type  = "A"                     # Record type (A record for IPv4 address)
  record_value = "10.0.1.10"              # The private IP address
  ttl          = 60                      # Time to live (TTL) in seconds
  sub_domain   = "master-0"              # Resolves to app.mydomain.local
}

# Add an A Record to the Private Zone
resource "tencentcloud_private_dns_record" "master_1_a_record" {
  zone_id      = data.terraform_remote_state.cloud_infra_for_ocp.outputs.private_zone.id
  record_type  = "A"                     # Record type (A record for IPv4 address)
  record_value = "10.0.2.10"              # The private IP address
  ttl          = 60                      # Time to live (TTL) in seconds
  sub_domain   = "master-2"              # Resolves to app.mydomain.local
}

# Add an A Record to the Private Zone
resource "tencentcloud_private_dns_record" "master_3_a_record" {
  zone_id      = data.terraform_remote_state.cloud_infra_for_ocp.outputs.private_zone.id
  record_type  = "A"                     # Record type (A record for IPv4 address)
  record_value = "10.0.3.10"              # The private IP address
  ttl          = 60                      # Time to live (TTL) in seconds
  sub_domain   = "master-3"              # Resolves to app.mydomain.local
}

# Worker records

# Add an A Record to the Private Zone
resource "tencentcloud_private_dns_record" "worker_1_a_record" {
  zone_id      = data.terraform_remote_state.cloud_infra_for_ocp.outputs.private_zone.id
  record_type  = "A"                     # Record type (A record for IPv4 address)
  record_value = "10.0.1.11"              # The private IP address
  ttl          = 60                      # Time to live (TTL) in seconds
  sub_domain   = "worker-0"              # Resolves to app.mydomain.local
}

# Add an A Record to the Private Zone
resource "tencentcloud_private_dns_record" "worker_2_a_record" {
  zone_id      = data.terraform_remote_state.cloud_infra_for_ocp.outputs.private_zone.id
  record_type  = "A"                     # Record type (A record for IPv4 address)
  record_value = "10.0.2.11"              # The private IP address
  ttl          = 60                      # Time to live (TTL) in seconds
  sub_domain   = "worker-2"              # Resolves to app.mydomain.local
}

# Add an A Record to the Private Zone
resource "tencentcloud_private_dns_record" "worker_3_a_record" {
  zone_id      = data.terraform_remote_state.cloud_infra_for_ocp.outputs.private_zone.id
  record_type  = "A"                     # Record type (A record for IPv4 address)
  record_value = "10.0.3.11"              # The private IP address
  ttl          = 60                      # Time to live (TTL) in seconds
  sub_domain   = "worker-3"              # Resolves to app.mydomain.local
}