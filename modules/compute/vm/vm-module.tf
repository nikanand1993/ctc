
resource "azurerm_resource_group" "vm-rg" {
  name     = var.vm-rg-name
  location = var.location
}

resource "azurerm_network_interface" "vm-nic" {
  name                = "var.vm-name-nic"
  location            = azurerm_resource_group.vm-rg.location
  resource_group_name = azurerm_resource_group.vm-rg.name

  ip_configuration {
    name                          = "ipconfig-1"
    subnet_id                     = var.subnet-id
    private_ip_address_allocation = "Dynamic"
  }

}

resource "azurerm_linux_virtual_machine" "vm" {
  name                = var.vm-name
  resource_group_name = azurerm_resource_group.vm-rg.name
  location            = azurerm_resource_group.vm-rg.location
  size                = var.vm-size
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.vm-nic.id,
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = var.vm-cache
    storage_account_type = var.storage-type
  }

  source_image_reference {
    publisher = var.publisher
    offer     = var.offer
    sku       = var.sku
    version   = var.image-version
  }
}
