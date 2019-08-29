resource "azurerm_public_ip" "user19-publicip" {
    name                         = "group03-user19-PIP"
    location                     = "korea central"
    resource_group_name          = "${azurerm_resource_group.group03-user19.name}"
    allocation_method            = "Dynamic"
}
