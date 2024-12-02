# Master records

# Add an A Record to the Private Zone
resource "tencentcloud_private_dns_record" "master_1_a_record" {
  zone_id      = data.terraform_remote_state.cloud_infra.outputs.private_zone_id
  record_type  = "A"                     # Record type (A record for IPv4 address)
  record_value = "10.0.1.10"             # The private IP address
  ttl          = 60                      # Time to live (TTL) in seconds
  sub_domain   = "master-0"              # Resolves to app.mydomain.local
}

# Add an A Record to the Private Zone
resource "tencentcloud_private_dns_record" "master_2_a_record" {
  zone_id      = data.terraform_remote_state.cloud_infra.outputs.private_zone_id
  record_type  = "A"                     # Record type (A record for IPv4 address)
  record_value = "10.0.2.10"             # The private IP address
  ttl          = 60                      # Time to live (TTL) in seconds
  sub_domain   = "master-2"              # Resolves to app.mydomain.local
}

# Add an A Record to the Private Zone
resource "tencentcloud_private_dns_record" "master_3_a_record" {
  zone_id      = data.terraform_remote_state.cloud_infra.outputs.private_zone_id
  record_type  = "A"                     # Record type (A record for IPv4 address)
  record_value = "10.0.3.10"             # The private IP address
  ttl          = 60                      # Time to live (TTL) in seconds
  sub_domain   = "master-3"              # Resolves to app.mydomain.local
}