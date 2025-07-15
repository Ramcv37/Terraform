terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.100.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "1a10e7b8-0b3c-4e44-b44c-a052381171df"
}

