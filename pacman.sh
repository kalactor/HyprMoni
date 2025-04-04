#!/usr/bin/env bash

if [ -f /etc/pacman.conf ] && [ ! -f /etc/pacman.conf.moni ]; then
    echo -e "${YELLOW}Moding pacman to look better...${NC}"

    sudo cp /etc/pacman.conf /etc/pacman.conf.moni
    sudo sed -i "/^#Color/c\Color\nILoveCandy
    /^#VerbosePkgLists/c\VerbosePkgLists
    /^#ParallelDownloads/c\ParallelDownloads = 5" /etc/pacman.conf
    
    sudo pacman -Syyu
    sudo pacman -Fy
else
    echo -e "${YELLOW}Leaving... Pacman already configured...${NC}"
fi