# Create a security group for public access
resource "tencentcloud_security_group" "public_security_group" {
  name        = "ocp-public-security-group"
  description = "Security group for OpenShift with specific port rules"
}

# # Allow ICMP using individual rule definitions
# resource "tencentcloud_security_group_rule" "allow_icmp_ingress" {
#   security_group_id = tencentcloud_security_group.public_security_group.id
#   type              = "ingress"
#   ip_protocol       = "ICMP"
#   cidr_ip           = "0.0.0.0/0"
#   description       = "Allow ICMP inbound traffic"
#   policy            = "accept" 
# }

# resource "tencentcloud_security_group_rule" "allow_icmp_egress" {
#   security_group_id = tencentcloud_security_group.public_security_group.id
#   type              = "egress"
#   ip_protocol       = "ICMP"
#   cidr_ip           = "0.0.0.0/0"
#   policy            = "accept" 
#   description       = "Allow ICMP outbound traffic"
# }

# Define the security group rule set
resource "tencentcloud_security_group_rule_set" "public_security_group_rules" {
  security_group_id = tencentcloud_security_group.public_security_group.id

  ingress {
    action      = "ACCEPT"
    cidr_block  = "0.0.0.0/0"
    protocol    = "ICMP"
    description = "A:Block ping3"
  }

  ingress {
    action      = "ACCEPT"
    cidr_block  = "0.0.0.0/0"
    protocol    = "TCP"
    port        = "22"
    description = "Allow SSH access"
  }

  ingress {
    action      = "ACCEPT"
    cidr_block  = "0.0.0.0/0"
    protocol    = "TCP"
    port        = "80"
    description = "Allow HTTP inbound traffic"
  }

  ingress {
    action      = "ACCEPT"
    cidr_block  = "0.0.0.0/0"
    protocol    = "TCP"
    port        = "443"
    description = "Allow HTTPS access"
  }

  ingress {
    action      = "ACCEPT"
    cidr_block  = "0.0.0.0/0"
    protocol    = "TCP"
    port        = "8443"
    description = "Allow custom port 8443"
  }

# Ensuring access to internet
 
   egress {
    action      = "ACCEPT"
    cidr_block  = "0.0.0.0/0"
    protocol    = "ICMP"
    description = "A:Block ping3"
  }

  egress {
    action      = "ACCEPT"
    cidr_block  = "0.0.0.0/0"
    protocol    = "TCP"
    port        = "80"
    description = "Allow outbound HTTP traffic"
  }

  # Allow outbound HTTPS traffic
  egress {
    action      = "ACCEPT"
    cidr_block  = "0.0.0.0/0"
    protocol    = "TCP"
    port        = "443"
    description = "Allow outbound HTTPS traffic"
  }

}