variable "secret_id" {}

variable "secret_key" {}

variable "availability_zone" {
  description = "Availability zone for resources"
  type        = string
  default     = "ap-singapore-1" # Default availability zone
}

variable "region" {
  description = "Region for deployment"
  type        = string
  default     = "ap-singapore" # Default region
}

variable "image_id" {
  description = "Image ID to use for installation of the registry"
  type        = string
  default     = "img-dfq3gram"
}

variable "instance_type" {
  description = "Instance type to use for installation of the registry"
  type        = string
  default     = "S2.LARGE8"
}

variable "data_disk_type" {
  description = "Disk type to use for installation of the registry"
  type        = string
  default     = "CLOUD_PREMIUM"
}

variable "data_disk_size" {
  description = "Instance type to provision bootstrap"
  type        = number
  default     = 100
}

# Define the variables for SSH key and subnet CIDR
variable "public_key" {
  description = "SSH key pair"
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC5g7QLA35HRSs3oYUbQLXnNikMbYb97j4f7ycUS6n+UjX0rZ1rhmOgIOaH65fDyniquaQpTwRe4cMWyGPzC4aBTbJlrB6Qp77c2HMAcSchOMNP+GTJv7dQPJS9hZbY7/x29x2al4idKKyCLnmBZT94M8MIsfWDTeFIstcodgwRQ1c4esFzBqkqAsabP/LjktNb9orc5uSmz3NlpvPwAIRHsDKH+ZSSTv/0/UtTJ7jxHMpInrOVlm3Slb9P+gE+YnHZfq2N9dC1K1T5wf8UZpmwz9qxB6oWDsfWwzQs7A1gstQ+/Wxt/HBS4PCUNGp7Gcr0ec5lm7hiplv/UNXTUg07"
}