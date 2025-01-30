#!/bin/bash

echo -e "\e[1;32m\n[INFO] - Instalando OBS Studio.\n\e[0m"
sleep 5

# SOURCE: https://steamcommunity.com/sharedfiles/filedetails/?id=2615011323

FLATPAK_FLATHUB=(
	com.obsproject.Studio
	com.obsproject.Studio.Plugin.SceneSwitcher
)

for app in ${FLATPAK_FLATHUB[@]}; do
	flatpak install -y flathub "$app"
done


# Actualizamos
sudo dnf update -y
