#!/bin/bash

if ! [ -f "teamviewer_amd64.deb" ] ; then
    wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
fi

sudo apt install -y ./teamviewer_amd64.deb
