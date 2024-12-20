variable "secret_id" {}

variable "secret_key" {}

variable "availability_zone_1" {
  description = "Availability zone for resources"
  type        = string
  default     = "ap-singapore-1" # Default availability zone
}

variable "availability_zone_2" {
  description = "Availability zone for resources"
  type        = string
  default     = "ap-singapore-2" # Default availability zone
}

variable "availability_zone_3" {
  description = "Availability zone for resources"
  type        = string
  default     = "ap-singapore-3" # Default availability zone
}

variable "ocp_private_subnet_1_cidr" {
  description = "The CIDR block for the public subnet in the Virtual Network"
  type        = string
  default     = "10.0.1.0/24"
}

variable "ocp_private_subnet_2_cidr" {
  description = "The CIDR block for the public subnet in the Virtual Network"
  type        = string
  default     = "10.0.2.0/24"
}

variable "ocp_private_subnet_3_cidr" {
  description = "The CIDR block for the public subnet in the Virtual Network"
  type        = string
  default     = "10.0.3.0/24"
}

variable "ocp_cluster_name" {
  description = "OCP cluster name"
  type        = string
  default     = "a1"
}

variable "coreos_image_id" {
  description = "image ID to use for installation of the registry"
  type        = string
  default     = "img-m8wvl0mk"
}