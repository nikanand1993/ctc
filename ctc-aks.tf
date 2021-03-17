variable "aks-rg-name" {
  type = string
}

variable "dnsip" {
  type = string 
}

variable "aks-name" {
  type = string
}

variable "service-cidr" {
  type = string
}

variable "docker-cidr" {
  type = string
}

variable "dns-name" {
  type = string
}

variable "aks-vm-size" {
  type = string
}


module "aks" {
  source = ".//modules/compute/aks"
  aks-rg-name = var.aks-rg-name
  aks-name = var.aks-name
  location = var.location
  subnet-id = module.network.subnet-info["trial-subnet2"].id
  dns-ip = var.dnsip
  docker-cidr = var.docker-cidr
  service-cidr = var.service-cidr
  vm-size = var.aks-vm-size
  dns-name = var.dns-name
}
