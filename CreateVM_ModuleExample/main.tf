# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

module "Demo_Azure_Module_RG" {
    source = "./Modules/Resource_Group"
    resource_group_name = "demo_RG_new"
    location = "West Europe"
    
   

}

module "Demo_Azure_Module_VNet"{
  resource_group_name=module.Demo_Azure_Module_RG.rg_output
  location = module.Demo_Azure_Module_RG.Location_output
          source = "./Modules/Virtual_Network"
       depends_on = [
         module.Demo_Azure_Module_RG
       ]

}

module "Demo_Azure_Module_Subnet"{
  resource_group_name=module.Demo_Azure_Module_RG.rg_output
  virtual_network_name = module.Demo_Azure_Module_VNet.vnet_name_output
  location = module.Demo_Azure_Module_RG.Location_output
          source = "./Modules/Subnet"

          depends_on = [
            module.Demo_Azure_Module_VNet
          ]
   
}



module "Demo_Azure_Module_PublicIp"{
  resource_group_name=module.Demo_Azure_Module_RG.rg_output
     source = "./Modules/Public_Ip"

         depends_on = [
           module.Demo_Azure_Module_Subnet
         ]
   
}



module "Demo_Azure_Module_NetworkInterface"{
  resource_group_name=module.Demo_Azure_Module_RG.rg_output
  subnet_id=module.Demo_Azure_Module_Subnet.subnet_id
  public_ip_address_id=module.Demo_Azure_Module_PublicIp.public_ip_address_id
          source = "./Modules/Network_Interface"

         depends_on = [
           module.Demo_Azure_Module_PublicIp
         ]
   
}

module "Demo_Azure_Module_CreateVM"{
  resource_group_name=module.Demo_Azure_Module_RG.rg_output
   network_interface_ids=module.Demo_Azure_Module_NetworkInterface.network_interface_ids
          source = "./Modules/Create_VM"

         depends_on = [
           module.Demo_Azure_Module_NetworkInterface
         ]
   
}
