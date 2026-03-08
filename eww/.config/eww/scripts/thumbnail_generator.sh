#!/bin/bash

mkdir -p ~/.config/eww/thumbnails
mkdir -p ~/.config/backgrounds/symlinks
rm -rf ~/.config/eww/thumbnails/*
rm -rf ~/.config/backgrounds/symlinks/*

find ~/.config/backgrounds/ -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" \) -exec ln -sf {} ~/.config/backgrounds/symlinks/ \;
find ~/.config/backgrounds/walls-catppuccin-mocha -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" \) -exec ln -sf {} ~/.config/backgrounds/symlinks/ \;


find ~/.config/backgrounds/symlinks -type l \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" \) \
| parallel magick {} -thumbnail 400x240 ~/.config/eww/thumbnails/{/}
