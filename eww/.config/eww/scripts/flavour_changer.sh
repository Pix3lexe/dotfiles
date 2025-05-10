#!/bin/bash

VALID_FLAVOURS=("mauve" "lavender" "flamingo" "teal" "pink" "sky" "maroon")
DEFAULT_FLAVOUR="mauve"
FLAVOUR=$DEFAULT_FLAVOUR

if [ $# -gt 0 ]; then
    ARG_FLAVOUR="${1#--}"
    if [[ " ${VALID_FLAVOURS[*]} " =~ " ${ARG_FLAVOUR} " ]]; then
        FLAVOUR=$ARG_FLAVOUR
    fi
fi

# 2. Replace the @define-color flavour @[CURRENT_FLAVOUR]; in ~/.config/waybar/style.css and ~/.config/wofi/style.css
WAYBAR_CSS="$HOME/.config/waybar/style.css"
if [ -f "$WAYBAR_CSS" ]; then
    # Replace any existing flavour definition with the new one
    sed -i "s/@define-color flavour @\([a-zA-Z]*\);/@define-color flavour @$FLAVOUR;/g" "$WAYBAR_CSS"
fi

WOFI_CSS="$HOME/.config/wofi/style.css"
if [ -f "$WAYBAR_CSS" ]; then
    sed -i "s/@define-color flavour @\([a-zA-Z]*\);/@define-color flavour @$FLAVOUR;/g" "$WOFI_CSS"
fi

# 3. Replace $accent = $[CURRENT_FLAVOUR] in ~/.config/hypr/hyprlock.conf
HYPRLOCK_CONF="$HOME/.config/hypr/hyprlock.conf"
if [ -f "$HYPRLOCK_CONF" ]; then
    # Replace accent definition with the new flavour
    sed -i "s/\$accent = \$\([a-zA-Z]*\)/\$accent = \$$FLAVOUR/g" "$HYPRLOCK_CONF"
fi

# 4. Replace in ~/.config/hypr/hyprland.conf:
# a) env = GTK_THEME, catppuccin-mocha-[CURRENT_FLAVOUR]-standard+default
# b) col.active_border = $[CURRENT_FLAVOUR] $mauve 90deg
HYPRLAND_CONF="$HOME/.config/hypr/hyprland.conf"
if [ -f "$HYPRLAND_CONF" ]; then
    # Replace GTK_THEME
    sed -i "s/env = GTK_THEME, catppuccin-mocha-\([a-zA-Z]*\)-standard+default/env = GTK_THEME, catppuccin-mocha-$FLAVOUR-standard+default/g" "$HYPRLAND_CONF"

    # Replace active border color
    sed -i "s/col.active_border = \$\([a-zA-Z]*\) \$mauve 90deg/col.active_border = \$$FLAVOUR \$mauve 90deg/g" "$HYPRLAND_CONF"

fi
