output "virtual_machines" {
  value = {
      id          = azurerm_linux_virtual_machine.vm.id
      name        = azurerm_linux_virtual_machine.vm.name
      nic_id      = azurerm_network_interface.vm-nic.id
      private_ip  = azurerm_network_interface.vm-nic.ip_configuration[0].private_ip_address
    }
}
