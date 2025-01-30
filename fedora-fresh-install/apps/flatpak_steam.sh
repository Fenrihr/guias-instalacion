#!/bin/bash

echo -e "\e[1;32m\n[INFO] - Instalando Steam.\n\e[0m"
sleep 5

# SOURCE: https://steamcommunity.com/sharedfiles/filedetails/?id=2615011323

FLATPAK_FLATHUB=(
	com.valvesoftware.Steam
	com.valvesoftware.Steam.CompatibilityTool.Boxtron
	com.github.Matoking.protontricks
	com.valvesoftware.SteamLink
	org.freedesktop.Platform.VulkanLayer.MangoHud
	org.freedesktop.Platform.VulkanLayer.vkBasalt//22.08
	com.valvesoftware.Steam.Utility.gamescope
)

for app in ${FLATPAK_FLATHUB[@]}; do
	flatpak install -y flathub "$app"
done
