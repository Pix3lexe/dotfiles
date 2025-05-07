#!/bin/bash

if [ $# -eq 0 ]; then
    echo "failure: no path specified"
    exit 1
elif [ $# -gt 1 ]; then
    echo "failure: too many arguments"
    exit 1
fi

WALL="$1"

# Update hyprpaper config
echo "preload = $WALL" > ~/.config/hypr/hyprpaper.conf
echo "wallpaper = , $WALL" >> ~/.config/hypr/hyprpaper.conf

# Update hyprlock background
awk -v newpath="$WALL" '
/^\s*background\s*{/ { in_block=1 }
/^\s*}/ && in_block { in_block=0 }
in_block && /^\s*path\s*=/ { sub(/=.*/, "= " newpath) }
{ print }
' ~/.config/hypr/hyprlock.conf > ~/.config/hypr/hyprlock.conf.tmp && mv ~/.config/hypr/hyprlock.conf.tmp ~/.config/hypr/hyprlock.conf

# Apply wallpaper
hyprctl hyprpaper reload ,"$WALL"
