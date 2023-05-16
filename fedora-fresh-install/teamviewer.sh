#!/bin/bash

if ! [ -f "teamviewer.x86_64.rpm" ] ; then
    wget https://download.teamviewer.com/download/linux/teamviewer.x86_64.rpm
fi
sudo dnf -y install ./teamviewer.x86_64.rpm
