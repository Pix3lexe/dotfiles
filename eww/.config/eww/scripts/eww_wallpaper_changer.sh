#!/bin/bash

filename=$(basename $1)
filename="${filename%.png}" # remove .png
$HOME/.config/eww/scripts/change-wallpaper.sh "$HOME/.config/backgrounds/symlinks/$filename"
