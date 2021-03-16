variable "vm-rg-name" {
  type = string
}

variable "vm-name" {
  type = string
}

variable "vm-size" {
  type = string
}

variable "cache" {
  type = string
}

variable "storage-type" {
  type = string 
}

variable "publisher" {
  type = string
}

variable "offer" {
  type = string
}

variable "sku" {
  type = string
}

variable "image-version" {
  type = string 
}


module "vm" {
  source = ".//modules/compute/vm"
  vm-rg-name = var.vm-rg-name
  location = var.location
  subnet-id = module.network.subnet-info["trial-subnet"].id
  vm-name = var.vm-name
  vm-size = var.vm-size
  vm-cache = var.cache
  storage-type = var.storage-type
  publisher = var.publisher
  offer = var.offer
  sku = var.sku
  image-version = var.image-version
}
