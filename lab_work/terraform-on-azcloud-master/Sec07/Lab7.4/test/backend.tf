/*
terraform {
  backend "azurerm" {}
}
*/

terraform {
  backend "azurerm" {
    resource_group_name  = "Terra-rg"
    storage_account_name = "venuremotesa01"
    container_name       = "tfstate"
    key                  = "test-dir.tfstate"
  }
}