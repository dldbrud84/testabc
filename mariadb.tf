resource "azurerm_virtual_machine" "user19-mariadb" {
    name                  = "group03-user19-mariadb"
    location              = "korea Central"
    resource_group_name   = "${azurerm_resource_group.group03-user19.name}"
    network_interface_ids = ["${azurerm_network_interface.user19-nic2.id}"]
    vm_size               = "Standard_D2s_v3"

    storage_os_disk {
        name              = "group03-user19-mariadbdisk"
        caching           = "ReadWrite"
        create_option     = "FromImage"
        managed_disk_type = "Premium_LRS"
    }

    storage_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "16.04.0-LTS"
        version   = "latest"
    }

    os_profile {
        computer_name="user19db"
        admin_username="azureuser"
        admin_password="SKCNC123!@#"
    }

    os_profile_linux_config {
        disable_password_authentication = false
        ssh_keys {
           path = "/home/azureuser/.ssh/authorized_keys"
           key_data="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDi6eloxrDDntud7XB+DYCLhVZyyefMzKoXKhNoGfjmtgoczECDaqx0ubqI3VIn1F8e0CHxZxZBbrsXfTVjhjhYmRmbiaJBK1pkM2s8UawoOVy0HzVH/zWzOU0609R9xv/zzFl44HUSZXwIfOPBblsDo0rxZMkWuzV5PbEgFTtw26vLwDPr8dvlS/MAkhiH0bEwBUupMEw30gcEWTFxI5In+gZ7HLOdQFgaBnuYMByl3cjxsT+hLBVXR5cSxcdsZKz7NwHTqi+ySv2MaTgy447WW9jFF4s9vsHLtO+3ubwtO2n8LVX13b7tXAwICwsBFN3+e07Gq/ErLMZDN44ZjE3L azureuser@user19vm"
       }
    }
   boot_diagnostics {
       enabled = "true"
       storage_uri = "${azurerm_storage_account.user19-storageaccount.primary_blob_endpoint}"
   }
}   
