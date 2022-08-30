#!/usr/bin/env sh

# battery.sh
#################################################################
# Show the % of battery remaining.
#################################################################
# Dependencies: 
#   upower ttf-font-awesome
#################################################################

# Get battery %
bat=$(
    upower -i `upower -e | grep 'BAT'` | \
        grep percentage | \
        awk '{print $2}' | \
        cut -d '%' -f 1
)

# Set icons for every battery stage
icon=" "
#    
if [ $bat -gt 90 ]
then
    icon=" "
elif [ $bat -gt 70 ]
then
    icon=" "
elif [ $bat -gt 40 ]
then
    icon=" "
elif [ $bat -gt 20 ]
then
    icon=" "
fi

# Echo battery %
echo  -n "$icon $bat%"
