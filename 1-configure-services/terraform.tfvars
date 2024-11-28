

region = "eu-frankfurt" # Replace with your desired region

availability_zone = "eu-frankfurt-1" # Replace with your desired availability zone within the region

vpc_cidr = "10.0.0.0/16"

public_subnet_cidr = "10.0.0.0/24"

image_id = "img-dfq3gram"   # Replace with the custom image ID

instance_type = "S2.LARGE8" # Replace with the instance type required

data_disk_type = "CLOUD_PREMIUM"

# Provides the local file path to the SSH public key used to access virtual machines in the cluster.
# This key ensures secure access for administrative purposes.
public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCQ4hceh2VM92Tyk4tIPIuSKkwGOzhB5KGCxg71o4BJEmVnwIYvoqKrE9wMjpWVV4cpaafGnu2dWvIcqdH318iFhn19DIc/NnUVMNgu47X3gdDDcBHLk4cMroVqtK0sQ49tt1vwQmhK/iri0hXAsgcKuZlIi2QoVjocIR837i5vC+NEDdiG+sh/olYbiGJDuepGRq8D4nK37FsuDQ9LdNfIOoe6hvf5iKLCRXRnHgXMmuOtS68eyJ6ZMg7wXDy2851s7zKajmW5rT37VKM5v0iz/VqTR/QPYuhFXPINxQwyCA9wy0bEJbwoQJLi5ZQdUY3MMgZ+5BIu/oDzlqHleljF"