#!/bin/bash

# Version de Geoda a instalar
VERSION='1.20.0.36'
DEB='1.20.0'

UBUNTU_VERSION=$(grep -oP '(?<=VERSION_ID=")\d+\.\d+' /etc/os-release)
UBUNTU_CODENAME=$(grep -oP 'UBUNTU_CODENAME=\K.*' /etc/os-release)

# Ubuntu 18.04 (Bionic Beaver)
# Ubuntu 20.04 (Focal Fossa)
valid_codenames=("bionic" "focal")  # Set the valid codenames in this array

if [[ "${valid_codenames[*]}" =~ ${UBUNTU_CODENAME} ]]; then
  echo "Valid version detected."

  file="GeoDa-${VERSION}-${UBUNTU_CODENAME}.zip"
  deb_file="geoda_${DEB}-1${UBUNTU_CODENAME}1_amd64.deb"

  echo "instalando ${file}"

  wget "https://github.com/GeoDaCenter/geoda/releases/download/v${VERSION}/${file}"

  unzip "${file}"

  sudo apt install -y ./"${deb_file}"

else
    echo "This script is intended for Ubuntu 20.04 (Focal Fossa), Ubuntu 18.04 (Bionic Beaver)."
    exit
fi