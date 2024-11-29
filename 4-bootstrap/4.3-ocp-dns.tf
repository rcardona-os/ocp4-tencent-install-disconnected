# Bootstrap record

# Add an A Record to the Private Zone
resource "tencentcloud_private_dns_record" "bootstrap_a_record" {
  zone_id      = data.terraform_remote_state.cloud_infra.outputs.private_zone_id
  record_type  = "A"            # Record type (A record for IPv4 address)
  record_value = "10.0.1.8"     # The private IP address
  ttl          = 60             # Time to live (TTL) in seconds
  sub_domain   = "bootstrap"    # Resolves to app.mydomain.local
}