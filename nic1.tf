resource "azurerm_network_interface" "user19-nic1" {
    name                = "group03-user19-nic1"
    location            = "korea central"
    resource_group_name = "${azurerm_resource_group.group03-user19.name}"
    network_security_group_id = "${azurerm_network_security_group.user19-sg.id}"

    ip_configuration {
        name                          = "group03-user19-ip1"
        subnet_id                     = "${azurerm_subnet.user19-subnet1.id}"
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id          = "${azurerm_public_ip.user19-publicip.id}"
    }
}
