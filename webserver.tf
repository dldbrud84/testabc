resource "azurerm_virtual_machine" "user19-vm" {
    name                  = "group03-user19-VM"
    location              = "korea Central"
    resource_group_name   = "${azurerm_resource_group.group03-user19.name}"
    network_interface_ids = ["${azurerm_network_interface.user19-nic1.id}"]
    vm_size               = "Standard_DS1_v2"

    storage_os_disk {
        name              = "group03-user19-Disk"
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
        computer_name="user19vm"
        admin_username="azureuser"
        admin_password="SKCNC123!@#"
    }

    os_profile_linux_config {
        disable_password_authentication = true
        ssh_keys {
           path = "/home/azureuser/.ssh/authorized_keys"
           key_data="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC32leEQl2ZxVQnC9r4TeHKDvA3ayS+ViyMLAUqSAH+W8NHbZnjtvo1ieEtGgvhXQMV0jWdXbcvq18UzAifIaDeVNdH//8OD2Au/EWCmfmX+ESe1ZuuUWVTZAa6VUMvWp19YjRDpzQUDFfvJZzaPtkfnlhG1V5pGHOa/oODmBaIwqUlJR7U4ivYAmAoLvymbThMiUWIG2+zehIUCJujYhad5Ag9+wjtGYx/1n7dO+ph/Z+4ejYgJARBZYU4icipp5mX7345bMTvOu6gTkzPhn0PHeH9ImnKb+FM5fhjh+pESaZWxm7HjO7ddeETtT9wWZMdtTHUvfZqoG5SLKE2NpGZ user19@cc-fced2d2a-766957cd4b-cng8h"
       }
    }
   boot_diagnostics {
       enabled = "true"
       storage_uri = "${azurerm_storage_account.user19-storageaccount.primary_blob_endpoint}"
   }
}   
