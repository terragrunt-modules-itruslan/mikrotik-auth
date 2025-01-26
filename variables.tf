variable "mikrotik_hosturl" {
  description = "Mikrotik endpoint"
  default     = ""
  type        = string
}

variable "vault_address" {
  description = "Vault address"
  default     = ""
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

variable "vault_secrets_path" {
  description = "Base path for storing user secrets in Vault"
  default     = "mikrotik/users"
  type        = string
}

variable "groups" {
  description = "List of groups with privileges. Built-in groups are not allowed."
  default     = []
  type = list(object({
    name   = string
    policy = list(string)
  }))

  validation {
    condition = alltrue([
      for group in var.groups : !contains([
        "full", "read", "write"
      ], group.name)
    ])
    error_message = "The following groups are built-in and cannot be used: full, read, write."
  }
}

variable "users" {
  description = "List of users with group"
  type = list(object({
    name  = string
    group = string
  }))
}
