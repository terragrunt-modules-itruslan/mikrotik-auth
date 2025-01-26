output "mikrotik_hosturl" {
  description = "The Proxmox VE endpoint URL"
  value       = length(var.mikrotik_hosturl) > 0 ? var.mikrotik_hosturl : null
}

output "mikrotik_users" {
  description = "Credentials for Mikrotik users"
  value = { for user, resource in routeros_system_user.user :
    user => {
      user     = resource.name
      password = resource.password
    }
  }
  sensitive = true
}

output "vault_secrets" {
  description = "Full URLs to user secrets in Vault"
  value = var.vault_enabled ? {
    for user, secret in vault_kv_secret_v2.secret : user => "${var.vault_address}/ui/vault/secrets/${var.vault_mount_path}/show/${secret.name}"
  } : null
}
