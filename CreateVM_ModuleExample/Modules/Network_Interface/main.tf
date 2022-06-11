#Define a network interface for our VM
resource   "azurerm_network_interface"   "myvm1nic"   { 
   name   =   "myvm1-nic" 
   location   =  var.location
   resource_group_name   =   var.resource_group_name

   ip_configuration   { 
     name   =   "ipconfig1" 
     subnet_id   =   var.subnet_id                            #azurerm_subnet.example.id
     private_ip_address_allocation   =   "Dynamic" 
     public_ip_address_id   =  var.public_ip_address_id       # azurerm_public_ip.MyVMPublicIP.id 
   } 
 } 