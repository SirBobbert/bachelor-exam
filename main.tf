terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.94.0"
    }
  }
}

resource "azurerm_resource_group" "app_grp" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_postgresql_flexible_server" "example" {
  name                   = var.server_name
  resource_group_name    = azurerm_resource_group.app_grp.name     # Use the created resource group
  location               = azurerm_resource_group.app_grp.location # Use the created resource group's location
  administrator_login    = var.administrator_login
  administrator_password = var.administrator_password
  version                = var.server_version
  sku_name               = var.sku_name

  backup_retention_days = var.backup_retention_days

  storage_mb        = var.storage_mb
  storage_tier      = var.storage_tier
  auto_grow_enabled = var.auto_grow_enabled
}

# TODO:
# Health checks
# CI/CD
