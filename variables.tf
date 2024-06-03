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
  default     = "example-psqlflexibleserver-test-server"
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
  default     = "GP_Standard_D4s_v3" // SKU that supports high availability
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

// High Availability
variable "ha_mode" {
  description = "The high availability mode for the PostgreSQL server ('SameZone' or 'ZoneRedundant')"
  type        = string
  default     = "ZoneRedundant"
}

variable "ha_standby_availability_zone" {
  description = "The Availability Zone where the standby server should be located"
  type        = number
  default     = 1
}

// Backup settings
variable "backup_retention_days" {
  description = "The number of days to retain backups"
  type        = number
  default     = 7
}

variable "geo_redundant_backup_enabled" {
  description = "Whether geo-redundant backups are enabled"
  type        = bool
  default     = false
}

// Additional variables for null_resource (if needed)
variable "postgres_host" {
  description = "The hostname of the PostgreSQL server"
  type        = string
}

variable "postgres_port" {
  description = "The port of the PostgreSQL server"
  type        = number
}

/*
variable "postgres_db" {
  description = "The name of the PostgreSQL database"
  type        = string
}
*/

variable "postgres_user" {
  description = "The username for accessing the PostgreSQL database"
  type        = string
}

variable "postgres_password" {
  description = "The password for accessing the PostgreSQL database"
  type        = string
  sensitive   = true
}

/*
variable "container_name" {
  description = "The name of the Azure Blob Storage container"
  type        = string
}
*/

variable "storage_account_name" {
  description = "The name of the Azure Storage Account"
  type        = string
}

variable "storage_account_key" {
  description = "The access key for the Azure Storage Account"
  type        = string
  sensitive   = true
}
