#!/bin/bash

mkdir -p ~/.config/eww/thumbnails
for img in ~/.config/backgrounds/walls-catppuccin-mocha/*.{jpg,png,jpeg}; do
  magick "$img" -resize 400x240 ~/.config/eww/thumbnails/$(basename "$img")
done
