#! /usr/bin/env bash

set -e  # Exit on error

scrDir="$(dirname "$(realpath "$0")")"

CONFIG_DIR="$HOME/.config"
ICON_DIR="$HOME/.icons"
THEME_DIR="$HOME/.themes"

# Ensure necessary directories exist
mkdir -p "$ICON_DIR" "$THEME_DIR" "$CONFIG_DIR"

# Extract icon themes
tar -xf "$scrDir/sources/01-McMojave-circle.tar.xz" -C "$ICON_DIR"
tar -xf "$scrDir/sources/01-WhiteSur.tar.xz" -C "$ICON_DIR"
tar -xf "$scrDir/sources/McMojave-cursors.tar.xz" -C "$ICON_DIR"

# Extract themes
tar -xf "$scrDir/sources/WhiteSur-Dark-solid.tar.xz" -C "$THEME_DIR"
tar -xf "$scrDir/sources/WhiteSur-Light-solid.tar.xz" -C "$THEME_DIR"

# Copy configuration files
cp -r "$scrDir/config/hypr" "$scrDir/config/kitty" "$scrDir/config/wlogout" "$CONFIG_DIR"