include "root" {
  path   = find_in_parent_folders()
  expose = true
}

terraform {
  source = "git::ssh://git@gitlab.com/group-itruslan/terraform/terragrunt/modules/grs-proxmox-auth.git//?ref=X.Y.Z"
}
