# Create a virtual network in Virtual Network module
resource "azurerm_virtual_network" "example1" {
  name                = "sample-vnet"
  resource_group_name = var.resource_group_name  
  location            =var.location   
  address_space       = ["10.0.0.0/16"]
}
