#!/bin/bash
echo -e "\e[1;32m\n[INFO] - Instalando TeamViewer.\n\e[0m"
sleep 5

if ! [ -f "teamviewer.x86_64.rpm" ] ; then
    wget https://download.teamviewer.com/download/linux/teamviewer.x86_64.rpm
fi

sudo dnf -y install ./teamviewer.x86_64.rpm

# Limpiamos
rm teamviewer.x86_64.rpm

# Actualizamos
sudo dnf update -y
