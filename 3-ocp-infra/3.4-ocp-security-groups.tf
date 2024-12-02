################################################################################
################## Network Security Group for Master Hosts  ####################
################################################################################

# Create a security group for master host with private access 
resource "tencentcloud_security_group" "master_security_group" {
  name        = "master-security-group"
  description = "Security group for OpenShift with specific port rules"
}

# # Allow ICMP using individual rule definitions
# resource "tencentcloud_security_group_rule" "master_allow_icmp_ingress" {
#   security_group_id = tencentcloud_security_group.master_security_group.id
#   type              = "ingress"
#   ip_protocol       = "ICMP"
#   cidr_ip           = data.terraform_remote_state.cloud_infra.outputs.vpc_cidr
#   description       = "Allow ICMP inbound traffic"
#   policy            = "accept" 
# }

# resource "tencentcloud_security_group_rule" "master_allow_icmp_egress" {
#   security_group_id = tencentcloud_security_group.master_security_group.id
#   type              = "egress"
#   ip_protocol       = "ICMP"
#   cidr_ip           = data.terraform_remote_state.cloud_infra.outputs.vpc_cidr
#   policy            = "accept" 
#   description       = "Allow ICMP outbound traffic"
# }

# Define the security group rule set
resource "tencentcloud_security_group_rule_set" "master_security_group_rules" {
  security_group_id = tencentcloud_security_group.master_security_group.id

  # TCP Rules
  ingress {
    action      = "ACCEPT"
    cidr_block  = data.terraform_remote_state.cloud_infra.outputs.vpc_cidr
    protocol    = "ICMP"
    description = "A:Block ping3"
  }

  ingress {
    action      = "ACCEPT"
    cidr_block  = data.terraform_remote_state.cloud_infra.outputs.vpc_cidr
    protocol    = "TCP"
    port        = "22"
    description = "Allow SSH access (TCP 22)"
  }

  ingress {
    action      = "ACCEPT"
    cidr_block  = data.terraform_remote_state.cloud_infra.outputs.vpc_cidr
    protocol    = "TCP"
    port        = "443"
    description = "Allow Azure Management (TCP 443)"
  }

  ingress {
    action      = "ACCEPT"
    cidr_block  = data.terraform_remote_state.cloud_infra.outputs.vpc_cidr
    protocol    = "TCP"
    port        = "53"
    description = "Allow DNS queries (TCP 53)"
  }

  ingress {
    action      = "ACCEPT"
    cidr_block  = data.terraform_remote_state.cloud_infra.outputs.vpc_cidr
    protocol    = "TCP"
    port        = "80"
    description = "Allow HTTP inbound traffic (TCP 80)"
  }

  ingress {
    action      = "ACCEPT"
    cidr_block  = data.terraform_remote_state.cloud_infra.outputs.vpc_cidr
    protocol    = "TCP"
    port        = "443"
    description = "Allow HTTPS access (TCP 443)"
  }

  ingress {
    action      = "ACCEPT"
    cidr_block  = data.terraform_remote_state.cloud_infra.outputs.vpc_cidr
    protocol    = "TCP"
    port        = "19531"
    description = "Allow custom app (TCP 19531)"
  }

  ingress {
    action      = "ACCEPT"
    cidr_block  = data.terraform_remote_state.cloud_infra.outputs.vpc_cidr
    protocol    = "TCP"
    port        = "6443"
    description = "Allow Kubernetes API Server (TCP 6443)"
  }

  ingress {
    action      = "ACCEPT"
    cidr_block  = data.terraform_remote_state.cloud_infra.outputs.vpc_cidr
    protocol    = "TCP"
    port        = "22623"
    description = "Allow custom service (TCP 22623)"
  }

  ingress {
    action      = "ACCEPT"
    cidr_block  = data.terraform_remote_state.cloud_infra.outputs.vpc_cidr
    protocol    = "TCP"
    port        = "1936"
    description = "Allow custom monitoring (TCP 1936)"
  }

  ingress {
    action      = "ACCEPT"
    cidr_block  = data.terraform_remote_state.cloud_infra.outputs.vpc_cidr
    protocol    = "TCP"
    port        = "9000-9999"
    description = "Allow application range (TCP 9000-9999)"
  }

  ingress {
    action      = "ACCEPT"
    cidr_block  = data.terraform_remote_state.cloud_infra.outputs.vpc_cidr
    protocol    = "TCP"
    port        = "10250-10259"
    description = "Allow Kubelet communication (TCP 10250-10259)"
  }

  ingress {
    action      = "ACCEPT"
    cidr_block  = data.terraform_remote_state.cloud_infra.outputs.vpc_cidr
    protocol    = "TCP"
    port        = "30000-32767"
    description = "Allow NodePort services (TCP 30000-32767)"
  }

  # UDP Rules
  ingress {
    action      = "ACCEPT"
    cidr_block  = data.terraform_remote_state.cloud_infra.outputs.vpc_cidr
    protocol    = "UDP"
    port        = "53"
    description = "Allow DNS queries (UDP 53)"
  }

  ingress {
    action      = "ACCEPT"
    cidr_block  = data.terraform_remote_state.cloud_infra.outputs.vpc_cidr
    protocol    = "UDP"
    port        = "4789"
    description = "Allow VXLAN traffic (UDP 4789)"
  }

  ingress {
    action      = "ACCEPT"
    cidr_block  = data.terraform_remote_state.cloud_infra.outputs.vpc_cidr
    protocol    = "UDP"
    port        = "6081"
    description = "Allow Geneve traffic (UDP 6081)"
  }

  ingress {
    action      = "ACCEPT"
    cidr_block  = data.terraform_remote_state.cloud_infra.outputs.vpc_cidr
    protocol    = "UDP"
    port        = "9000-9999"
    description = "Allow application range (UDP 9000-9999)"
  }

  ingress {
    action      = "ACCEPT"
    cidr_block  = data.terraform_remote_state.cloud_infra.outputs.vpc_cidr
    protocol    = "UDP"
    port        = "500"
    description = "Allow IPSec traffic (UDP 500)"
  }

  ingress {
    action      = "ACCEPT"
    cidr_block  = data.terraform_remote_state.cloud_infra.outputs.vpc_cidr
    protocol    = "UDP"
    port        = "4500"
    description = "Allow IPSec NAT-T (UDP 4500)"
  }

  ingress {
    action      = "ACCEPT"
    cidr_block  = data.terraform_remote_state.cloud_infra.outputs.vpc_cidr
    protocol    = "UDP"
    port        = "123"
    description = "Allow NTP (UDP 123)"
  }

  ingress {
    action      = "ACCEPT"
    cidr_block  = data.terraform_remote_state.cloud_infra.outputs.vpc_cidr
    protocol    = "UDP"
    port        = "30000-32767"
    description = "Allow NodePort services (UDP 30000-32767)"
  }

  egress {
    action      = "ACCEPT"
    cidr_block  = data.terraform_remote_state.cloud_infra.outputs.vpc_cidr
    protocol    = "ICMP"
    description = "A:Block ping3"
  }
}

################################################################################
################## Network Security Group for Worker Hosts  ####################
################################################################################

# Create a security group for master host with private access 
resource "tencentcloud_security_group" "worker_security_group" {
  name        = "master-security-group"
  description = "Security group for OpenShift with specific port rules"
}

# # Allow ICMP using individual rule definitions
# resource "tencentcloud_security_group_rule" "worker_allow_icmp_ingress" {
#   security_group_id = tencentcloud_security_group.worker_security_group.id
#   type              = "ingress"
#   ip_protocol       = "ICMP"
#   cidr_ip           = data.terraform_remote_state.cloud_infra.outputs.vpc_cidr
#   description       = "Allow ICMP inbound traffic"
#   policy            = "accept" 
# }

# resource "tencentcloud_security_group_rule" "worker_allow_icmp_egress" {
#   security_group_id = tencentcloud_security_group.worker_security_group.id
#   type              = "egress"
#   ip_protocol       = "ICMP"
#   cidr_ip           = data.terraform_remote_state.cloud_infra.outputs.vpc_cidr
#   policy            = "accept" 
#   description       = "Allow ICMP outbound traffic"
# }


# Define the security group rule set
resource "tencentcloud_security_group_rule_set" "worker_security_group_rules" {
  security_group_id = tencentcloud_security_group.worker_security_group.id

  # TCP Rules

  ingress {
    action      = "ACCEPT"
    cidr_block  = data.terraform_remote_state.cloud_infra.outputs.vpc_cidr
    protocol    = "ICMP"
    description = "A:Block ping3"
  }

  ingress {
    action      = "ACCEPT"
    cidr_block  = data.terraform_remote_state.cloud_infra.outputs.vpc_cidr
    protocol    = "TCP"
    port        = "22"
    description = "Allow SSH access (TCP 22)"
  }

  ingress {
    action      = "ACCEPT"
    cidr_block  = data.terraform_remote_state.cloud_infra.outputs.vpc_cidr
    protocol    = "TCP"
    port        = "53"
    description = "Allow DNS queries (TCP 53)"
  }

  ingress {
    action      = "ACCEPT"
    cidr_block  = data.terraform_remote_state.cloud_infra.outputs.vpc_cidr
    protocol    = "TCP"
    port        = "80"
    description = "Allow HTTP traffic (TCP 80)"
  }

  ingress {
    action      = "ACCEPT"
    cidr_block  = data.terraform_remote_state.cloud_infra.outputs.vpc_cidr
    protocol    = "TCP"
    port        = "443"
    description = "Allow HTTPS traffic (TCP 443)"
  }

  ingress {
    action      = "ACCEPT"
    cidr_block  = data.terraform_remote_state.cloud_infra.outputs.vpc_cidr
    protocol    = "TCP"
    port        = "1936"
    description = "Allow monitoring traffic (TCP 1936)"
  }

  ingress {
    action      = "ACCEPT"
    cidr_block  = data.terraform_remote_state.cloud_infra.outputs.vpc_cidr
    protocol    = "TCP"
    port        = "9000-9999"
    description = "Allow application range (TCP 9000-9999)"
  }

  ingress {
    action      = "ACCEPT"
    cidr_block  = data.terraform_remote_state.cloud_infra.outputs.vpc_cidr
    protocol    = "TCP"
    port        = "10250-10259"
    description = "Allow Kubernetes node communication (TCP 10250-10259)"
  }

  ingress {
    action      = "ACCEPT"
    cidr_block  = data.terraform_remote_state.cloud_infra.outputs.vpc_cidr
    protocol    = "TCP"
    port        = "30000-32767"
    description = "Allow NodePort services (TCP 30000-32767)"
  }

  # UDP Rules
  ingress {
    action      = "ACCEPT"
    cidr_block  = data.terraform_remote_state.cloud_infra.outputs.vpc_cidr
    protocol    = "UDP"
    port        = "53"
    description = "Allow DNS queries (UDP 53)"
  }

  ingress {
    action      = "ACCEPT"
    cidr_block  = data.terraform_remote_state.cloud_infra.outputs.vpc_cidr
    protocol    = "UDP"
    port        = "4789"
    description = "Allow VXLAN traffic (UDP 4789)"
  }

  ingress {
    action      = "ACCEPT"
    cidr_block  = data.terraform_remote_state.cloud_infra.outputs.vpc_cidr
    protocol    = "UDP"
    port        = "6081"
    description = "Allow Geneve traffic (UDP 6081)"
  }

  ingress {
    action      = "ACCEPT"
    cidr_block  = data.terraform_remote_state.cloud_infra.outputs.vpc_cidr
    protocol    = "UDP"
    port        = "9000-9999"
    description = "Allow application range (UDP 9000-9999)"
  }

  ingress {
    action      = "ACCEPT"
    cidr_block  = data.terraform_remote_state.cloud_infra.outputs.vpc_cidr
    protocol    = "UDP"
    port        = "500"
    description = "Allow IPSec traffic (UDP 500)"
  }

  ingress {
    action      = "ACCEPT"
    cidr_block  = data.terraform_remote_state.cloud_infra.outputs.vpc_cidr
    protocol    = "UDP"
    port        = "4500"
    description = "Allow IPSec NAT-T (UDP 4500)"
  }

  ingress {
    action      = "ACCEPT"
    cidr_block  = data.terraform_remote_state.cloud_infra.outputs.vpc_cidr
    protocol    = "UDP"
    port        = "123"
    description = "Allow NTP traffic (UDP 123)"
  }

  ingress {
    action      = "ACCEPT"
    cidr_block  = data.terraform_remote_state.cloud_infra.outputs.vpc_cidr
    protocol    = "UDP"
    port        = "30000-32767"
    description = "Allow NodePort services (UDP 30000-32767)"
  }

  egress {
    action      = "ACCEPT"
    cidr_block  = data.terraform_remote_state.cloud_infra.outputs.vpc_cidr
    protocol    = "ICMP"
    description = "A:Block ping3"
  }
}