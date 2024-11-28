variable "secret_id" {}

variable "secret_key" {}

variable "region" {
  description = "secret_key to use for installation"
  type        = string
}

variable "availability_zone" {
  description = "secret_key to use for installation"
  type        = string
}

variable "vpc_cidr" {
  description = "The CIDR block for the public subnet in the Virtual Network"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "The CIDR block for the public subnet in the Virtual Network"
  type        = string
  default     = "10.0.0.0/24"
}

variable "image_id" {
  description = "image ID to use for installation of the registry"
  type        = string
}

variable instance_type {
  description = "Instance type to use for installation of the registry"
  type        = string
}

variable data_disk_type {
  description = "Disk type to use for installation of the registry"
  type        = string
}

# Define the variables for SSH key and subnet CIDR
variable "public_key" {
  description = "SSH key pair"
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCQ4hceh2VM92Tyk4tIPIuSKkwGOzhB5KGCxg71o4BJEmVnwIYvoqKrE9wMjpWVV4cpaafGnu2dWvIcqdH318iFhn19DIc/NnUVMNgu47X3gdDDcBHLk4cMroVqtK0sQ49tt1vwQmhK/iri0hXAsgcKuZlIi2QoVjocIR837i5vC+NEDdiG+sh/olYbiGJDuepGRq8D4nK37FsuDQ9LdNfIOoe6hvf5iKLCRXRnHgXMmuOtS68eyJ6ZMg7wXDy2851s7zKajmW5rT37VKM5v0iz/VqTR/QPYuhFXPINxQwyCA9wy0bEJbwoQJLi5ZQdUY3MMgZ+5BIu/oDzlqHleljF"
}