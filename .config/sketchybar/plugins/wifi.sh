#!/bin/sh

source "$CONFIG_DIR/colors.sh"

SSID=$(ipconfig getsummary "$(networksetup -listallhardwareports | awk '/Wi-Fi|AirPort/{getline; print $NF}')" | grep '  SSID : ' | awk -F ': ' '{print $2}')

if [ "$SSID" = "" ]; then
  sketchybar --set wifi icon="󰖪" label="Disconnected"
else
  sketchybar --set wifi icon="" label="$SSID"
fi
