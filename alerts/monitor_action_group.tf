resource "azurerm_monitor_action_group" "email_notifications" {
  name                = var.action_group_name
  resource_group_name = var.resource_group_name
  short_name          = var.action_group_short_name

  email_receiver {
    name          = var.email_receiver_name
    email_address = var.email_receiver_address
  }
}
