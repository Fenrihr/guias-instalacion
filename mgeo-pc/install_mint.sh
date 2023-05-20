#!/bin/bash

# based on https://github.com/Diolinux/Linux-Mint-19.x-PosInstall/blob/master/Linux%20Mint%2019.x%20posinstall%20Diolinux.sh

if [ "$USER" = "root" ];
    then 
        echo "current user: $USER
        please do not run this script as root user
        but with an user administrator account using sudo"
        exit
    else echo ""
fi

# ===============================================================
#                      LIBRERÍAS Y APLICACIONES
# ===============================================================
sudo add-apt-repository ppa:ubuntugis/ubuntugis-unstable
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4EB27DB2A3B88B8B

sudo apt-key export 7FAC5991 | sudo gpg --dearmour -o /etc/apt/trusted.gpg.d/google_inc.gpg
sudo apt-key --keyring /etc/apt/trusted.gpg del 7FAC5991

sudo apt-key export D38B4796 | sudo gpg --dearmour -o /etc/apt/trusted.gpg.d/google_inc2.gpg
sudo apt-key --keyring /etc/apt/trusted.gpg del D38B4796

sudo apt update

# ------------ 
# Remove apps (some of them will be replaced with the flatpak version)
sudo apt remove -y \
	libreoffice* \
	vlc \
    thunderbird

# -----------------------
# Add apps
sudo apt install -y \
    mint-meta-codecs \
    build-essential \
    cmake \
    linux-headers-$(uname -r) \
    dkms \
    gcc \
    flatpak \
    remmina \
    p7zip-full \
    google-earth-pro-stable \
    gnupg \
    software-properties-common \
    git \
    subversion


# ===============================================================
#                   ACTUALIZACIÓN DEL SISTEMA
# ===============================================================
sudo apt update && sudo apt upgrade -y


# ===============================================================
#                           FLATPAK
# ===============================================================
# Add remotes
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
#sudo flatpak remote-add --if-not-exists flathub-beta https://flathub.org/beta-repo/flathub-beta.flatpakrepo
#sudo flatpak remote-add --if-not-exists gnome-nightly https://nightly.gnome.org/gnome-nightly.flatpakrepo
#sudo flatpak remote-add --if-not-exists fedora oci+https://registry.fedoraproject.org

#wget https://origin.ostree.endlessm.com/keys/eos-flatpak-keyring.gpg
#sudo flatpak remote-add --gpg-import=eos-flatpak-keyring.gpg eos-apps https://ostree.endlessm.com/ostree/eos-apps
#sudo flatpak remote-add --gpg-import=eos-flatpak-keyring.gpg eos-sdk https://ostree.endlessm.com/ostree/eos-sdk

# Remotes references
# Flathub: https://flatpak.org/setup/Fedora/
# Flathub Beta: https://flathub.org/beta-repo/flathub-beta.flatpakrepo
# Gnome Nightly: https://wiki.gnome.org/Apps/Nightly
# Endless: https://gist.github.com/mwleeds/17e2113c893b412409232ff43e2051f7

# -----------------
# Aplicaciones Flatpak

# Flatseal - Manage Flatpak permissions
flatpak install -y flathub com.github.tchx84.Flatseal

FLATPAK_FLATHUB=(
	#org.gnome.gedit
	org.geany.Geany
	org.gnome.Boxes
	com.usebottles.bottles
	org.freefilesync.FreeFileSync
	ca.desrt.dconf-editor
#	org.libreoffice.LibreOffice
#	org.freeplane.App
	org.gimp.GIMP
	org.inkscape.Inkscape
	org.flameshot.Flameshot
	org.videolan.VLC
)

# shellcheck disable=SC2068
for app in ${FLATPAK_FLATHUB[@]}; do
	flatpak install -y flathub "$app"
done

# Libreoffice
source apps/libreoffice.sh

# QGIS - Stable
#flatpak install -y flathub org.qgis.qgis/x86_64/stable

# QGIS - Long Term Support
flatpak install -y flathub org.qgis.qgis//lts

# GRASS GIS
sudo apt install -y grass

# SAGA GIS
sudo apt install -y saga

# Geoda GIS
source apps/geoda.sh

# Sentinel Application Platform (SNAP)
source apps/esa_snap.sh

# TeamViwer
source apps/teamviewer.sh

# ======= PERMISOS =======
flatpak override com.usebottles.bottles --user --filesystem=xdg-data/applications
flatpak override com.usebottles.bottles --user --filesystem=home
flatpak override org.qgis.qgis --user --filesystem=home

# ==============================================
# LIMPIAMOS
# ==============================================
sudo apt update && apt --fix-broken install #to add potential missing dependencies

sudo apt autoremove

echo "-- Script finalizado --"
echo "Recordamos instalar IDRISI y otros manualmente"

