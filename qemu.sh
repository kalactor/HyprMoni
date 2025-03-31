#! /usr/bin/env bash

sudo pacman -Syu --noconfirm

if ! command -v "yay" &> /dev/null; then
	echo "yay is not installled, \n Installing yay..."
	./yay.sh
else
	echo "yay is already installed :)"
fi

sudo pacman -S --needed --noconfirm qemu-full qemu-img libvirt virt-install virt-manager virt-viewer edk2-ovmf swtpm guestfs-tools libosinfo dnsmasq

yay -S tuned --needed --noconfirm

sudo systemctl enable libvirtd.service
sudo systemctl start libvirtd.service

sudo systemctl enable --now tuned
sudo tuned-adm profile virtual-host

echo
echo
echo "Please run following command after reboot"
echo
echo "sudo virsh net-start default"
echo "sudo virsh net-autostart default"