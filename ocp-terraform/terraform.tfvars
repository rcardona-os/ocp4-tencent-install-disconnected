

region = "eu-frankfurt" # Replace with your desired region

availability_zone = "eu-frankfurt-1" # Replace with your desired availability zone within the region

vpc_cidr = "10.0.0.0/16"

public_subnet_cidr = "10.0.0.0/24"

image_id = "img-dfq3gram"   # Replace with the custom image ID

instance_type = "S2.MEDIUM2" # Replace with the instance type required

data_disk_type = "CLOUD_PREMIUM"

# Provides the local file path to the SSH public key used to access virtual machines in the cluster.
# This key ensures secure access for administrative purposes.
# Example: "~/.ssh/id_rsa.pub" is the default SSH key location in most Unix-like systems.
ssh_key_path = "skey-gulieqk1"