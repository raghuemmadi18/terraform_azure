/*
terraform {
  backend "azurerm" {}
}
*/

terraform {
  backend "azurerm" {
    resource_group_name  = "Terra-rg"
    storage_account_name = "remotestrgvenu"
    container_name       = "tfstate"
    key                  = "backend-test.tfstate"
  }
}