resource "azurerm_monitor_metric_alert" "read_iops_alert" {
  name                = "read-iops-alert"
  resource_group_name = var.resource_group_name
  scopes              = var.scope

  description = "Alert triggered when read IOPS exceeds 100."

  criteria {
    metric_namespace = var.metric_namespace
    metric_name      = "read_iops"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 100
  }

  action {
    action_group_id = azurerm_monitor_action_group.email_notifications.id
  }

  target_resource_type     = var.metric_namespace
  target_resource_location = var.location

  depends_on = [
    azurerm_monitor_action_group.email_notifications,
    var.postgresql_server_id,
  ]
}
