#!/bin/bash

echo -e "\e[1;32m\n[INFO] - Instalando GIS.\n\e[0m"
sleep 5

# QGIS `stable` => Ultima versión estable
# QGIS `lts` => Versión "Long Term Support" (soporte de largo término)
flatpak install -y flathub  org.qgis.qgis//stable

# Instalando librerías de python para QGIS
flatpak run --devel --command=pip3 org.qgis.qgis install scipy --user
flatpak run --devel --command=pip3 org.qgis.qgis install numpy --user
flatpak run --devel --command=pip3 org.qgis.qgis install pandas --user
flatpak run --devel --command=pip3 org.qgis.qgis install geopandas --user

# SAGA GIS

# GRASS GIS

# GEODA

# RStudio

# Google Earth Pro
flatpak install -y com.google.EarthPro

# Actualizamos
sudo dnf update -y
