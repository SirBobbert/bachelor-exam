/*
resource "random_id" "storage_account_id" {
  byte_length = 8
}

# Define Azure Storage Account for storing backups
resource "azurerm_storage_account" "example" {
  name                     = "storage${random_id.storage_account_id.hex}"        # Name of the storage account
  resource_group_name      = var.resource_group_name # Name of the resource group
  location                 = var.location            # Location of the storage account
  account_tier             = "Standard"              # Storage account tier
  account_replication_type = "LRS"                   # Storage account replication type

  tags = {
    environment = "test"
  }
}

resource "azurerm_storage_management_policy" "example" {
  storage_account_id = azurerm_storage_account.example.id

  rule {
    name    = "rule1"
    enabled = true
    filters {
      prefix_match = ["container1/prefix1"]
      blob_types   = ["blockBlob"]
    }
    actions {
      base_blob {
        tier_to_cool_after_days_since_modification_greater_than    = 10
        tier_to_archive_after_days_since_modification_greater_than = 50
        delete_after_days_since_modification_greater_than          = 100
      }
      snapshot {
        delete_after_days_since_creation_greater_than = 30
      }
    }
  }
}
*/
