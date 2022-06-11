#Define a VM
 resource   "azurerm_windows_virtual_machine"   "examplevm"   { 
   name                    =   "MehalaVMNew"   
   location                =   var.location
   resource_group_name     =   var.resource_group_name
   network_interface_ids   =  [var.network_interface_ids]
                             # [ azurerm_network_interface.myvm1nic.id ] 
   size                    =   "Standard_D2ads_v5" 
   admin_username          =   "adminuser" 
   admin_password          =   "Password123!" 

os_disk{
  caching = "ReadWrite"
  storage_account_type = "Standard_LRS"
}

   source_image_reference   { 
     publisher   =   "MicrosoftWindowsServer" 
     offer       =   "WindowsServer" 
     sku         =   "2019-Datacenter" 
     version     =   "latest" 
   } 

    
 } 

 #Create a  data disk
 resource "azurerm_managed_disk" "data_disk" {
  name                 = "data_disk"
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = "16"
 }

 #Attach the created data dick with the above virtual machine-MehalaVM
 resource "azurerm_virtual_machine_data_disk_attachment" "data_disk_attach" {
  managed_disk_id    = azurerm_managed_disk.data_disk.id
  virtual_machine_id = azurerm_windows_virtual_machine.examplevm.id
  lun                = "10"
  caching            = "ReadWrite"
}