# swayScripts

## Screenshot sway shortcuts

```
# Select screenshot area.
bindsym --release Shift+Print exec sh ~/Scripts/screenshotselect.sh
# Screenshot everything.
bindsym --release Print exec sh ~/Scripts/screenshot.sh
# Let the user select a window to screenshot.
bindsym --release $mod+Print exec sh ~/Scripts/screenshotonewindow.sh
# Convert a window to a specific height / width for consitant screenshot size.
bindsym --release space+Print exec sh ~/Scripts/rightsizewindow.sh
```

## Window focus sway shortcuts

```
# Move the cursor to the middle of the window when focusing on it using these shortcuts:
bindsym $mod+Control+h focus left; exec sh ~/Scripts/cursortomiddleofcontainer.sh
bindsym $mod+Control+j focus right; exec sh ~/Scripts/cursortomiddleofcontainer.sh
bindsym $mod+Control+k focus up; exec sh ~/Scripts/cursortomiddleofcontainer.sh
bindsym $mod+Control+l focus down; exec sh ~/Scripts/cursortomiddleofcontainer.sh
```
