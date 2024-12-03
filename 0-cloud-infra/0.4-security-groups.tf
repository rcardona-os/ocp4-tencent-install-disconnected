# Create a security group for public access
resource "tencentcloud_security_group" "public_security_group" {
  name        = "ocp-public-security-group"
  description = "Security group for OpenShift with specific port rules"
}

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
    egress {
    action      = "ACCEPT"
    cidr_block  = "169.254.169.254/32"
    protocol    = "TCP"
    port        = "80"
    description = "Access to instance metadata"
  }

  egress {
    action      = "ACCEPT"
    cidr_block  = "183.60.83.19/32"
    protocol    = "TCP"
    port        = "53"
    description = "Access to internal Tencent DNS over TCP"
  }

  egress {
    action      = "ACCEPT"
    cidr_block  = "183.60.83.19/32"
    protocol    = "UDP"
    port        = "53"
    description = "Access to internal Tencent DNS over UDP"
  }

  egress {
    action      = "ACCEPT"
    cidr_block  = "183.60.82.98/32"
    protocol    = "TCP"
    port        = "53"
    description = "Access to internal Tencent DNS over TCP"
  }

  egress {
    action      = "ACCEPT"
    cidr_block  = "183.60.82.98/32"
    protocol    = "UDP"
    port        = "53"
    description = "Access to internal Tencent DNS over UDP"
  }

}