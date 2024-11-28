resource "tencentcloud_key_pair" "ssh_key_pair" {
  key_name   = "ssh-key-pair"
  public_key = var.public_key
}


# Create a CVM instance
resource "tencentcloud_instance" "registry_cvm" {
  instance_name              = "registry"
  availability_zone          = var.availability_zone
  image_id                   = var.image_id     # Replace with the custom image ID
  instance_type              = var.instance_type      # Adjust instance type as needed
  vpc_id                     = tencentcloud_vpc.ocp_vpc.id
  subnet_id                  = tencentcloud_subnet.ocp_public_subnet.id
  orderly_security_groups    = [tencentcloud_security_group.ocp_public_security_group.id]
  key_ids                    = tencentcloud_key_pair.ssh_key_pair.id
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

