
variable "secret_id" {}

variable "secret_key" {}

variable "region" {
  description = "Region for deployment"
  type        = string
  default     = "eu-frankfurt" # Default region
}

variable "availability_zone" {
  description = "Availability zone for resources"
  type        = string
  default     = "eu-frankfurt-1" # Default availability zone
}

variable "private_domain" {
  description = "domain zone for resources"
  type        = string
  default     = "ocp4.com" # Default availability zone
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