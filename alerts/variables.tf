variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "scope" {
  description = "The scope for the alert"
  type        = list(string)
}

variable "postgresql_server_id" {
  description = "ID of the PostgreSQL Flexible Server resource."
}

variable "location" {
  description = "Location of the resource."
}

variable "metric_namespace" {
  description = "Name of the metric"
  default     = "Microsoft.DBforPostgreSQL/flexibleServers"
}

variable "action_group_name" {
  description = "The name of the Azure Monitor action group"
  type        = string
  default     = "CriticalAlertsAction"
}

variable "action_group_short_name" {
  description = "The short name of the Azure Monitor action group"
  type        = string
  default     = "p0action"
}

variable "email_receiver_name" {
  description = "The name of the email receiver"
  type        = string
  default     = "sendtoadmin"
}

variable "email_receiver_address" {
  description = "The email address of the receiver"
  type        = string
  default     = "robert.pallesen13@gmail.com"
}

