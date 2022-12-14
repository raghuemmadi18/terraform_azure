
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
  tenant_id           = data.azurerm_client_config.current.tenant_id # we can aslo use tenent id instead of service principle (az account show)
  #tenant_id           =  6b9cdc1c-0ed8-4812-8154-bb975b91d702 # we can aslo use tenent id instead of service principle (az account show)
  #tenant_id           =  ea5bc0a6-fc86-41ae-b3ad-0f4e5a37658b # Ravi Free Tire
  sku_name = "standard"
}

# Create Storage initially

resource "azurerm_storage_account" "rg" {
  name                     = "venuremotesa01fs"
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
