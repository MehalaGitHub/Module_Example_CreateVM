#Define a new public IP address
resource   "azurerm_public_ip"   "MyVMPublicIP"   { 
   name   =   "PublicIpname" 
   location   =  var.location
   resource_group_name   =   var.resource_group_name
   allocation_method   =   "Dynamic" 
   sku   =   "Basic" 
 } 