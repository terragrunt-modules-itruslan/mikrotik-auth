# mikrotik-auth

Module for creating group and users in Mikrotik (RouterOS)

Example usage of the module  - [terragrunt.example.hcl](./terragrunt.example.hcl)

To run the module, you need to set the environment variables:

```bash
export MIKROTIK_HOST="api://192.168.88.1" # or specify the `mikrotik_hosturl` inputs variable
export MIKROTIK_USER="admin"
export MIKROTIK_PASSWORD="YOUR_PASSWORD"
export VAULT_ADDR="https://vault.example.local" # or specify the `vault_address` inputs variable
export VAULT_TOKEN="YOUR_TOKEN"
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3.7 |
| <a name="requirement_routeros"></a> [routeros](#requirement\_routeros) | ~> 1.85 |
| <a name="requirement_vault"></a> [vault](#requirement\_vault) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_random"></a> [random](#provider\_random) | 3.7.2 |
| <a name="provider_routeros"></a> [routeros](#provider\_routeros) | 1.85.1 |
| <a name="provider_vault"></a> [vault](#provider\_vault) | 5.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [random_password.password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [routeros_system_user.user](https://registry.terraform.io/providers/terraform-routeros/routeros/latest/docs/resources/system_user) | resource |
| [routeros_system_user_group.group](https://registry.terraform.io/providers/terraform-routeros/routeros/latest/docs/resources/system_user_group) | resource |
| [vault_kv_secret_v2.secret](https://registry.terraform.io/providers/vault/latest/docs/resources/kv_secret_v2) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_groups"></a> [groups](#input\_groups) | List of groups with privileges. Built-in groups are not allowed. | <pre>list(object({<br>    name   = string<br>    policy = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_mikrotik_hosturl"></a> [mikrotik\_hosturl](#input\_mikrotik\_hosturl) | Mikrotik endpoint | `string` | `""` | no |
| <a name="input_mikrotik_username"></a> [mikrotik\_username](#input\_mikrotik\_username) | Mikrotik username | `string` | `""` | no |
| <a name="input_users"></a> [users](#input\_users) | List of users with group | <pre>list(object({<br>    name  = string<br>    group = string<br>  }))</pre> | n/a | yes |
| <a name="input_vault_address"></a> [vault\_address](#input\_vault\_address) | Vault address | `string` | `""` | no |
| <a name="input_vault_enabled"></a> [vault\_enabled](#input\_vault\_enabled) | Save secret to vault | `bool` | `false` | no |
| <a name="input_vault_mount_path"></a> [vault\_mount\_path](#input\_vault\_mount\_path) | Path where KV-V2 engine is mounted | `string` | `"secret"` | no |
| <a name="input_vault_secrets_path"></a> [vault\_secrets\_path](#input\_vault\_secrets\_path) | Base path for storing user secrets in Vault | `string` | `"mikrotik/users"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_mikrotik_hosturl"></a> [mikrotik\_hosturl](#output\_mikrotik\_hosturl) | The Proxmox VE endpoint URL |
| <a name="output_mikrotik_users"></a> [mikrotik\_users](#output\_mikrotik\_users) | Credentials for Mikrotik users |
| <a name="output_vault_secrets"></a> [vault\_secrets](#output\_vault\_secrets) | Full URLs to user secrets in Vault |
<!-- END_TF_DOCS -->
