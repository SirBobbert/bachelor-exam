# Define Azure Monitor action group
resource "azurerm_monitor_action_group" "example" {
  name                = "CriticalAlertsAction"
  resource_group_name = azurerm_resource_group.app_grp.name
  short_name          = "p0action"

  email_receiver {
    name          = "sendtoadmin"
    email_address = "robert.pallesen13@gmail.com"
  }
}
