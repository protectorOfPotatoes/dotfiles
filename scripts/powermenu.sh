#!/usr/bin/env bash

# List of options
options="Lock\nSuspend\nLog out\nReboot\nShutdown"

# Run fuzzel
chosen=$(echo -e "$options" | fuzzel --dmenu -p "Power Menu: ")

# Act on selection
case "$chosen" in
    *Lock) swaylock ;; # Or hyprlock
    *Suspend) systemctl suspend ;;
    *"Log out") niri msg action quit;; # Or hyprctl dispatch exit
    *Reboot) systemctl reboot ;;
    *Shutdown) systemctl poweroff ;;
esac

