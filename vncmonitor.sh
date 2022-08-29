#!/usr/bin/env sh

# vncmonitor.sh
#################################################################
# Creates a dummy monitor and lets a client connect to it via VNC.
# The connection is established via a jumphost and SSH tunneling 
# (as in my usecase the client and the server aren't in the same network).
#################################################################
# Dependencies: 
#   wayvnc openssh
#################################################################

# Variables
RESOLUTION=1920x1080

SSH_JUMPHOST_PORT=22
SSH_JUMPHOST_VNC_PORT=5901
SSH_JUMPHOST_SERVER=jump@example.com

# Create a virtual monitor, if there is none
[ 1 -gt $(swaymsg -t get_outputs | grep HEADLESS | wc -l ) ] && swaymsg create_output
# Set resolution
swaymsg output "HEADLESS-1" resolution $RESOLUTION

# Run vnc on localhost
wayvnc -o HEADLESS-1 localhost &

# Tunnel the traffic to $SSH_JUMPHOST_SERVER
ssh -R $SSH_JUMPHOST_VNC_PORT:localhost:5900 $SSH_JUMPHOST_SERVER -p$SSH_JUMPHOST_PORT

# Disable the headless monitor
swaymsg output "HEADLESS-1" disable

# Kill wayvnc
pkill wayvnc
