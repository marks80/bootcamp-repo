#!/bin/bash

# Create a script that:
# Backs up a specified directory to another location (e.g., /backups)
# Maintains versioning by appending timestamps to backups
# Automatically deletes the oldest backup if the number of backups exceeds a defined limit (e.g., 5 versions)
# Supports both full and incremental backups, based on user input


# Function to display usage instructions
usage() {
    echo "Usage: $0 -s <source_dir> -d <dest_dir> -m <max_backups> -t <backup_type>"
    echo "  -s: Source directory to back up"
    echo "  -d: Destination directory for backups"
    echo "  -m: Maximum number of backups to retain"
    echo "  -t: Backup type (full or incremental)"
    exit 1
}

# Parse command-line arguments
while getopts "s:d:m:t:" opt; do
    case $opt in
        s) source_dir="$OPTARG" ;;
        d) dest_dir="$OPTARG" ;;
        m) max_backups="$OPTARG" ;;
        t) backup_type="$OPTARG" ;;
        *) usage ;;
    esac
done

# Validate arguments
if [ -z "$source_dir" ] || [ -z "$dest_dir" ] || [ -z "$max_backups" ] || [ -z "$backup_type" ]; then
    usage
fi

# Ensure the destination directory exists
mkdir -p "$dest_dir"

# Create a timestamp
timestamp=$(date +"%Y%m%d_%H%M%S")

# Define the backup name
backup_name="backup_$timestamp"

# Perform the backup
if [ "$backup_type" == "full" ]; then
    rsync -a --delete "$source_dir/" "$dest_dir/$backup_name/"
elif [ "$backup_type" == "incremental" ]; then
    # Find the most recent backup to use as a reference
    latest_backup=$(ls -dt "$dest_dir"/backup_* | head -1)
    if [ -d "$latest_backup" ]; then
        rsync -a --link-dest="$latest_backup" "$source_dir/" "$dest_dir/$backup_name/"
    else
        # If no previous backup exists, fall back to full backup
        echo "No previous backup found. Performing a full backup."
        rsync -a --delete "$source_dir/" "$dest_dir/$backup_name/"
    fi
else
    echo "Invalid backup type. Please choose 'full' or 'incremental'."
    exit 1
fi

# Prune old backups if the number exceeds the maximum limit
backup_count=$(ls -dt "$dest_dir"/backup_* | wc -l)
if [ "$backup_count" -gt "$max_backups" ]; then
    oldest_backup=$(ls -dt "$dest_dir"/backup_* | tail -1)
    echo "Deleting oldest backup: $oldest_backup"
    rm -rf "$oldest_backup"
fi

echo "Backup completed successfully."



