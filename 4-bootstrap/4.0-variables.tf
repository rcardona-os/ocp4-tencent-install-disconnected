variable "secret_id" {}

variable "secret_key" {}

variable "coreos_image_id" {
  description = "Image ID to use for installation of the registry"
  type        = string
}

variable "instance_type" {
  description = "Instance type to provision bootstrap"
  type        = string
  default     = "S3.MEDIUM4"
}