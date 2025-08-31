#!/bin/bash

# A simple backup script.

# --- Configuration ---
# Set the directory you want to back up.
SOURCE_DIR="/Users/sameer/python-code"

# Set the destination directory for your backups.
BACKUP_DIR="/Users/sameer/backups"

# --- Script Logic ---
# Create a timestamp for the backup file (e.g., 20250831_095417)
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# Define the backup filename.
FILENAME="$BACKUP_DIR/backup-$TIMESTAMP.tar.gz"

# --- Execution ---
echo "🚀 Starting backup of $SOURCE_DIR..."

# Create the compressed archive using tar.
# -c: create a new archive
# -z: compress the archive with gzip
# -v: verbosely list files processed
# -f: allows you to specify the filename of the archive
tar -czvf "$FILENAME" "$SOURCE_DIR"

echo "✅ Backup complete! File saved as: $FILENAME"