// Azure connection
variable "subscription_id" {
  description = "The subscription ID"
  type        = string
}

variable "client_id" {
  description = "The client ID"
  type        = string
}

variable "client_secret" {
  description = "The client secret"
  type        = string
}

variable "tenant_id" {
  description = "The tenant ID"
  type        = string
}

// Resource group
variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure region where the PostgreSQL server will be deployed"
  type        = string
}

// Postgresql Flexible Server
variable "server_name" {
  description = "The name of the PostgreSQL server"
  type        = string
  default     = "example-psqlflexibleserver-test222"
}

variable "administrator_login" {
  description = "The administrator login for the PostgreSQL server"
  type        = string
  default     = "psqladmin"
}

variable "administrator_password" {
  description = "The password for the administrator login"
  type        = string
  default     = "H@Sh1CoR3!"
}

variable "server_version" {
  description = "The version of PostgreSQL to deploy"
  type        = string
  default     = "12"
}

variable "sku_name" {
  description = "The SKU name of the PostgreSQL server"
  type        = string
  default     = "B_Standard_B1ms"
}

variable "backup_retention_days" {
  description = "The number of days to retain backups"
  type        = number
  default     = 7
}

variable "storage_mb" {
  description = "The amount of storage for the PostgreSQL server in megabytes"
  type        = number
  default     = 32768
}

variable "storage_tier" {
  description = "The storage tier of the PostgreSQL server"
  type        = string
  default     = "P4"
}

variable "auto_grow_enabled" {
  description = "Whether automatic storage growth is enabled"
  type        = bool
  default     = true
}
