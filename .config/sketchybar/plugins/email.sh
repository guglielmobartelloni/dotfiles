#!/usr/bin/env bash

source "$CONFIG_DIR/colors.sh"

# AppleScript to fetch WhatsApp Dock badge count
UNREAD=$(osascript <<'APPLESCRIPT'
set total to 0
tell application "System Events"
  tell process "Dock"
    try
      set unread to value of attribute "AXStatusLabel" of UI element "Thunderbird" of list 1
      if unread is not missing value then
        set total to unread as integer
      end if
    end try
  end tell
end tell
return total
APPLESCRIPT
)

# if [[ $UNREAD -gt 0 ]]; then
#   sketchybar --set "$NAME" label="$UNREAD" icon= 
# else
#   sketchybar --set "$NAME" label="" icon=
# fi

sketchybar --set "$NAME" label="$UNREAD" icon=
