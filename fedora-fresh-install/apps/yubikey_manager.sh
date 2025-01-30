#!/usr/bin/env bash

echo -e "\e[1;32m\n[INFO] - Instalando Yubikey.\n\e[0m"
sleep 5

#sudo dnf -y install pam_yubico pam-u2f yubikey-manager yubikey-manager-qt yubikey-personalization-gui pcsc-lite

TO_ADD=(
  pam_yubico
  pam-u2f
  yubikey-manager
  yubikey-manager-qt
  yubikey-personalization-gui
  pcsc-lite
)

for app in "${TO_ADD[@]}"; do
	sudo dnf -y install "$app"
done

# Actualizamos
sudo dnf update -y
