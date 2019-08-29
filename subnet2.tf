resource "azurerm_subnet" "user19-subnet2" {
  name = "group03-user19-subnet2"
  resource_group_name = "${azurerm_resource_group.group03-user19.name}"
  virtual_network_name = "${azurerm_virtual_network.group03-user19-vnetwork.name}"
  address_prefix = "3.4.2.0/24"
}
