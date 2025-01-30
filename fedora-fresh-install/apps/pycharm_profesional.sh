#!/usr/bin/env bash

# Guía de instalación: https://www.jetbrains.com/help/pycharm/installation-guide.html#toolbox

echo -e "\e[1;32m\n[INFO] - Instalando PyCharm Profesional.\n\e[0m"
sleep 5

sudo dnf install -y snapd

sudo snap install -y pycharm-professional --classic

# Actualizamos
sudo dnf update -y

