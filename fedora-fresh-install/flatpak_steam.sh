#!/bin/bash

# SOURCE: https://steamcommunity.com/sharedfiles/filedetails/?id=2615011323

FLATPAK_FLATHUB=(
	com.valvesoftware.Steam
	com.valvesoftware.Steam.CompatibilityTool.Boxtron
	com.valvesoftware.Steam.Utility.protontricks
	com.valvesoftware.SteamLink
	org.freedesktop.Platform.VulkanLayer.MangoHud
	org.freedesktop.Platform.VulkanLayer.vkBasalt
	com.valvesoftware.Steam.Utility.gamescope
)

for app in ${FLATPAK_FLATHUB[@]}; do
	flatpak install -y flathub "$app"
done
