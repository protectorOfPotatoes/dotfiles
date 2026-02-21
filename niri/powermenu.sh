#!/bin/bash

SELECTION="$(printf "󰐥 Shutdown\n󰜉 Reboot\n󰍃 Logout" | fuzzel --dmenu --p "Power: " --lines 3 --width 15)"

case "$SELECTION" in
    *Shutdown)
        systemctl poweroff
        ;;
    *Reboot)
        systemctl reboot
        ;;
    *Logout)
        niri msg action quit
        ;;
esac
