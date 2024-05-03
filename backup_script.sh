#!/bin/bash

# Set variables
export POSTGRES_HOST="${var.postgres_host}"
export POSTGRES_PORT="${var.postgres_port}"
export POSTGRES_DB="${var.postgres_db}"
export POSTGRES_USER="${var.postgres_user}"
export POSTGRES_PASSWORD="${var.postgres_password}"
export CONTAINER_NAME="${var.container_name}"
export STORAGE_ACCOUNT_NAME="${var.storage_account_name}"
export STORAGE_ACCOUNT_KEY="${var.storage_account_key}"

# Set the backup filename with timestamp
BACKUP_FILENAME="backup_$(date +"%Y%m%d_%H%M%S").sql"

# Perform PostgreSQL backup
pg_dump -h "$POSTGRES_HOST" -p "$POSTGRES_PORT" -U "$POSTGRES_USER" -d "$POSTGRES_DB" > "$BACKUP_FILENAME"

# Upload backup file to Azure Blob Storage
az storage blob upload --container-name "$CONTAINER_NAME" --name "$BACKUP_FILENAME" --file "$BACKUP_FILENAME" --account-name "$STORAGE_ACCOUNT_NAME" --account-key "$STORAGE_ACCOUNT_KEY"

# Remove local backup file
rm "$BACKUP_FILENAME"
