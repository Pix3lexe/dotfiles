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

# 2. Replace the @define-color flavor @[CURRENT_flavor]; in ~/.config/waybar/style.css and ~/.config/wofi/style.css
WAYBAR_CSS="$HOME/.config/waybar/style.css"
if [ -f "$WAYBAR_CSS" ]; then
    # Replace any existing flavor definition with the new one
    sed -i "s/@define-color flavor @\([a-zA-Z]*\);/@define-color flavor @$flavor;/g" "$WAYBAR_CSS"
fi

WOFI_CSS="$HOME/.config/wofi/style.css"
if [ -f "$WOFI_CSS" ]; then
    sed -i "s/@define-color flavor @\([a-zA-Z]*\);/@define-color flavor @$flavor;/g" "$WOFI_CSS"
fi

# 3. Replace $accent = $[CURRENT_flavor] in ~/.config/hypr/hyprlock.conf
HYPRLOCK_CONF="$HOME/.config/hypr/hyprlock.conf"
if [ -f "$HYPRLOCK_CONF" ]; then
    # Replace accent definition with the new flavor
    sed -i "s/\$accent = \$\([a-zA-Z]*\)/\$accent = \$$flavor/g" "$HYPRLOCK_CONF"
fi

# 4. Replace in ~/.config/hypr/hyprland.conf:
# a) env = GTK_THEME, catppuccin-mocha-[CURRENT_flavor]-standard+default
# b) col.active_border = $[CURRENT_flavor] $mauve 90deg
HYPRLAND_CONF="$HOME/.config/hypr/hyprland.conf"
if [ -f "$HYPRLAND_CONF" ]; then
    # Replace GTK_THEME
    sed -i "s/env = GTK_THEME, catppuccin-mocha-\([a-zA-Z]*\)-standard+default/env = GTK_THEME, catppuccin-mocha-$flavor-standard+default/g" "$HYPRLAND_CONF"

    # Replace active border color
    sed -i "s/col.active_border = \$\([a-zA-Z]*\) \$mauve 90deg/col.active_border = \$$flavor \$mauve 90deg/g" "$HYPRLAND_CONF"

    hyprctl reload

fi
