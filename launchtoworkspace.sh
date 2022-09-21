#!/usr/bin/env sh

# launchtoworkspace.sh
#################################################################
# Launch an application to a specific workspace.
# Ideal to populate the workspaces on startup.
#################################################################
# Dependencies: 
#  
#################################################################

# Exit if error
set -e

# Binary of the app
app=$1
# app_id or class
app_id=$2
# Class of the app, as 
workspacenum=$3

# Returns 1 if starting is finished
_check_if_app_is_starting () {
    # Application
    app=$1

    if [ "$(swaymsg -t get_tree | grep $app_id | grep -E '(class|app_id)')" = "" ]
    then
        return 0
    fi
    return 1
}

# Binary of the app
app=$1
# Class of the app, as 
appclass=$2
workspacenum=$3

# Launch app
$app & 

# Wait till the application has started
while _check_if_app_is_starting $app
do 
    sleep 0 
done 

# Move it to the desired workspace
sway [class="$app"] move container to workspace $workspacenum 
sway [app_id="$app_id"] move container to workspace $workspacenum
