#!/usr/bin/env bash

set -e

scrDir="$(dirname "$(realpath "$0")")"
source "${scrDir}/global_fun.sh"


echo "Installing pacman, yay, grub things..."

./pacman.sh && ./yay.sh && ./grub.sh || echo "\nsomething went wrong....           :("

echo "pacman, yay, grub was done successfully :)"

./install_packages.sh


if [ $? -eq 0 ]; then
	echo -e "${GREEN}Installation was successfull${NC}"
else
	echo -e "${RED}Something went wrong :(${NC}"
fi

# Set Dolphin as the default file explorer
xdg-mime default org.kde.dolphin.desktop inode/directory

echo -e "${YELLOW}Installing dual boot${NC}"

./dual_boot.sh

echo -e "${YELLOW}Installing qmeu...${NC}"

./qemu.sh