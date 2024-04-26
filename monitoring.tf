resource "azurerm_resource_group" "app_grp-test-2" {
  name     = "test-resource-bobbert"
  location = var.location
}

resource "azurerm_monitor_action_group" "example" {
  name                = "CriticalAlertsAction"
  resource_group_name = azurerm_resource_group.app_grp.name
  short_name          = "p0action"

  email_receiver {
    name          = "sendtoadmin"
    email_address = "robert.pallesen13@gmail.com"
  }
}

resource "azurerm_monitor_metric_alert" "cpu_alert" {
  name                = "cpu-usage-alert"
  resource_group_name = azurerm_resource_group.app_grp.name
  scopes              = [azurerm_postgresql_flexible_server.example.id]
  description         = "Alert triggered when CPU usage exceeds 80%."

  criteria {
    metric_namespace = "Microsoft.DBforPostgreSQL/flexibleServers"
    metric_name      = "Percentage CPU"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 80
  }

  action {
    action_group_id = azurerm_monitor_action_group.example.id
  }

  depends_on = [
    azurerm_monitor_action_group.example,
    azurerm_postgresql_flexible_server.example, # Ensure PostgreSQL Flexible Server is created first
  ]
}
