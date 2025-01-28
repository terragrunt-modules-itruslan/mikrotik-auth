include "root" {
  path   = find_in_parent_folders()
  expose = true
}

terraform {
  source = "git::ssh://git@gitlab.com/group-itruslan/homelab/terragrunt/modules/mikrotik-auth.git//?ref=x.x.x"
}

inputs = {
  vault_enabled    = true
  vault_address    = "https://vault.example.local"
  mikrotik_hosturl = "api://192.168.88.1"
  groups = [
    {
      name = "api-users"
      policy = ["api"]
    },
  ]
  users = [
    {
      name  = "terraform"
      group = "write"
    },
    {
      name = "api-user"
      group = "api-users"
    },
  ]
}
