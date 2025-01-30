#!/bin/bash

# Version
VERSION='1.19.25'
RELEASE='1.19.25-1'

echo -e "\e[1;32m\n[INFO] - Instalando Balena Etcher ${RELEASE} .\n\e[0m"
sleep 5

#curl -L -O https://github.com/balena-io/etcher/releases/download/v1.19.25/balena-etcher-1.19.25-1.x86_64.rpm
wget https://github.com/balena-io/etcher/releases/download/v${VERSION}/balena-etcher-${RELEASE}.x86_64.rpm

#sudo dnf -y install ./balena-etcher-1.19.25-1.x86_64.rpm
sudo dnf -y install ./balena-etcher-${RELEASE}.x86_64.rpm

# Limpiamos
rm balena-etcher-${RELEASE}.x86_64.rpm

# Actualizamos
sudo dnf update -y
