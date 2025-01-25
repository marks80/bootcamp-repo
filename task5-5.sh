#!/bin/bash

# Task 5: Backup Script (Using Loops, Special Variables, Troubleshooting)

# Objective: Create a script that takes a list of directories and backs them up into a backup directory. It should handle missing directories and report successful backups.

# Details:

# Accept multiple directories as command-line arguments.
# Loop through each directory and check if it exists.
# If the directory exists, create a backup (copy the directory).
# Handle errors if directories do not exist or if the backup fails.



backup_dir="$HOME/backup"
success_list=()
error_list=()

create_backup_dir() {
    if [ ! -d "$backup_dir" ]; then
        mkdir -p "$backup_dir"
        echo "Created backup: $backup_dir"
    fi
}

# print  instructions 4 user
print_usage() {
    echo "Usage: $(basename "$0") <dir1> <dir2> ..."
    exit 1
}

# back up a directory
backup_directory() {
    local dir="$1"
    local dest="$backup_dir/$(basename "$dir")_$(date +%Y%m%d%H%M%S)"
    if [ -d "$dir" ]; then
        echo "Backing up: $dir"
        rsync -a "$dir/" "$dest/" 2>>backup_error.log
        if [ $? -eq 0 ]; then
            echo "Successfully backed up: $dir"
            success_list+=("$dir")
        else
            echo "Failed to back up: $dir"
            error_list+=("$dir")
        fi
    else
        echo "Directory does not exist: $dir"
        error_list+=("$dir")
    fi
}

#  print report
print_summary() {
    echo
    echo "Successfully backed up:"
    for success in "${success_list[@]}"; do
        echo "  - $success"
    done

    if [ "${#error_list[@]}" -ne 0 ]; then
        echo
        echo "Failed to back up -"
        for error in "${error_list[@]}"; do
            echo "  - $error"
        done
    fi
}

# Main script
create_backup_dir

# Check if at least one argument is passed
if [ $# -eq 0 ]; then
    echo "No directories provided."
    print_usage
fi

# Loop through each directory provided as an argument
for dir in "$@"; do
    backup_directory "$dir"
done

print_summary

