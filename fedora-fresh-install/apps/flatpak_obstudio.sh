#!/bin/bash

# SOURCE: https://steamcommunity.com/sharedfiles/filedetails/?id=2615011323

FLATPAK_FLATHUB=(
	com.obsproject.Studio
	com.obsproject.Studio.Plugin.SceneSwitcher
)

for app in ${FLATPAK_FLATHUB[@]}; do
	flatpak install -y flathub "$app"
done
