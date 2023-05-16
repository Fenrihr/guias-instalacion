#!/bin/bash

# Actualizar el sistema
sudo pacman -Syu

sudo pacman -S base-devel cmake yay linux-headers dkms

# Installing Codecs and plugins
sudo pacman -S a52dec faac faad2 flac jasper lame libdca libdv libmad libmpeg2 libtheora libvorbis libxv wavpack x264 xvidcore gstreamer0.10-plugins

# Instalar Grass GIS
yay -S grass

# Instalar SAGA GIS
yay -S saga-gis

# Instalar Orfeo Toolbox y Monteverdi
yay -S orfeo-toolbox monteverdi

# Instalar QGIS
sudo pacman -S qgis 

# Instalar VirtualBox
sudo pacman -S virtualbox virtualbox-host-dkms virtualbox-guest-iso virtualbox-ext-oracle

# Agregar usuario al grupo vboxusers
sudo usermod -aG vboxusers $(whoami)

# Instalar Chromium
sudo pacman -S chromium

# Instalar Foxit Reader
yay -S foxitreader

# Instalar Adobe Acrobat Reader
yay -S acroread

# Instalar RStudio
sudo pacman -S rstudio

# Instalar Calibre
sudo pacman -S calibre

# Instalar Google Earth
yay -S google-earth-pro

# Instalar GIMP
sudo pacman -S gimp

# Instalar Inkscape
sudo pacman -S inkscape

echo "Instalación completa."
