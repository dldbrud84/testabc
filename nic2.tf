resource "azurerm_network_interface" "user19-nic2" {
    name                = "group03-user19-nic2"
    location            = "korea central"
    resource_group_name = "${azurerm_resource_group.group03-user19.name}"
    network_security_group_id = "${azurerm_network_security_group.user19-dbsg.id}"

    ip_configuration {
        name                          = "group03-user19-ip2"
        subnet_id                     = "${azurerm_subnet.user19-subnet2.id}"
        private_ip_address_allocation = "Dynamic"
    }
}
