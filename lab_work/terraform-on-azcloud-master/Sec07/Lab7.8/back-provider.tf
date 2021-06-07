terraform {
  #backend "azurerm" {}
  #terraform v0.14
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.18"
    }
  }
  backend "azurerm" {
    resource_group_name  = "Terra-rg"
    storage_account_name = "venuremotesa01fs"
    container_name       = "tfstate"
    key                  = "MI_VM_TF_Deploy.tfstate"
  }
}

provider "azurerm" {
  #version = "= 2.18"
  features {}
  subscription_id = var.vsubscription_id
  tenant_id       = var.vtenant_id
  use_msi         = true
}
