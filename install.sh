#!/usr/bin/env bash

set -e

scrDir="$(dirname "$(realpath "$0")")"
source "${scrDir}/global_fun.sh"

echo -e "${YELLOW}Installing yay and beautifying pacman...${NC}"
if ./pacman.sh && ./yay.sh; then
    echo -e "${GREEN}Pacman and yay installed successfully :)${NC}"
else
    echo -e "${RED}\nSomething went wrong....           :(${NC}"
    exit 1
fi

echo -e "${YELLOW}Configuring GRUB...${NC}"
if ./grub.sh; then
    echo -e "${GREEN}GRUB setup completed successfully!${NC}"
else
    echo -e "${RED}\nFailed to configure GRUB. Exiting...${NC}"
    exit 1
fi

echo -e "${YELLOW}Installing additional packages...${NC}"
if ./install_packages.sh; then
    echo -e "${GREEN}Package installation was successful${NC}"
else
    echo -e "${RED}Something went wrong :(${NC}"
    exit 1
fi

# Set Dolphin as the default file explorer
echo -e "${YELLOW}Setting Dolphin as the default file manager...${NC}"
xdg-mime default org.kde.dolphin.desktop inode/directory

echo -e "${YELLOW}Applying system configurations...${NC}"
./system_ctl.sh
./sddm_theme.sh

echo -e "${YELLOW}Setting up dual boot...${NC}"
if ./dual_boot.sh; then
    echo -e "${GREEN}Dual boot configuration successful!${NC}"
else
    echo -e "${RED}Dual boot setup encountered an issue.${NC}"
fi

echo -e "${YELLOW}Installing QEMU...${NC}"
if ./qemu.sh; then
    echo -e "${GREEN}QEMU installed successfully!${NC}"
else
    echo -e "${RED}QEMU installation encountered an issue.${NC}"
fi

echo -e "${GREEN}All installations and configurations completed successfully!${NC}"