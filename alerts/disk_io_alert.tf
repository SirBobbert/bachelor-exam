module "action_group" {
  source = "./monitor_action_group.tf"
}

# Disk I/O Alert
resource "azurerm_monitor_metric_alert" "disk_io_alert" {
  name                = "disk-io-alert"
  resource_group_name = azurerm_resource_group.app_grp.name
  scopes              = [azurerm_resource_group.app_grp.id]

  description = "Alert triggered when disk I/O latency exceeds 10 milliseconds."

  criteria {
    metric_namespace = "Microsoft.DBforPostgreSQL/flexibleServers"
    metric_name      = "read_iops"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 10
  }

  action {
    action_group_id = azurerm_monitor_action_group.example.id
  }

  target_resource_type     = "Microsoft.DBforPostgreSQL/flexibleServers"
  target_resource_location = "North Europe" # Replace this with the actual location of your resource

  depends_on = [
    azurerm_monitor_action_group.example,
    azurerm_postgresql_flexible_server.example, # Ensure PostgreSQL Flexible Server is created first
  ]
}
