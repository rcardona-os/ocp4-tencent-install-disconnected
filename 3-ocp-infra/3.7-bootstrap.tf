# CVM Instance Resource
resource "tencentcloud_instance" "bootstrap" {
  instance_name              = "bootstrap"
  availability_zone          = var.availability_zone_1  # Replace with your desired AZ
  instance_type              = "S3.MEDIUM4"             # Replace with desired instance type
  image_id                   = var.coreos_image_id     # Replace with your desired image ID
  orderly_security_groups    = [tencentcloud_security_group.master_security_group.id]
  private_ip                 = "10.0.1.9"

  data_disks {
    data_disk_size = 50               # System disk size in GB
    data_disk_type = "CLOUD_PREMIUM"  # Disk type
    encrypt = false
  }

  # UserData encoded in Base64
  user_data = base64encode(jsonencode({
    ignition = {
      config = {
        replace = {
          source       = "http://registry.ocp4.com:8080/bootstrap.ign"
          verification = {}
        }
      }
      timeouts = {}
      version  = "2.2.0"
    }
    networkd = {}
    passwd   = {}
    storage  = {}
    systemd  = {}
  }))

  # Network Configuration
  internet_charge_type       = "TRAFFIC_POSTPAID_BY_HOUR"                                      # Pay-as-you-go
  internet_max_bandwidth_out = 10                                                              # Bandwidth in Mbps
  subnet_id                  = var.ocp_private_subnet_1_cidr                                   # Replace with your subnet ID
  vpc_id                     = data.terraform_remote_state.cloud_infra_for_ocp.outputs.vpc_id  # Replace with your VPC ID

  tags = {
    Environment = "openshift"
    Name        = "bootstrap"
  }
}

# Outputs
output "bootstrap_id" {
  value = tencentcloud_instance.bootstrap.id
}