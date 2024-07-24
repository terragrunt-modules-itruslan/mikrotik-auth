# ros-auth

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3.6 |
| <a name="requirement_routeros"></a> [routeros](#requirement\_routeros) | ~> 1.54 |
| <a name="requirement_vault"></a> [vault](#requirement\_vault) | ~> 4.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_random"></a> [random](#provider\_random) | 3.6.2 |
| <a name="provider_routeros"></a> [routeros](#provider\_routeros) | 1.57.0 |
| <a name="provider_vault"></a> [vault](#provider\_vault) | 4.3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [random_password.password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [routeros_system_user.tf_user](https://registry.terraform.io/providers/terraform-routeros/routeros/latest/docs/resources/system_user) | resource |
| [vault_kv_secret_v2.ros](https://registry.terraform.io/providers/vault/latest/docs/resources/kv_secret_v2) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ros_allow_subnet"></a> [ros\_allow\_subnet](#input\_ros\_allow\_subnet) | Allow user from subnet | `string` | `"192.168.99.0/24"` | no |
| <a name="input_ros_host"></a> [ros\_host](#input\_ros\_host) | RouterOS host for provider | `string` | `"192.168.99.1:8728"` | no |
| <a name="input_ros_password"></a> [ros\_password](#input\_ros\_password) | RouterOS password for provider | `string` | n/a | yes |
| <a name="input_ros_tf_username"></a> [ros\_tf\_username](#input\_ros\_tf\_username) | RouterOS username created for terraform use | `string` | `"terraform"` | no |
| <a name="input_ros_username"></a> [ros\_username](#input\_ros\_username) | RouterOS username for provider | `string` | `"admin"` | no |
| <a name="input_vault_address"></a> [vault\_address](#input\_vault\_address) | Vault address | `string` | n/a | yes |
| <a name="input_vault_enabled"></a> [vault\_enabled](#input\_vault\_enabled) | Save secret to vault | `bool` | `true` | no |
| <a name="input_vault_mount_path"></a> [vault\_mount\_path](#input\_vault\_mount\_path) | Path where KV-V2 engine is mounted | `string` | `"secret"` | no |
| <a name="input_vault_secret_name"></a> [vault\_secret\_name](#input\_vault\_secret\_name) | Full name of the secret | `string` | `"homelab/ros/auth"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ros_tf_password"></a> [ros\_tf\_password](#output\_ros\_tf\_password) | Terraform user password |
| <a name="output_ros_tf_username"></a> [ros\_tf\_username](#output\_ros\_tf\_username) | Terraform user name |
| <a name="output_ros_url"></a> [ros\_url](#output\_ros\_url) | Mikrotik url |
| <a name="output_ros_url_api"></a> [ros\_url\_api](#output\_ros\_url\_api) | Mikrotik url api |
| <a name="output_vault_secret"></a> [vault\_secret](#output\_vault\_secret) | Mikrotik secret in Vault |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
