resource "azurerm_resource_group" "aks-rg" {
  name     = var.aks-rg-name
  location = var.location
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks-name
  location            = azurerm_resource_group.aks-rg.location
  resource_group_name = azurerm_resource_group.aks-rg.name
  dns_prefix          = var.dns-name


  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = var.vm-size
    vnet_subnet_id = var.subnet-id
    
  }
 
  network_profile {
    network_plugin = "azure"
    dns_service_ip = var.dns-ip
    docker_bridge_cidr = var.docker-cidr
    service_cidr = var.service-cidr
    }

  identity {
    type = "SystemAssigned"
  }

  
}

