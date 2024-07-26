include "root" {
  path   = find_in_parent_folders()
  expose = true
}

terraform {
  source = "git::ssh://git@gitlab.com/group-itruslan/iac/terragrunt/modules/ros-auth.git//?ref=X.Y.Z"
}

inputs = {
  vault_enabled = false
}
