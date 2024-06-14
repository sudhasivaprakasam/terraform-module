#how to create a resource group. 
resource "azurerm_resource_group" "myrg" { #this is the refrence it will be managed by terraform to store your logs
  name = "${local.resource_name_prefix}-${var.resource_group_name}"
  #sap-dev-rg-default
  location = var.resource_group_location
  tags     = local.common_tags
}
resource "azurerm_virtual_network" "vnet" {
  name = "${local.resource_name_prefix}-${var.vnet_name}"
  #this vnet need to be part of your resource group and resource group location
  location            = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name
  address_space       = var.vnet_address_space
}
