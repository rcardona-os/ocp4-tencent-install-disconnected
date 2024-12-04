# CVM Instance Resource
resource "tencentcloud_instance" "bootstrap" {
  instance_name              = "bootstrap"
  availability_zone          = data.terraform_remote_state.ocp_infra.outputs.availability_zone_1        # Replace with your desired AZ
  instance_type              = var.instance_type                                                        # Replace with desired instance type
  image_id                   = data.terraform_remote_state.ocp_infra.outputs.coreos_image_id            # Replace with your desired image ID
  orderly_security_groups    = [data.terraform_remote_state.ocp_infra.outputs.master_security_group_id]
  private_ip                 = tencentcloud_private_dns_record.bootstrap_a_record.record_value

  data_disks {
    data_disk_size = var.data_disk_size # System disk size in GB
    data_disk_type = var.data_disk_type  # Disk type
    encrypt = false
  }

  #UserData encoded in Base64
  user_data = base64encode(jsonencode({
    ignition = {
      config = {
        replace = {
          source       = "http://registry.${data.terraform_remote_state.cloud_infra.outputs.private_domain}/bootstrap.ign"
          verification = {}
        }
      }
      timeouts = {}
      version  = "3.2.0"
    }
    networkd = {}
    passwd   = {}
    storage  = {}
    systemd  = {}
  }))

  # Network Configuration
  internet_charge_type       = "TRAFFIC_POSTPAID_BY_HOUR"                                             # Pay-as-you-go
  subnet_id                  = data.terraform_remote_state.ocp_infra.outputs.ocp_private_subnet_1_id  # Replace with your subnet ID
  vpc_id                     = data.terraform_remote_state.cloud_infra.outputs.vpc_id                 # Replace with your VPC ID

  tags = {
    Environment = "openshift"
    Name        = "bootstrap"
  }
}