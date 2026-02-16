resource "azurerm_subnet" "dev" {
  name                 = "Dev-Subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "prod" {
  name                 = "Prod-Subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_subnet" "app" {
  name                 = "App-Subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.3.0/24"]
}

resource "azurerm_subnet" "data" {
  name                 = "Data-Subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.4.0/24"]
}

resource "azurerm_subnet" "gateway" {
  name                 = "Gateway-Subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.5.0/24"]
}

resource "azurerm_subnet" "AzureBastionSubnet" {
  name                 = "Bastion-Subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.10.0/27"]
}

resource "azurerm_subnet" "AzureFirewallSubnet" {
  name                = "Firewall-Subnet"
  resource_group_name = var.resource_group_name

  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.20.0/26"]
}