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
      version = "~> 4.2"
    }
  }
}

provider "routeros" {
  hosturl  = local.mikrotik_host_api
  username = var.mikrotik_username
  password = var.mikrotik_password
  insecure = true
}

provider "vault" {
  address = var.vault_address
}
