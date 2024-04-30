terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.101.0"
    }
  }
}

resource "azurerm_resource_group" "app_grp" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_postgresql_flexible_server" "example" {
  name                   = var.server_name
  resource_group_name    = azurerm_resource_group.app_grp.name
  location               = azurerm_resource_group.app_grp.location
  administrator_login    = var.administrator_login
  administrator_password = var.administrator_password
  version                = var.server_version
  sku_name               = var.sku_name

  storage_mb        = var.storage_mb
  storage_tier      = var.storage_tier
  auto_grow_enabled = var.auto_grow_enabled

  backup_retention_days        = var.backup_retention_days
  geo_redundant_backup_enabled = var.geo_redundant_backup_enabled

  high_availability {
    mode = var.ha_mode
  }
}

module "metric_alerts" {
  source               = "./alerts"
  resource_group_name  = azurerm_resource_group.app_grp.name
  scope                = [azurerm_resource_group.app_grp.id]
  postgresql_server_id = azurerm_postgresql_flexible_server.example.id
  location             = azurerm_resource_group.app_grp.location
}

module "storage_account_settings" {
  source              = "./storage"
  resource_group_name = azurerm_resource_group.app_grp.name
  location            = azurerm_resource_group.app_grp.location
}



# TODO:
# Test


# DONE:
# HA
# Health checks
# Data backup
