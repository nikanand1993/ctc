nw-rg-name = "trial-network-rg"
location = "eastus"
vnet-name = "trial-vnet"
vnet-cidr = ["10.0.0.0/16"]


subnets = [{
   name = "trial-subnet"
   prefix = ["10.0.0.0/24"]
   endpoints = []
},
{
   name = "trial-subnet2"
   prefix = ["10.0.12.0/22"]
   endpoints = []
}]

vm-rg-name = "trial-compute-rg"
vm-name = "trial-vm"
vm-size = "Standard_F2s"
cache = "ReadWrite"
storage-type = "Standard_LRS"

publisher = "Canonical"
offer     = "UbuntuServer"
sku       = "18.04-LTS"
image-version   = "latest"


aks-name = "trial-aks"
aks-rg-name = "trial-compute-rg2"
dnsip = "10.240.0.10"
docker-cidr = "172.17.0.1/16"
service-cidr = "10.240.0.0/16"

