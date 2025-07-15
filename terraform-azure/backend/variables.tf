variable "resource_group_name" {
  description = "Resource group for Terraform backend"
  type        = string
}

variable "location" {
  description = "Azure region for the backend resources"
  type        = string
}

variable "storage_account_name" {
  description = "Globally unique storage account name"
  type        = string
}

variable "container_name" {
  description = "Name of the blob container to hold state"
  type        = string
}

