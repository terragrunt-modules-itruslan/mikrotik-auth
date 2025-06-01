terraform {
  required_providers {
    routeros = {
      source  = "terraform-routeros/routeros"
      version = "~> 1.54"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
    vault = {
      source  = "vault"
      version = "~> 5.0"
    }
  }
}

provider "routeros" {
  hosturl = length(var.mikrotik_hosturl) > 0 ? var.mikrotik_hosturl : null
}

provider "vault" {
  address = length(var.vault_address) > 0 ? var.vault_address : null
}
