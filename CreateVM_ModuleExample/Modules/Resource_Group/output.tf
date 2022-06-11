output "rg_output" {
    value = azurerm_resource_group.example_rg.name 
}
output "Location_output" {
    value = azurerm_resource_group.example_rg.location 
}