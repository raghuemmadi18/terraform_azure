# Azure Provider source and version being used

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.61.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# Creating RG

resource "azurerm_resource_group" "rg" {
  name     = "Terra-rg"
  location = "East US"
}

# Using Service Principle to create Resources

data "azurerm_client_config" "current" {
}

# Create a Key vault

resource "azurerm_key_vault" "rg" {
  name                = "venukeyvaultfs"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  #tenant_id           = ea5bc0a6-fc86-41ae-b3ad-0f4e5a37658b Ravi Free Tire
  sku_name = "standard"
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id # Ravi Free Tire
    object_id = data.azurerm_client_config.current.object_id
    key_permissions = [
      "Get",
      "List",
      "Update",
      "Create",
      "Import",
      "Delete",
      "Recover",
      "Backup",
      "Restore",
      "WrapKey",
      "UnwrapKey",
      "Decrypt",
      "Encrypt"
    ]
    secret_permissions = [
      "Get",
      "List",
      "Set",
      "Delete",
      "Recover",
      "Backup",
      "Restore"
    ]
  }
}

# Create Storage initially

resource "azurerm_storage_account" "rg" {
  name                     = "venuremotesa01fs"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}