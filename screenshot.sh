#!/usr/bin/env sh

# Screenshot.sh
#################################################################
# Take a screenshot
#################################################################
# Dependencies: 
#   xclip notify-send grim
#################################################################

# Variables
OUTPUT_DIR=~/Pictures/screenshots

# Exit if non-zero exit code
set -e

# Generate a filename
filename=$(date +screenshot-%Y-%m-%d-%H%M%S%N.png) 
mkdir -p ${OUTPUT_DIR}

# Take a screenshot of the selected container
grim ${OUTPUT_DIR}/$filename 

# Copy the file to the clipboard
xclip -selection clipboard -t image/png -i ${OUTPUT_DIR}/$filename 

# Broadcast a notification
notify-send -i ${OUTPUT_DIR}/$filename -u low "Screenshot" "saved as ${OUTPUT_DIR}/$filename" -t 700
