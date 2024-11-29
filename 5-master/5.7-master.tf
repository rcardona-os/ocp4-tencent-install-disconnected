# CVM Instance Resource
resource "tencentcloud_instance" "master-0" {
  instance_name              = "master-0"
  availability_zone          = data.terraform_remote_state.ocp_infra.outputs.availability_zone_1        # Replace with your desired AZ
  instance_type              = var.instance_type                                                              # Replace with desired instance type
  image_id                   = data.terraform_remote_state.ocp_infra.outputs.coreos_image_id             # Replace with your desired image ID
  orderly_security_groups    = [data.terraform_remote_state.ocp_infra.outputs.master_security_group_id]
  private_ip                 = tencentcloud_private_dns_record.master_0_a_record.record_value

  data_disks {
    data_disk_size = var.data_disk_size # System disk size in GB
    data_disk_type = var.data_disk_type  # Disk type
    encrypt = false
  }

  # UserData encoded in Base64
  user_data = base64encode(jsonencode({
    ignition = {
      config = {
        replace = {
          source       = "http://registry.${data.terraform_remote_state.cloud_infra.outputs.private_domain}:8080/master.ign"
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
  internet_charge_type       = "TRAFFIC_POSTPAID_BY_HOUR"                                                # Pay-as-you-go
  internet_max_bandwidth_out = 10                                                                        # Bandwidth in Mbps
  subnet_id                  = data.terraform_remote_state.ocp_infra.outputs.ocp_private_subnet_1_cidr   # Replace with your subnet ID
  vpc_id                     = data.terraform_remote_state.cloud_infra_for_ocp.outputs.vpc_id            # Replace with your VPC ID

  tags = {
    Environment = "openshift"
    Name        = "master"
  }
}