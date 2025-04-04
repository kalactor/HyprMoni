#!/usr/bin/env bash
set -e

scrDir="$(dirname "$(realpath "$0")")"
source "${scrDir}/global_fun.sh"


if package_installed grub && [ -f /boot/grub/grub.cfg ]; then
    echo -e "${GREEN}GRUB detected ${NC}"

    if [ ! -f /etc/default/grub.moni ] && [ ! -f /boot/grub/grub.moni ]; then
        echo -e "${YELLOW}Beautifying GRUB${NC}"
        sudo cp /etc/default/grub /etc/default/grub.moni
        sudo cp /boot/grub/grub.cfg /boot/grub/grub.cfg.moni

        echo -e "Select grub theme:\n[1] Whitesur\n[2] Sleek Dark\n[3] Sleek Light"
        read -p "Enter option number <or> Press enter to skip grub theme : " grub_theme_input
        case $grub_theme_input in
            1) grub_theme="Whitesur";;
            2) grub_theme="Sleek_Dark" ;;
            3) grub_theme="Sleek_Light" ;;
            *) grub_theme="None" ;;
        esac

        if [ "${grub_theme}" == "None" ]; then
            echo -e "${YELLOW}Skipping grub theme${NC}"
            sudo sed -i "s/^GRUB_THEME=/#GRUB_THEME=/g" /etc/default/grub
        else
            echo -e "${YELLOW}Setting grub theme ${grub_theme}${NC}"
            sudo tar -xzf  ${scrDir}/sources/Grub_${grub_theme}.tar.gz -C /usr/share/grub/themes/
            sudo sed -i "/^GRUB_DEFAULT=/c\GRUB_DEFAULT=saved
            /^GRUB_THEME=/c\GRUB_THEME=\"/usr/share/grub/themes/${grub_theme}/theme.txt\"
            /^#GRUB_THEME=/c\GRUB_THEME=\"/usr/share/grub/themes/${grub_theme}/theme.txt\"
            /^#GRUB_SAVEDEFAULT=true/c\GRUB_SAVEDEFAULT=true" /etc/default/grub
        fi
        
        sudo grub-mkconfig -o /boot/grub/grub.cfg
    else
        echo -e "${YELLOW}Leaving... GRUB already configured...${NC}"
    fi
fi