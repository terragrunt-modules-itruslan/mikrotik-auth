resource "random_password" "password" {
  for_each = { for user in var.users : user.name => user }

  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "routeros_system_user_group" "group" {
  for_each = { for group in var.groups : group.name => group }

  name    = each.value.name
  policy  = each.value.policy
  comment = "Managed by Terraform"
}

resource "routeros_system_user" "user" {
  for_each = { for user in var.users : user.name => user }

  name     = each.value.name
  group    = each.value.group
  password = random_password.password[each.key].result
  comment  = "Managed by Terraform"
}

resource "vault_kv_secret_v2" "secret" {
  for_each = { for user in var.users : user.name => user if var.vault_enabled }

  mount               = var.vault_mount_path
  name                = "${var.vault_secrets_path}/${each.value.name}"
  delete_all_versions = true
  data_json = jsonencode(
    {
      hosturl  = var.mikrotik_hosturl
      username = routeros_system_user.user[each.key].name
      password = routeros_system_user.user[each.key].password
    }
  )
}
