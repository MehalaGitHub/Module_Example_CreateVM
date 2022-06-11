# Create a subnet for a vnet within a resource group
resource "azurerm_subnet" "example"{
     name="example_subnet"
    resource_group_name=var.resource_group_name
    virtual_network_name=var.virtual_network_name
    address_prefixes     = ["10.0.1.0/24"]
    
    }