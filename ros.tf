locals {
  ros_host_api = "api://${var.ros_host}"
}
resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "routeros_system_user" "tf_user" {
  depends_on = [random_password.password]

  name     = var.ros_tf_username
  address  = var.ros_allow_subnet
  group    = "api"
  password = random_password.password.result
  comment  = "Managed by Terraform"
}

resource "vault_kv_secret_v2" "ros" {
  count = var.vault_enabled ? 1 : 0

  mount               = var.vault_mount_path
  name                = var.vault_secret_name
  delete_all_versions = true
  data_json = jsonencode(
    {
      ros_host     = var.ros_host
      ros_host_api = local.ros_host_api
      ros_username = routeros_system_user.tf_user.name
      ros_password = routeros_system_user.tf_user.password
    }
  )
}
