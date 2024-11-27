# Create a Private DNS Zone
resource "tencentcloud_private_dns_zone" "ocp_hosted_private_zone" {
  domain   = "ocp4.com"                       # The custom domain name
  remark   = "Private DNS zone for my VPC"

  # Associate the private zone with a VPC
  vpc_set {
    uniq_vpc_id = tencentcloud_vpc.ocp_vpc.id
    region = var.region
  }
}

# Add an A Record to the Private Zone
resource "tencentcloud_private_dns_record" "a_record" {
  zone_id      = tencentcloud_private_dns_zone.ocp_hosted_private_zone.id
  record_type  = "A"                     # Record type (A record for IPv4 address)
  record_value = "10.0.0.5"              # The private IP address
  ttl          = 60                      # Time to live (TTL) in seconds
  sub_domain   = "registry"              # Resolves to app.mydomain.local
}