variable "secret_id" {}

variable "secret_key" {}

variable "instance_type" {
  description = "Instance type to provision bootstrap"
  type        = string
  default     = 100
}

variable "data_disk_size" {
  description = "Instance type to provision bootstrap"
  type        = string
  default     = "S3.MEDIUM4"
}

variable "data_disk_type" {
  description = "Instance type to provision bootstrap"
  type        = string
  default     = "CLOUD_PREMIUM"
}