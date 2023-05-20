#!/bin/bash

flatpak install -y flathub org.libreoffice.LibreOffice

# make avaliable libreoffice templates from Nautilus's new file menu
mkdir -p $HOME/Templates/0-Libreoffice/

ln -s \
/var/lib/flatpak/app/org.libreoffice.LibreOffice/current/active/files/libreoffice/share/template/common \
$HOME/Templates/0-Libreoffice/Templates

