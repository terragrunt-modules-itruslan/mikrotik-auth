output "vault_secret" {
  description = "Mikrotik secret in Vault"
  value       = var.vault_enabled ? "${var.vault_address}ui/vault/secrets/${var.vault_mount_path}/show/${var.vault_secret_name}" : null
}

output "ros_url" {
  description = "Mikrotik url"
  value       = var.ros_host
}

output "ros_url_api" {
  description = "Mikrotik url api"
  value       = local.ros_host_api
}

output "ros_tf_username" {
  description = "Terraform user name"
  value       = routeros_system_user.tf_user.name
}

output "ros_tf_password" {
  description = "Terraform user password"
  sensitive   = true
  value       = routeros_system_user.tf_user.password
}
