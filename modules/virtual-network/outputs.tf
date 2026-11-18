output "virtual_network_name" {
  description = "Name of the Virtual Network"
  value       = azurerm_virtual_network.this.name
}

output "virtual_network_id" {
  description = "ID of the Virtual Network"
  value       = azurerm_virtual_network.this.id
}

output "subnet_ids" {
  description = "IDs of the created subnets"
  value = {
    for name, subnet in azurerm_subnet.this :
    name => subnet.id
  }
}
