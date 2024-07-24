locals {
  mikrotik_host_api = "api://${var.mikrotik_host}"
}
resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "routeros_system_user" "tf_user" {
  depends_on = [random_password.password]

  name     = var.mikrotik_tf_username
  address  = var.mikrotik_allow_subnet
  group    = "api"
  password = random_password.password.result
  comment  = "Managed by Terraform"
}

resource "vault_kv_secret_v2" "mikrotik" {
  count = var.vault_enabled ? 1 : 0

  mount               = var.vault_mount_path
  name                = var.vault_secret_name
  delete_all_versions = true
  data_json = jsonencode(
    {
      mikrotik_host     = var.mikrotik_host
      mikrotik_host_api = local.mikrotik_host_api
      mikrotik_username = routeros_system_user.tf_user.name
      mikrotik_password = routeros_system_user.tf_user.password
    }
  )
}
