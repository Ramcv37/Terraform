#provider "azurerm" {
#  features {}
#}

# Create the resource group
resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

# AKS module
module "aks" {
  source              = "./modules/aks"
  resource_group_name = azurerm_resource_group.main.name
  location            = var.location
  cluster_name        = var.aks_name
}

# ACR (ACI) module
module "acr" {
  source              = "./modules/acr"
  resource_group_name = azurerm_resource_group.main.name
  location            = var.location
  acr_name            = var.acr_name
}

# Storage module
module "storage" {
  source               = "./modules/storage_account"
  resource_group_name  = azurerm_resource_group.main.name
  location             = var.location
  storage_account_name = var.storage_account_name
}

