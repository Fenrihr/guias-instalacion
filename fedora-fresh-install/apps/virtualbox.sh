#!/usr/bin/env bash

sudo dnf -y install @development-tools

sudo dnf -y install kernel-headers kernel-devel dkms elfutils-libelf-devel qt5-qtx11extras dkms kernel-devel gcc bzip2 make curl
sudo dnf install -y gcc kernel-devel kernel-headers dkms make bzip2 perl libxcrypt-compat
#wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | rpm --import -

cat <<EOF | sudo tee /etc/yum.repos.d/virtualbox.repo
[virtualbox]
name=Fedora $releasever - $basearch - VirtualBox
baseurl=http://download.virtualbox.org/virtualbox/rpm/fedora/$releasever/$basearch
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://www.virtualbox.org/download/oracle_vbox_2016.asc
EOF

sudo dnf search virtualbox

sudo dnf install -y VirtualBox virtualbox-guest-additions

sudo usermod -aG vboxusers $USER

newgrp vboxusers

# Actualizamos
sudo dnf update