
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
  name                = "venukeyvault01"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tenant_id           = data.azurerm_client_config.current.tenant_id # we can aslo use tenent id instead of service principle (az account show)
  sku_name            = "standard"
}

# Create Storage initially

resource "azurerm_storage_account" "rg" {
  name                     = "venuremotesa01"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# Also Create a container called tfstate so that your backend state can be stored will discuss about backend state later
# If the storage resource is already created we can import the resource

/*resource "azurerm_storage_account" "venuremotesa01" {
  name                     = "venuremotesa01"
  resource_group_name      = "Terra-rg"
  location                 = "East US"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}*/