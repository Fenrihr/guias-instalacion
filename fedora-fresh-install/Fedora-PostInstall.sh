#!/bin/bash

# based on https://github.com/Diolinux/Linux-Mint-19.x-PosInstall/blob/master/Linux%20Mint%2019.x%20posinstall%20Diolinux.sh

if [ $USER == "root" ]; 
    then 
        echo "current user: $USER
        please do not run this script as root user
        but with an user administrator account using sudo"
        exit
    else echo ""
fi

export WORK_DIR=$PWD

# Set dark theme
# gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'

# Add repositories rpmfusion free e non-free
sudo dnf install -y \
	https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
	https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Add apps
APPS_ADD=(	
	gnome-tweaks
	wget
	openssl
	ca-certificates
	htop
	neofetch
	#virt-manager
	zsh
    #snapd
	menulibre
	#buildah
	#pop-shell
	ffmpeg
	python3-gobject
	ffmpegthumbnailer
	fira-code-fonts
	jetbrains-mono-fonts-all
	nextcloud-client
	nextcloud-client-nautilus
	solaar
	qt5-qtbase
	flameshot
)

sudo dnf install -y --skip-broken ${APPS_ADD[@]}

# Referencias
# pop-shell => https://github.com/pop-os/shell
# menulibre => https://bluesabre.org/projects/menulibre
# buildah
# Solaar => Linux Device Manager for Logitech Unifying Receivers and Devices. https://pwr-solaar.github.io/Solaar/
# nextcloud-client


# ------------ 
# Remove apps (some of them will be replaced with the flatpak version)
APPS_REMOVE=(
	libreoffice*
	#gnome-extensions-app
	gedit
	#gnome-boxes
	#gnome-calendar
	cheese
	#gnome-clocks
	#gnome-contacts
	#gnome-maps
	#gnome-photos
	#totem
	#gnome-weather
	#gnome-characters
	#glade
	#gnome-logs
	#gnome-screenshot
	gnome-todo
	#gnome-usage
	#gnome-font-viewer
	baobab
	eog
	#gnome-calculator
)	

sudo dnf remove -y --skip-broken ${APPS_REMOVE[@]}

# ======================================
# ------------ update system
sudo dnf upgrade -y


# PS: openssl is a dependency os the extension GSConnect

# ======================================
#  ------------ Flatpaks ------------
#sudo mkdir -p /home/root_link/var/lib/flatpak
#sudo rm -rf /var/lib/flatpak/
#sudo ln -s /home/root_link/var/lib/flatpak /var/lib/flatpak


# Add remotes
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak remote-add --if-not-exists flathub-beta https://flathub.org/beta-repo/flathub-beta.flatpakrepo
sudo flatpak remote-add --if-not-exists gnome-nightly https://nightly.gnome.org/gnome-nightly.flatpakrepo
sudo flatpak remote-add --if-not-exists fedora oci+https://registry.fedoraproject.org

wget https://origin.ostree.endlessm.com/keys/eos-flatpak-keyring.gpg
sudo flatpak remote-add --gpg-import=eos-flatpak-keyring.gpg eos-apps https://ostree.endlessm.com/ostree/eos-apps
sudo flatpak remote-add --gpg-import=eos-flatpak-keyring.gpg eos-sdk https://ostree.endlessm.com/ostree/eos-sdk

# Remotes references
# Flathub: https://flatpak.org/setup/Fedora/
# Flathub Beta: https://flathub.org/beta-repo/flathub-beta.flatpakrepo
# Gnome Nightly: https://wiki.gnome.org/Apps/Nightly
# Endless: https://gist.github.com/mwleeds/17e2113c893b412409232ff43e2051f7

# --------------------
# --- install apps
# Flatseal - Manage Flatpak permissions
flatpak install -y flathub com.github.tchx84.Flatseal

# GNOME APPS
FLATPAK_FLATHUB=(
	org.gnome.gedit
	#org.gnome.Boxes
	#org.gnome.Calendar
    org.gnome.Cheese
	#org.gnome.clocks
	#org.gnome.Contacts
	#org.gnome.Maps
	#org.gnome.Photos
	#org.gnome.Totem
	#org.gnome.Weather
	#org.gnome.Characters
	#org.gnome.Glade
	#org.gnome.Logs
	#org.gnome.Screenshot
	#org.gnome.Todo
	#org.gnome.font-viewer
	# Disk Usage Analyzer
	org.gnome.baobab	
	# Eye of GNOME Image Viewer
	org.gnome.eog
	#org.gnome.Calculator
	#org.gnome.FileRoller
	ca.desrt.dconf-editor
	org.freefilesync.FreeFileSync
	org.keepassxc.KeePassXC
    com.calibre_ebook.calibre
    flathub org.freeplane.App
    #com.github.phase1geo.minder
    org.gimp.GIMP
    org.inkscape.Inkscape
    io.dbeaver.DBeaverCommunity
    com.jetbrains.PyCharm-Professional
    org.telegram.desktop
    org.chromium.Chromium
    de.haeckerfelix.Fragments
    org.kde.kdenlive
    com.gitlab.newsflash
    md.obsidian.Obsidian
    com.github.ahrm.sioyek
    com.jgraph.drawio.desktop
    org.jdownloader.JDownloader
    io.github.shiftey.Desktop
    com.spotify.Client
)

for app in ${FLATPAK_FLATHUB[@]}; do
	flatpak install -y flathub "$app"
done

# Software Referencias:
# FreeFileSync          => Visual folder comparison and synchronization
# Dconf Editor          => Direct editing of the dconf configuration database
# KDEnlive              => editor de video
# Fragments             => torrent
# Chromium              => Chromium Browser
# freeplane             => 
# newsflash             => Lector de RSS que se integra con Nextcloud
# Obsidian              => 
# Sioyek                => PDF viewer designed for reading research papers and technical books
# Draw.io               =>
# JDownloader           => Download management tool
# shiftey.Desktop       => Github Desktop (unofficial)

source flatpak_libreoffice.sh
source flatpak_steam.sh
source flatpak_obstudio.sh
source teamviewer.sh

# ==============================
# toolbox -- CONTENEDORES


# install app
#sudo dnf install -y --skip-broken podman toolbox

# create a fedora toolbox
#toolbox create -y

#Inside a fedora toolbox
#APPS_TOOLBOX=(
#	"https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm"
#	"https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"
#	gramps
#	megasync
#)

#for app in ${APPS_TOOLBOX[@]}; do
#	toolbox run sudo dnf install -y "$app"
#done

# make make a copy of the host themes in the toolbox
#cp -r ~/.themes/* ~/.update_desktop_files/themes/
#cp -r usr/share/themes/* ~/.update_desktop_files/themes/
#toolbox run sudo cp -r ~/.update_desktop_files/themes/* /usr/share/themes


# ======================================
# ------------ Permissions ------------
# add my user to libvirt group, so virt-manager doesn't prompt for password 
#sudo usermod -a -G libvirt $USER

# Gives execution permission to all scripts in specified folders and subfolders
FOLDERS=(
	~/.local/scripts
	~/.local/share/nautilus-python
	~/.local/share/nautilus
	~/.var/app/AppImages
)

for folder in ${FOLDERS[@]}; do
	find $folder -type f -exec /bin/sh -c "file {} | grep -q executable && chmod +x {}" \;
done

# ======================================
# ------------ Miscelanious ------------


