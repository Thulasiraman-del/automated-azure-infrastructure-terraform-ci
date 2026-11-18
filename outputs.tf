output "resource_group_name" {
  description = "Name of the Resource Group"
  value       = module.resource_group.resource_group_name
}

output "resource_group_location" {
  description = "Location of the Resource Group"
  value       = module.resource_group.resource_group_location
}

output "virtual_network_name" {
  description = "Name of the Virtual Network"
  value       = module.virtual_network.virtual_network_name
}

output "virtual_network_id" {
  description = "ID of the Virtual Network"
  value       = module.virtual_network.virtual_network_id
}

output "subnet_ids" {
  description = "IDs of the created subnets"
  value       = module.virtual_network.subnet_ids
}
output "storage_account_name" {
  description = "Name of the Storage Account"
  value       = module.storage_account.storage_account_name
}

output "storage_account_id" {
  description = "ID of the Storage Account"
  value       = module.storage_account.storage_account_id
}

output "primary_blob_endpoint" {
  description = "Primary Blob Storage endpoint"
  value       = module.storage_account.primary_blob_endpoint
}
