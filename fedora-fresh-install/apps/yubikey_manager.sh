#!/usr/bin/env bash

sudo dnf -y install pam_yubico pam-u2f yubikey-manager yubikey-manager-qt yubikey-personalization-gui gnome-screenshot pcsc-lite

TO_ADD=(
  pam_yubico
  pam-u2f
  yubikey-manager
  yubikey-manager-qt
  yubikey-personalization-gui
  gnome-screenshot
  pcsc-lite
)

for app in "${TO_ADD[@]}"; do
	sudo dnf -y install "$app"
done
