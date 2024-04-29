/*
resource "azurerm_monitor_diagnostic_setting" "example" {
  name               = "example-psqlflexibleserver-diagnostics"
  target_resource_id = azurerm_postgresql_flexible_server.example.id


  enabled_log {
    category = "AuditEvent"

    retention_policy {
      enabled = false
    }
  }

  metric {
    category = "AllMetrics"

    retention_policy {
      enabled = false
    }
  }
}
*/
