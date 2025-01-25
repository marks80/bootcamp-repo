#!/bin/bash

# Define the log file path
logfile="/home/MarksS/logfile/testlogfile.log"

# Initialize the last alert time to prevent immediate repeated alerts
last_alert_time=0

# Function to send an alert with throttle mechanism
send_alert() {
    # Get the current time
    current_time=$(date +%s)
    
    # If 10 seconds have passed since the last alert, show the alert
    if [ $((current_time - last_alert_time)) -ge 10 ]; then
        echo "alert: keyword 'error' found in the log!"
        last_alert_time=$current_time
    fi
}

# Infinite loop to write to the log file at specified intervals
while true; do
    # Write "error message" every 2 seconds
    echo "error message" >> "$logfile"
    sleep 2

    # Write "correct message" every 4 seconds
    echo "correct message" >> "$logfile"
    sleep 4
done &  # Run the writing part in the background to allow monitoring concurrently

# Monitor the log file in real-time for changes
tail -n 0 -F "$logfile" | while read line; do
    # Check if the line contains the keyword "error"
    if [[ "$line" == *"error"* ]]; then
        # Send an alert if the keyword is found and throttle it
        send_alert
    fi
done

