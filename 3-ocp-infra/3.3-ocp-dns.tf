# API Server and App Ingress Router endpoints

# Add an A Record to the Private Zone
resource "tencentcloud_private_dns_record" "api_server_a_record" {
  zone_id      = data.terraform_remote_state.cloud_infra.outputs.private_zone.id
  record_type  = "A"                             # Record type (A record for IPv4 address)
  record_value = "10.0.1.6"                      # The private IP address
  ttl          = 60                              # Time to live (TTL) in seconds
  sub_domain   = "api.${var.ocp_cluster_name}"   # Resolves to app.mydomain.local
}

resource "tencentcloud_private_dns_record" "app_ingress_a_record" {
  zone_id      = data.terraform_remote_state.cloud_infra.outputs.private_zone.id
  record_type  = "A"                                # Record type (A record for IPv4 address)
  record_value = "10.0.1.7"                         # The private IP address
  ttl          = 60                                 # Time to live (TTL) in seconds
  sub_domain   = "*.apps.${var.ocp_cluster_name}"   # Resolves to app.mydomain.local
}