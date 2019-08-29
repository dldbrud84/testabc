resource "azurerm_storage_account" "user19-storageaccount" {
    name                = "diag${random_id.randomId.hex}"
    resource_group_name = "${azurerm_resource_group.group03-user19.name}"
    location            = "korea Central"
    account_replication_type = "LRS"
    account_tier = "Standard"
}
