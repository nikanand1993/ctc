variable "vnet-name" {
  type = string
}

variable "vnet-cidr" {
  type = list(string)
}

variable "subnets" {
  type = list(object({
      name = string
      prefix = list(string)
      endpoints = list(string)
    }))
}

variable "nw-rg-name" {
  type = string
}

module "network" {
  source = ".//modules/network"
  network-rg-name = var.nw-rg-name
  location        = var.location

  vnet-name     = var.vnet-name
  vnet-address-space = var.vnet-cidr

  subnet = var.subnets
    
}

