terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.60.0"
    }
  }
}

provider "azurerm" {
  subscription_id = var.subscription_id

  features {}
}

# RESOURCE GROUP

resource "azurerm_resource_group" "rg" {
  name     = var.prefix
  location = var.location

}