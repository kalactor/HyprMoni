#!/usr/bin/env bash

set -e

scrDir="$(dirname "$(realpath "$0")")"
source "${scrDir}/global_fun.sh"

# Define the SDDM theme directory
SDDM_THEME_DIR="/usr/share/sddm/themes"

THEME_NAME="sddm-flower-theme"

if ! command -v sddm &> /dev/null; then
    echo -e "${RED}SDDM not found :(${NC}"
    exit 1
fi

# Check if the theme exists
if [ ! -d "$SDDM_THEME_DIR/$THEME_NAME" ]; then
    sudo tar -xzf ${scrDir}/sources/sddm-flower-theme.tar.gz -C /usr/share/sddm/themes/
    sudo sed -i "s|^Current=.*|Current=$THEME_NAME|" /usr/lib/sddm/sddm.conf.d/default.conf
else
    sudo sed -i "s|^Current=.*|Current=$THEME_NAME|" /usr/lib/sddm/sddm.conf.d/default.conf
fi