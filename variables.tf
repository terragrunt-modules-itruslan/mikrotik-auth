variable "vault_address" {
  description = "Vault address"
  default     = "https://vault.itruslan.ru/"
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
  default     = "homelab/mikrotik/auth"
  type        = string
}

variable "mikrotik_host" {
  description = "Mikrotik host for provider"
  default     = "gw.itruslan.ru:8728"
  type        = string
}

variable "mikrotik_username" {
  description = "Mikrotik username for provider"
  default     = "admin"
  type        = string
}

variable "mikrotik_password" {
  description = "Mikrotik password for provider"
  type        = string
  sensitive   = true
}

variable "mikrotik_tf_username" {
  description = "Mikrotik username created for terraform use"
  default     = "terraform"
  type        = string
}

variable "mikrotik_allow_subnet" {
  description = "Allow user from subnet"
  default     = "192.168.99.0/24"
  type        = string
}
