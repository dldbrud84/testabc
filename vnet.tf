resource "azurerm_virtual_network" "group03-user19-vnetwork" {
  name = "group03-user19-vnet"
  address_space = ["3.4.0.0/16"]
  location = "Korea Central"
  resource_group_name = "${azurerm_resource_group.group03-user19.name}"
}
