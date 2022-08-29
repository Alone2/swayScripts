# vncmonitor_connect_windows.ps1
#################################################################
# Connects to a dummy monitor with sway via VNC.
# The connection is established via a jumphost and SSH tunneling.
# (This script only exists so I can use Linux on the PCs at my School).
#################################################################
# Dependencies: 
#   tigervnc (vncviewer in PATH)
#################################################################

# Variables
$SSH_JUMPHOST_PORT=22
$SSH_JUMPHOST_VNC_PORT=5901
$SSH_JUMPHOST_SERVER=jump@example.com

# Connect to localhost vncviewer
vncviewer localhost

# Create ssh tunnel
ssh -L 5900:localhost:$SSH_JUMPHOST_SERVER $SSH_JUMPHOST_SERVER -p$SSH_JUMPHOST_PORT
