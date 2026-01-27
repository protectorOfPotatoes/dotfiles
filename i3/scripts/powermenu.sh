#!/bin/bash

# Use rofi or dmenu to display a power menu
# Options with icons (requires a font with icons like Font Awesome)

chosen=$(echo -e " Lock\n Shutdown\n d Suspend\n t Reboot\n e Logout" | rofi -dmenu -i -p "Power Menu:")

case "$chosen" in
    "  Lock") exec i3-msg exist;; # Replace i3lock with your screen locker command
    "  Shutdown") systemctl poweroff ;;
    " d Suspend") systemctl suspend ;;
    " t Reboot") systemctl reboot ;;
esac

