#!/bin/bash

options="Logout\nReboot\nShutdown"

selection=$(echo -e "$options" | tofi \
    --width 200 \
    --height 200 \
    --prompt-text "Power: " \
    --outline-width 0 \
    --border-width 0 \
    --anchor center)

if [ "$selection" = "Logout" ]; then
    loginctl terminate-user $USER
elif [ "$selection" = "Reboot" ]; then
    systemctl reboot
elif [ "$selection" = "Shutdown" ]; then
    systemctl poweroff
fi
