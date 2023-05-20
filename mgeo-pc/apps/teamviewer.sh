#!/bin/bash

if ! [ -f "teamviewer_amd64.deb" ] ; then
    wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
fi

echo "== Instalando Teamviewer"
sudo apt install ./teamviewer_amd64.deb
