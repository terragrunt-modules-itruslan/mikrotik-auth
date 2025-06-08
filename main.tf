terraform {
  required_providers {
    routeros = {
      source  = "terraform-routeros/routeros"
      version = "~> 1.85"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.7"
    }
    vault = {
      source  = "vault"
      version = "~> 5.0"
    }
  }
}

provider "routeros" {
  hosturl  = length(var.mikrotik_hosturl) > 0 ? var.mikrotik_hosturl : null
  username = length(var.mikrotik_username) > 0 ? var.mikrotik_username : null
}

provider "vault" {
  address = length(var.vault_address) > 0 ? var.vault_address : null
}
