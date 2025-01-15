variable "vault_address" {
  description = "Vault address"
  default     = "https://vault.example.com/"
  type        = string

}
variable "vault_enabled" {
  description = "Save secret to vault"
  default     = false
  type        = bool
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
  default     = "192.168.88.1:8728"
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

variable "ros_tf_group" {
  description = "RouterOS group  created for terraform user"
  default     = "api"
  type        = string
}

variable "ros_tf_group_policy" {
  description = "RouterOS group policy created for terraform user"
  default     = ["api", "!ftp", "!local", "password", "policy", "read", "!reboot", "!rest-api", "!romon", "sensitive", "!sniff", "!ssh", "!telnet", "!test", "!web", "!winbox", "write"]
  type        = list(any)
}

variable "ros_tf_username" {
  description = "RouterOS username created for terraform"
  default     = "terraform"
  type        = string
}

variable "ros_allow_subnet" {
  description = "Allow user from subnet"
  default     = "192.168.88.0/24"
  type        = string
}
