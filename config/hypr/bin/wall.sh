#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/.config/hypr/assets/walls/"
CURRENT_WALL=$(hyprctl hyprpaper listloaded)

# Get a random wallpaper that is not the current one
WALLPAPER=$(find "$WALLPAPER_DIR" -type f ! -name "$(basename "$CURRENT_WALL")" | shuf -n 1)
LOCK_WALLPAPER=$(find "$WALLPAPER_DIR" -type f ! -name "$(basename "$CURRENT_WALL")" | shuf -n 1)

# Apply the selected wallpaper
hyprctl hyprpaper reload ,"$WALLPAPER"

sed -i "s|^\$wall_path = .*|\$wall_path = $LOCK_WALLPAPER|" ~/.config/hypr/hyprlock.conf

sed -i "s|^preload = .*|preload = $WALLPAPER|" ~/.config/hypr/hyprpaper.conf
sed -i "s|^wallpaper = .*|wallpaper = $WALLPAPER|" ~/.config/hypr/hyprpaper.conf