output "aks_cluster_id" {
  description = "AKS cluster resource ID"
  value       = module.aks.aks_cluster_id
}

output "storage_account_id" {
  description = "Storage account resource ID"
  value       = module.storage.storage_account_id
}

output "aci_fqdn" {
  description = "Fully qualified domain name for Azure Container Instance"
  value       = module.acr.aci_fqdn
}
