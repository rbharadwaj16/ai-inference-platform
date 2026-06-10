output "resource_group_name" {
  description = "Name of the dev inference platform resource group."
  value       = module.resource_group.resource_group_name
}

output "resource_group_id" {
  description = "Resource ID of the dev inference platform resource group."
  value       = module.resource_group.resource_group_id
}

output "resource_group_location" {
  description = "Azure region of the dev inference platform resource group."
  value       = module.resource_group.resource_group_location
}

output "virtual_network_name" {
  description = "Name of the dev AKS virtual network."
  value       = module.network.virtual_network_name
}

output "aks_system_subnet_id" {
  description = "Subnet ID used by the AKS default node pool."
  value       = module.network.subnet_ids["aks_system"]
}

output "aks_cluster_name" {
  description = "Name of the dev AKS cluster."
  value       = module.aks.cluster_name
}

output "aks_cluster_id" {
  description = "ID of the dev AKS cluster."
  value       = module.aks.cluster_id
}

output "aks_oidc_issuer_url" {
  description = "OIDC issuer URL for AKS workload identity."
  value       = module.aks.oidc_issuer_url
}
