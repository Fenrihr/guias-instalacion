#!/bin/bash

echo -e "\e[1;32m\n[INFO] - Instalando Google Chrome OFICIAL.\n\e[0m"
sleep 5

sudo dnf config-manager --set-enabled google-chrome

sudo dnf install -y google-chrome-stable

# Actualizamos
sudo dnf update -y
