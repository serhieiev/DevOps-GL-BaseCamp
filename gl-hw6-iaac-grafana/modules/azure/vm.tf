resource "azurerm_linux_virtual_machine" "vm_instance" {
  name                            = "graf"
  location                        = azurerm_resource_group.graf.location
  resource_group_name             = azurerm_resource_group.graf.name
  network_interface_ids           = [azurerm_network_interface.graf-nic.id]
  size                            = "Standard_B1s"
  computer_name                   = "graf-azure"
  admin_username                  = "ubuntu"
  disable_password_authentication = true

  custom_data = base64encode(file("${path.module}/install_grafana.sh"))

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts-gen2"
    version   = "latest"
  }

  os_disk {
    name                 = "graf"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  admin_ssh_key {
    username   = var.ssh_user
    public_key = file(var.ssh_pub_key_file)
  }

  identity {
    type = "SystemAssigned"
  }
}

data "azurerm_public_ip" "vm" {
  depends_on          = [azurerm_linux_virtual_machine.vm_instance, azurerm_public_ip.graf]
  name                = azurerm_public_ip.graf.name
  resource_group_name = azurerm_resource_group.graf.name
}
