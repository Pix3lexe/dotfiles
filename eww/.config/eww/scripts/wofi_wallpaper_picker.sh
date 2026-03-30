#!/usr/bin/env bash
# Configuration
WALLPAPER_DIR="$HOME/.config/backgrounds/symlinks"
CACHE_DIR="$HOME/.cache/wallpaper-selector"
WALLPAPER_SCRIPT="$HOME/.config/eww/scripts/change_wallpaper.sh"
THUMBNAIL_GENERATOR_SCRIPT="$HOME/.config/eww/scripts/thumbnail_generator.sh"
THUMBNAIL_WIDTH="250"  # Size of thumbnails in pixels (16:9)
THUMBNAIL_HEIGHT="141"
# Create cache directory if it doesn't exist
if [[ ! -d "$CACHE_DIR" ]]; then
    $THUMBNAIL_GENERATOR_SCRIPT
fi

# Function to generate thumbnail
generate_thumbnail() {
    local input="$1"
    local output="$2"
    magick "$input" -thumbnail "${THUMBNAIL_WIDTH}x${THUMBNAIL_HEIGHT}^" -gravity center -extent "${THUMBNAIL_WIDTH}x${THUMBNAIL_HEIGHT}" "$output"
}


# Generate thumbnails and create menu items
generate_menu() {
    # Then add all wallpapers
    for img in "$WALLPAPER_DIR"/*.{jpg,jpeg,png}; do
        # Skip if no matches found
        [[ -f "$img" ]] || continue

        # Generate thumbnail filename
        thumbnail="$CACHE_DIR/$(basename "$img").png"

        # Generate thumbnail if it doesn't exist or is older than source
        if [[ ! -f "$thumbnail" ]] || [[ "$img" -nt "$thumbnail" ]]; then
            generate_thumbnail "$img" "$thumbnail"
        fi

        echo -en "img:$thumbnail\x00info:$img\n"
    done
}

selected=$(generate_menu | wofi --show dmenu \
    --cache-file /dev/null \
    --conf ~/.config/wofi/wallpaper.conf \
    --style ~/.config/wofi/wallpaper.css \
)

# Set wallpaper if one was selected
if [ -n "$selected" ]; then
    info_string="${selected#*info:}"
    filename=$(basename "$info_string")
    filename="${filename%.png}" # remove .png
    original_path=$(find "$WALLPAPER_DIR" -type l -name "${filename}" | head -n1)
    if [ -n "$original_path" ]; then
        $WALLPAPER_SCRIPT $original_path
    fi
fi
