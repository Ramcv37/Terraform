terraform {
  required_version = ">= 1.6.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.100.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "tfstatestorage537"
    container_name       = "tfstate"
    key                  = "aks-acs-storage/terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "1a10e7b8-0b3c-4e44-b44c-a052381171df"
}

