output "publicip_output" {
    value = azurerm_public_ip.MyVMPublicIP.name
}

output "public_ip_address_id" {
    value=azurerm_public_ip.MyVMPublicIP.id
  
}