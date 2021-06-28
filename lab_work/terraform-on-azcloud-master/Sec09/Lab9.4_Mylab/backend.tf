terraform {
  backend azurerm {
      resource_group_name  = "Terra-rg"
      storage_account_name = "venuremotesa01fs"
      container_name       = "tfstate"
      key                  = "Lab9.4.tfstate"
  }
}