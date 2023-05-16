#!/bin/bash

# SOURCE: https://steamcommunity.com/sharedfiles/filedetails/?id=2615011323

FLATPAK_FLATHUB=(
	org.qgis.qgis/x86_64/stable
)

for app in ${FLATPAK_FLATHUB[@]}; do
	flatpak install -y flathub "$app"
done

# SAGA GIS

# GRASS GIS

# GEODA

# RStudio
