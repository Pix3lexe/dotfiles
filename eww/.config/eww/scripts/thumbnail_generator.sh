#!/usr/bin/env bash
THUMBNAIL_WIDTH="250"
THUMBNAIL_HEIGHT="141"

CACHE_DIR="$HOME/.cache/wallpaper-selector"
WALLPAPER_DIR="$HOME/.config/backgrounds/symlinks"
SOURCE_DIR="$HOME/.config/backgrounds"

mkdir -p "$CACHE_DIR"
mkdir -p "$WALLPAPER_DIR"

# Clear old thumbnails
rm -rf "$CACHE_DIR"/*
rm -rf "$WALLPAPER_DIR"/*

# Create symlinks for all wallpapers
find "$SOURCE_DIR"/ -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" \) -exec ln -sf {} "$WALLPAPER_DIR" \;
find "$SOURCE_DIR"/walls-catppuccin-mocha -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" \) -exec ln -sf {} "$WALLPAPER_DIR" \;


# Generate thumbnails in parallel
find "$WALLPAPER_DIR" -type l \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) \
  | parallel magick {} -thumbnail "${THUMBNAIL_WIDTH}x${THUMBNAIL_HEIGHT}^" \
                       -gravity center -extent "${THUMBNAIL_WIDTH}x${THUMBNAIL_HEIGHT}" \
                       "$CACHE_DIR"/'{/}.png'
