resource "azurerm_lb" "public_lb" {
  name                = "public-lb"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = "public-lb-frontend"
    public_ip_address_id = azurerm_public_ip.lb_public_ip.id
  }
}

resource "azurerm_lb_rule" "http_rule" {
  name                           = "http-rule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "public-lb-fe"
  loadbalancer_id                = azurerm_lb.public_lb.id

  backend_address_pool_ids = [
    azurerm_lb_backend_address_pool.app_pool.id
  ]
}

# HEALTH PROBE

resource "azurerm_lb_probe" "http_probe" {
  name            = "http-probe"
  loadbalancer_id = azurerm_lb.public_lb.id
  protocol        = "Tcp"
  port            = 80
}

resource "azurerm_lb_backend_address_pool" "app_pool" {
  name            = "app-backend-pool"
  loadbalancer_id = azurerm_lb.public_lb.id
}