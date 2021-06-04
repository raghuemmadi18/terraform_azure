terraform {
  #backend "azurerm" {}
  #terraform v0.14
  required_providers {
    az = {
      source  = "hashicorp/azurerm"
      version = "~> 2.18"
    }
  }
  backend "azurerm" {
    resource_group_name  = "Terra-rg"
    storage_account_name = "venuremotesa01"
    container_name       = "tfstate"
    key                  = "backend-tf_v14.tfstate"
  }
}
