#!/usr/bin/env sh

# rightsizewindow.sh
#################################################################
# Resizes the window you are foucused on to a specific format 
# and let's it float.
#################################################################
# Dependencies: 
#   slurp jq
#################################################################

# Variables
WIDTH=1440
HEIGHT=900

# Get application that is in focus
application=$(
    swaymsg -t get_tree | \
        jq -r '.. | select(.pid? and .visible?) | "\(.rect.x),\(.rect.y) \(.rect.width)x\(.rect.height) \(.pid)" ' | \
        slurp -f "%l"
)

# Resize the application and let it flaot
sway [pid=$application] floating enable, resize set $WIDTH $HEIGHT
