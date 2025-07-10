#!/bin/sh

# The $NAME variable is passed from sketchybar and holds the name of
# the item invoking this script:
LANG=it_IT
sketchybar --set "$NAME" label="$(date +'%a %d %b %H:%M')" padding_left=0

