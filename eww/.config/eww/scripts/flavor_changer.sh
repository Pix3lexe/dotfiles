#!/bin/bash

VALID_flavors=("blue" "flamingo" "green" "lavender" "maroon" "mauve" "peach" "pink" "red" "rosewater" "sapphire" "sky" "teal" "yellow")
DEFAULT_flavor="mauve"
flavor=$DEFAULT_flavor

if [ $# -gt 0 ]; then
    ARG_flavor="${1#--}"
    if [[ " ${VALID_flavors[*]} " =~ " ${ARG_flavor} " ]]; then
        flavor=$ARG_flavor
    fi
fi

# 1. Replace the flavor in eww.scss and eww.yuck
EWW_SCSS="$HOME/.config/eww/eww.scss"
if [ -f "$EWW_SCSS" ]; then
    sed -i "s/^\$flavor: \$[a-zA-Z]*;/\$flavor: \$$flavor;/g" "$EWW_SCSS"
fi

EWW_YUCK="$HOME/.config/eww/eww.yuck"
if [ -f "$EWW_YUCK" ]; then
    sed -i "s/(defvar current_flavor \"[a-zA-Z0-9_]*\")/(defvar current_flavor \"$flavor\")/g" "$EWW_YUCK"
fi

# 2. wofi
WOFI_CSS="$HOME/.config/wofi/style.css"
if [ -f "$WOFI_CSS" ]; then
    sed -i "s/@define-color flavor @\([a-zA-Z]*\);/@define-color flavor @$flavor;/g" "$WOFI_CSS"
fi

# 3. Replace in ~/.config/hypr/hyprland.conf:
# a) env = GTK_THEME, catppuccin-mocha-[CURRENT_flavor]-standard+default
HYPRLAND_CONF="$HOME/.config/hypr/hyprland.conf"
if [ -f "$HYPRLAND_CONF" ]; then
    # Replace GTK_THEME
    sed -i "s/env = GTK_THEME, catppuccin-mocha-\([a-zA-Z]*\)-standard+default/env = GTK_THEME, catppuccin-mocha-$flavor-standard+default/g" "$HYPRLAND_CONF"

    hyprctl reload

fi
