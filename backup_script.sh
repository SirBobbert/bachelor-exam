#!/bin/bash

# Read variables from file
source /tmp/backup_variables

# Set the backup filename with timestamp
BACKUP_FILENAME="backup_$(date +"%Y%m%d_%H%M%S").sql"

# Perform PostgreSQL backup
pg_dump -h "$POSTGRES_HOST" -p "$POSTGRES_PORT" -U "$POSTGRES_USER" -d "$POSTGRES_DB" > "$BACKUP_FILENAME"

# Upload backup file to Azure Blob Storage
az storage blob upload --container-name "$CONTAINER_NAME" --name "$BACKUP_FILENAME" --file "$BACKUP_FILENAME" --account-name "$STORAGE_ACCOUNT_NAME" --account-key "$STORAGE_ACCOUNT_KEY"

# Remove local backup file
rm "$BACKUP_FILENAME"
