
terraform {
  required_version = ">= 0.14.0"
}

provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm" {
    #add entries for the storage account where the state file is
  }
}