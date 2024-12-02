##################################################################
############# CVM Instance Resource for worker-1 #################
##################################################################
resource "tencentcloud_instance" "worker-1" {
  instance_name              = "worker-1"
  availability_zone          = data.terraform_remote_state.ocp_infra.outputs.availability_zone_1        # Replace with your desired AZ
  instance_type              = var.instance_type                                                        # Replace with desired instance type
  image_id                   = data.terraform_remote_state.ocp_infra.outputs.coreos_image_id            # Replace with your desired image ID
  orderly_security_groups    = [data.terraform_remote_state.ocp_infra.outputs.worker_security_group_id]
  private_ip                 = tencentcloud_private_dns_record.worker_1_a_record.record_value

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
          source       = "http://registry.${data.terraform_remote_state.cloud_infra.outputs.private_domain}:8080/worker.ign"
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
  internet_charge_type       = "TRAFFIC_POSTPAID_BY_HOUR"                                              # Pay-as-you-go
  subnet_id                  = data.terraform_remote_state.ocp_infra.outputs.ocp_private_subnet_1_id   # Replace with your subnet ID
  vpc_id                     = data.terraform_remote_state.cloud_infra.outputs.vpc_id                  # Replace with your VPC ID

  tags = {
    Environment = "openshift"
    Name        = "worker"
  }
}

##################################################################
############# CVM Instance Resource for worker-2 #################
##################################################################
resource "tencentcloud_instance" "worker-2" {
  instance_name              = "worker-2"
  availability_zone          = data.terraform_remote_state.ocp_infra.outputs.availability_zone_2        # Replace with your desired AZ
  instance_type              = var.instance_type                                                        # Replace with desired instance type
  image_id                   = data.terraform_remote_state.ocp_infra.outputs.coreos_image_id            # Replace with your desired image ID
  orderly_security_groups    = [data.terraform_remote_state.ocp_infra.outputs.worker_security_group_id]
  private_ip                 = tencentcloud_private_dns_record.worker_2_a_record.record_value

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
          source       = "http://registry.${data.terraform_remote_state.cloud_infra.outputs.private_domain}:8080/worker.ign"
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
  internet_charge_type       = "TRAFFIC_POSTPAID_BY_HOUR"                                              # Pay-as-you-go
  subnet_id                  = data.terraform_remote_state.ocp_infra.outputs.ocp_private_subnet_2_id   # Replace with your subnet ID
  vpc_id                     = data.terraform_remote_state.cloud_infra.outputs.vpc_id                  # Replace with your VPC ID

  tags = {
    Environment = "openshift"
    Name        = "worker"
  }
}

##################################################################
############# CVM Instance Resource for worker-3 #################
##################################################################
resource "tencentcloud_instance" "worker-3" {
  instance_name              = "worker-3"
  availability_zone          = data.terraform_remote_state.ocp_infra.outputs.availability_zone_3        # Replace with your desired AZ
  instance_type              = var.instance_type                                                        # Replace with desired instance type
  image_id                   = data.terraform_remote_state.ocp_infra.outputs.coreos_image_id            # Replace with your desired image ID
  orderly_security_groups    = [data.terraform_remote_state.ocp_infra.outputs.worker_security_group_id]
  private_ip                 = tencentcloud_private_dns_record.worker_3_a_record.record_value

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
          source       = "http://registry.${data.terraform_remote_state.cloud_infra.outputs.private_domain}:8080/worker.ign"
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
  internet_charge_type       = "TRAFFIC_POSTPAID_BY_HOUR"                                             # Pay-as-you-go
  subnet_id                  = data.terraform_remote_state.ocp_infra.outputs.ocp_private_subnet_3_id  # Replace with your subnet ID
  vpc_id                     = data.terraform_remote_state.cloud_infra.outputs.vpc_id                 # Replace with your VPC ID

  tags = {
    Environment = "openshift"
    Name        = "worker"
  }
}