#!/usr/bin/env bash

# List of options
options="Lock\nSuspend\nLog out\nReboot\nShutdown"

# Run fuzzel
chosen=$(echo -e "$options" | fuzzel --dmenu -p "⏻   ")

# Act on selection
case "$chosen" in
    *Lock)  swaylock ;;
    *Suspend) systemctl suspend ;;
    *"Log out") niri msg action quit;;
    *Reboot) systemctl reboot ;;
    *Shutdown) systemctl poweroff ;;
esac

