terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.92.0"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}


resource "azurerm_resource_group" "front_end_rg" {
  name     = "my_resource_group_2"
  location = "northeurope"
}

resource "azurerm_storage_account" "front_end_storage_account" {
  name                     = "stgsandfrontendnez780"
  location                 = azurerm_resource_group.front_end_rg.location
  resource_group_name      = azurerm_resource_group.front_end_rg.name

  account_replication_type = "LRS"
  account_tier             = "Standard"
  account_kind             = "StorageV2"

  static_website {
    index_document = "index.html"
  }
}