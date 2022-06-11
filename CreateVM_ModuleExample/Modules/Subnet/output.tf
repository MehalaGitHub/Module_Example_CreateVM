output "rg_output" {
    value = azurerm_subnet.example.resource_group_name
}
output "virtual_network_name" {
    value = azurerm_subnet.example.virtual_network_name
}
output "subnet_name" {
    value = azurerm_subnet.example.name
}
output "subnet_id" {
    value = azurerm_subnet.example.id
}
