#!/usr/bin/env sh

# cursertomiddleofcontainer.sh
#################################################################
# Moves the mouse curser to the middle of the current focused 
# container
#################################################################
# Dependencies: 
#   jq
#################################################################

# Get position of the current focused application
position=$(
    swaymsg -t get_tree | \
        jq -r '.. | select(.pid? and .visible? and .focused?) |  .rect | "\(.x) \(.y) \(.width) \(.height)"'
)

# Get coordinates, width and height of the container
x=$(echo $position | awk '{print $1}')
y=$(echo $position | awk '{print $2}')
w=$(echo $position | awk '{print $3}')
h=$(echo $position | awk '{print $4}')

# Move the cursor to the middle of said container
sway seat - cursor set $(expr $x + \( $w / 2 \)) $(expr $y + \( $h / 2 \) )
