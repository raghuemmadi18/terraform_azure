terraform {
  required_providers {
    azurerm = {
      source                = "hashicorp/azurerm"
      version               = "2.41.0"
      configuration_aliases = [azurerm.alt]
    }
  }
  backend "azurerm" {
    resource_group_name  = "Terra-rg"
    storage_account_name = "venuremotesa01fs"
    container_name       = "tfstate"
    key                  = "multi_tenet.tfstate"
  }
}
provider "azurerm" {
  features {}
  subscription_id = "6b9cdc1c-0ed8-4812-8154-bb975b91d702"
  tenant_id       = "ea5bc0a6-fc86-41ae-b3ad-0f4e5a37658b"
}

provider "azurerm" {
  alias = "alt"
  features {}
  subscription_id = "53126cf4-dd12-46e1-899e-92f0f1edc5c4"
  tenant_id       = "c848aaf0-e3e2-40f0-bd40-e20b8921000d"
}

resource "azurerm_resource_group" "example1" {
  name     = "provider1"
  location = "East US"
}

resource "azurerm_resource_group" "example2" {
  provider = azurerm.alt
  name     = "provider2"
  location = "East US"
}

resource "azurerm_storage_account" "example2" {
  provider                 = azurerm.alt
  name                     = "testsao1234"
  resource_group_name      = azurerm_resource_group.example2.name
  location                 = azurerm_resource_group.example2.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

output "pkey" {
  value = azurerm_storage_account.example2.primary_access_key
  sensitive =true
}
