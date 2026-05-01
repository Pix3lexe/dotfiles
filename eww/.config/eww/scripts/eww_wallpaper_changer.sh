#!/bin/bash

filename=$(basename $1)
filename="${filename%.png}" # remove .png
$HOME/.config/eww/scripts/change_wallpaper.sh "$HOME/.config/wallpapers/symlinks/$filename"
