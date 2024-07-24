output "vault_secret" {
  description = "Mikrotik secret in Vault"
  value       = var.vault_enabled ? "${var.vault_address}ui/vault/secrets/${var.vault_mount_path}/show/${var.vault_secret_name}" : null
}

output "mikrotik_url" {
  description = "Mikrotik url"
  value       = var.mikrotik_host
}

output "mikrotik_url_api" {
  description = "Mikrotik url api"
  value       = local.mikrotik_host_api
}

output "mikrotik_tf_username" {
  description = "Terraform user name"
  value       = routeros_system_user.tf_user.name
}

output "mikrotik_tf_password" {
  description = "Terraform user password"
  sensitive   = true
  value       = routeros_system_user.tf_user.password
}
