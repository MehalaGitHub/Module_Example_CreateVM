output "rg_output" {
    value = azurerm_network_interface.myvm1nic.resource_group_name
}
output "network_interface_name" {
    value = azurerm_network_interface.myvm1nic.name
}
output "network_interface_ids" {
    value = azurerm_network_interface.myvm1nic.id
    
}
#output "subnet_id" {
 #   value = azurerm_network_interface.myvm1nic.ip_configuration
#}