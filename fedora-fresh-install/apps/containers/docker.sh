#!/usr/bin/env bash

echo -e "\e[1;32m\n[INFO] - Instalando Docker.\n\e[0m"
sleep 5

# Guías:
# - https://idroot.us/install-docker-fedora-41/
# - https://idroot.us/install-docker-compose-fedora-41/

sudo dnf update -y

# Installing Required Packages
sudo dnf install -y dnf-plugins-core

# Adding the Docker Repository
# Fedora <= 40
#sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo

# For Fedora 41 or later (DNF 5)
sudo dnf config-manager addrepo --from-repofile=https://download.docker.com/linux/fedora/docker-ce.repo

# Refreshing the repository
sudo dnf update -y

# Verifying the Repository docker-ce
sudo dnf repolist | grep docker

# Installing Docker and Docker Compose
sudo dnf install -y docker-ce docker-ce-cli containerd.io

# Installing Docker Compose
sudo dnf install -y docker-compose docker-compose-plugin

# Post-installation Steps
sudo systemctl enable --now docker
sudo systemctl start docker

# Managing User Permissions
# Add user to docker group to run Docker commands without using `sudo`
sudo groupadd docker
sudo gpasswd -a $USER docker
newgrp docker