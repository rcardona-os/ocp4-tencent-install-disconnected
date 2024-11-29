
resource "tencentcloud_key_pair" "ssh_key_pair" {
  key_name   = "ssh_key_pair"
  public_key = var.public_key
}

# Create a CVM instance
resource "tencentcloud_instance" "registry" {
  instance_name              = "registry"
  availability_zone          = data.terraform_remote_state.cloud_infra.outputs.availability_zone
  image_id                   = var.image_id     # Replace with the custom image ID
  instance_type              = var.instance_type      # Adjust instance type as needed
  vpc_id                     = data.terraform_remote_state.cloud_infra.outputs.vpc_id
  subnet_id                  = data.terraform_remote_state.cloud_infra.outputs.public_subnet_id
  orderly_security_groups    = [data.terraform_remote_state.cloud_infra.outputs.public_security_group_id]
  depends_on                 = [tencentcloud_key_pair.ssh_key_pair]
  key_ids                    = [tencentcloud_key_pair.ssh_key_pair.id]
  allocate_public_ip         = true
  internet_max_bandwidth_out = 50 # Specify the maximum outbound bandwidth in Mbps
  private_ip                 = "10.0.0.5"


  data_disks {
    data_disk_type = var.data_disk_type
    data_disk_size = 100
    encrypt        = false
  }

  tags = {
    environment = "openshift"
  }
}