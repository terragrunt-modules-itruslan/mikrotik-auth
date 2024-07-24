variable "vault_address" {
  description = "Vault address"
  type        = string
}
variable "vault_enabled" {
  description = "Save secret to vault"
  type        = bool
  default     = true
}

variable "vault_mount_path" {
  description = "Path where KV-V2 engine is mounted"
  default     = "secret"
  type        = string
}

variable "vault_secret_name" {
  description = "Full name of the secret"
  default     = "homelab/ros/auth"
  type        = string
}

variable "ros_host" {
  description = "RouterOS host for provider"
  default     = "192.168.99.1:8728"
  type        = string
}

variable "ros_username" {
  description = "RouterOS username for provider"
  default     = "admin"
  type        = string
}

variable "ros_password" {
  description = "RouterOS password for provider"
  type        = string
  sensitive   = true
}

variable "ros_tf_username" {
  description = "RouterOS username created for terraform use"
  default     = "terraform"
  type        = string
}

variable "ros_allow_subnet" {
  description = "Allow user from subnet"
  default     = "192.168.99.0/24"
  type        = string
}
