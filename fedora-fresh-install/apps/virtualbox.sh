#!/usr/bin/env bash

echo -e "\e[1;32m\n[INFO] - Instalando Virtualbox.\n\e[0m"
sleep 5

sudo dnf -y install @development-tools

sudo dnf -y install kernel-headers kernel-devel dkms elfutils-libelf-devel qt5-qtx11extras dkms kernel-devel gcc bzip2 make curl perl binutils patch libgomp glibc-headers glibc-devel libxkbcommon libxcrypt-compat

# Descargar y almacenar la clave de Oracle para VirtualBox
#wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | rpm --import -
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc
sudo rpm --import oracle_vbox_2016.asc

sudo tee /etc/yum.repos.d/virtualbox.repo >/dev/null <<'EOF'
[virtualbox]
name=Fedora TEE $releasever - $basearch - VirtualBox
baseurl=http://download.virtualbox.org/virtualbox/rpm/fedora/$releasever/$basearch
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://www.virtualbox.org/download/oracle_vbox_2016.asc
EOF

# Instalar VirtualBox
#sudo dnf search virtualbox
sudo dnf install -y virtualbox virtualbox-guest-additions

# Anadir usuario al grupo vboxusers
newgrp vboxusers
sudo usermod -aG vboxusers $USER

# Firmar los modulos de kernel por `secure boot`
sudo dnf install -y mokutil

sudo mkdir -p /var/lib/shim-signed/mok
sudo openssl req -nodes -new -x509 -newkey rsa:2048 -outform DER -addext "extendedKeyUsage=codeSigning" -keyout /var/lib/shim-signed/mok/MOK.priv -out /var/lib/shim-signed/mok/MOK.der

# Importar la clave firmada en la MOK de ::: universalblue
sudo mokutil --import /var/lib/shim-signed/mok/MOK.der

sudo rcvboxdrv setup
# sudo /sbin/vboxconfig

echo -e "\e[1;32m\n[INFO] - El sistema se debe reiniciar.\n\e[0m"
exit 1

