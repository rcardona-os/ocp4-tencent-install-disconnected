# Pass the necessary variables
variable "target_host" {
  description = "IP of taget host"
  type        = string
  default     = "10.0.0.20/32" # Default IP
}

variable "target_user" {
  description = "User to access"
  type        = string
  default     = "rhuser" # Default user to access target host
}

variable "private_key" {
  description = "User key to access"
  type        = string
  default     = "~/.ssh/id_rsa" # user private key within the current host
}