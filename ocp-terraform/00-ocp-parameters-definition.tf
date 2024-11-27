
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
variable "ssh_key_path" {
  description = "Name of the SSH key pair"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}