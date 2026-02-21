#!/bin/bash

swww-daemon &
WALLPAPER_DIR="$HOME/Downloads/wallpapers"
RANDOM_WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

swww img "$RANDOM_WALLPAPER" --transition-type grow --transition-pos 0.5,0.5
