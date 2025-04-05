#! /usr/bin/env bash

if ! command -v "os-prober" &> /dev/null; then
	sudo pacman -S --noconfirm --needed "os-prober"
fi

if [ -f /etc/default/grub ]; then
	sudo sed -i "/^#GRUB_DISABLE_OS_PROBER=false/c\GRUB_DISABLE_OS_PROBER=false" /etc/default/grub
fi

sudo grub-mkconfig -o /boot/grub/grub.cfg