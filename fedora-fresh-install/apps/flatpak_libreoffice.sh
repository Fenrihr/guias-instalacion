#!/bin/bash

echo -e "\e[1;32m\n[INFO] - Instalando LibreOffice.\n\e[0m"
sleep 5

flatpak install -y flathub org.libreoffice.LibreOffice

# make avaliable libreoffice templates from Nautilus's new file menu
mkdir -p $HOME/Templates/0-Libreoffice/

ln -s \
/var/lib/flatpak/app/org.libreoffice.LibreOffice/current/active/files/libreoffice/share/template/common \
$HOME/Templates/0-Libreoffice/Templates

# Actualizamos
sudo dnf update -y
