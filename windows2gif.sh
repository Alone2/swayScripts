#!/usr/bin/env sh

# windows2gif.sh
#################################################################
# Let's the user select a window. The window will be recorded
# and the recording will be saved as a GIF
#################################################################
# Dependencies: 
#   wf-recorder jq slurp
#################################################################

# Variables
FILENAME_PREFIX=screencast
OUTPUT_DIR=~/Videos

# Exit if non-zero exit status
set -e 

# Let the user select a window
window=$(
    swaymsg -t get_tree | \
        jq -r '.. | select(.pid? and .visible?) | .rect | "\(.x),\(.y) \(.width)x\(.height)"' | \
        slurp
)

# Create a name for the video file
name=$(date +%s)

# Take a screencast and save the video temporarely
wf-recorder -g "${window}" -f /tmp/${name}.mp4

# Convert the video to a GIF
ffmpeg -y -i /tmp/${name}.mp4 -filter_complex "fps=5,scale=iw*.8:ih*.8:flags=lanczos,split[s0][s1];[s0]palettegen=max_colors=32[p];[s1][p]paletteuse=dither=bayer" ${OUTPUT_DIR}/${FILENAME_PREFIX}$(date +%s).gif

# Remove the temporary file
rm /tmp/${name}.mp4
