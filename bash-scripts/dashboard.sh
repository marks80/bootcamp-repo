#!/bin/bash

# The script should continuously display real-time information about the system’s resources, including:
# CPU usage (using top or mpstat).
# Memory usage (using free).
# Disk space usage (using df).
# Network usage (using ifconfig or ip).


# Directory for  snapshots
SAVE_DIR="/home/MarksS/logfile"

# Create the save directory if it does not exist
mkdir -p "$SAVE_DIR"

# Function to display system resources
display_system_resources() {
    clear
    echo "CPU usage"
    top -bn1 | grep "Cpu(s)"

    echo "RAM usage"
    free -h

    echo "Disk usage"
    df -h

    echo "Network usage"
    ifconfig | grep "inet"
}

# Function to save snapshot
save_snapshot() {
    timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
    snapshot_file="$SAVE_DIR/snapshot_$timestamp.txt"
    {
        display_system_resources
    } > "$snapshot_file"
    echo "Snapshot saved to $snapshot_file"
}

# Continuously display system resource usage
while true; do
    # Display system resource usage
    display_system_resources

    echo -n "Do you want to save data?(Y/N): "
    read user_input

    if [[ "$user_input" == "Y" || "$user_input" == "y" ]]; then
        save_snapshot
    fi
# Wait before refreshing data (you can adjust the delay)
    sleep 2
done
