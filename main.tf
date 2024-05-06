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

# alerts
module "metric_alerts" {
  source               = "./alerts"
  resource_group_name  = azurerm_resource_group.app_grp.name
  scope                = [azurerm_resource_group.app_grp.id]
  postgresql_server_id = azurerm_postgresql_flexible_server.example.id
  location             = azurerm_resource_group.app_grp.location
}

/*
# storage account
module "storage_account_settings" {
  source              = "./storage"
  resource_group_name = azurerm_resource_group.app_grp.name
  location            = azurerm_resource_group.app_grp.location
}

resource "null_resource" "backup" {
  provisioner "local-exec" {
    command = <<-EOT
      cat <<EOF > /tmp/backup_variables
      POSTGRES_HOST="${var.postgres_host}"
      POSTGRES_PORT="${var.postgres_port}"
      POSTGRES_DB="${var.postgres_db}"
      POSTGRES_USER="${var.postgres_user}"
      POSTGRES_PASSWORD="${var.postgres_password}"
      CONTAINER_NAME="${var.container_name}"
      STORAGE_ACCOUNT_NAME="${var.storage_account_name}"
      STORAGE_ACCOUNT_KEY="${var.storage_account_key}"
      EOF
    EOT
  }

  # This triggers the execution of the script whenever the server is created or updated
  triggers = {
    always_run = timestamp()
  }
}

*/



# TODO:
# Test - integration test
# Explain terraform in the exam (init, plan, apply)


# DONE:
# HA
# Health checks
# Data backup
