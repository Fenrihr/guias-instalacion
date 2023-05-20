#!/bin/bash

# SOURCE: https://steamcommunity.com/sharedfiles/filedetails/?id=2615011323

FLATPAK_FLATHUB=(
    org.qgis.qgis//lts
)

# QGIS `stable` => Ultima versión estable
# QGIS `lts` => Versión "Long Term Support" (soporte de largo término) 

for app in ${FLATPAK_FLATHUB[@]}; do
	flatpak install -y flathub "$app"
done

# SAGA GIS

# GRASS GIS

# GEODA

# RStudio
