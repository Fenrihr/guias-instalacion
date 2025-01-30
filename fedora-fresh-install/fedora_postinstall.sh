#!/usr/bin/bash

# based on https://github.com/Diolinux/Linux-Mint-19.x-PosInstall/blob/master/Linux%20Mint%2019.x%20posinstall%20Diolinux.sh

clear

# -------------------------------------------------------------------------------------------------
# Verificar se os programas estão instalados:

#which dpkg     1> /dev/null || exit 1
#which apt      1> /dev/null || exit 2
#which apt-key  1> /dev/null || exit 3
which wget     1> /dev/null || exit 4
which flatpak  1> /dev/null || exit 5
#which snap     1> /dev/null || exit 6
which ping     1> /dev/null || exit 7

# -------------------------------------------------------------------------------------------------
echo "
Verificando el acceso a internet"

ping -c 10 www.google.com.ar  1> /dev/null 2> /dev/null


if [ "$?" -eq "0" ];
then 
      echo -e "\e[1;32m\n[VERIFICADO] - Conexión a internet funcionando correctamente.\n\e[0m"
      sleep 30
else 
     echo -e "\e[1;31m\n[ERROR] - Su sistema no tiene conexión a internet. Verifique.\n\e[0m"
     exit
fi

# -------------------------------------------------------------------------------------------------
# Validando que no se esté ejecutando como root (sudo)
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

# -------------------------------------------------------------------------------------------------
echo -e "\e[1;32m\n[INFO] - Activando repositorios.\n\e[0m"
sleep 5

# Add repositories rpmfusion free e non-free
sudo dnf install -y \
    https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
    https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# add repositorio extras
sudo dnf copr enable refi64/webapp-manager

sudo dnf upgrade --refresh -y

# Enabling Appstream data from the RPM Fusion repositories
sudo dnf group upgrade -y core

sudo dnf install -y dnf-plugins-core

# -------------------------------------------------------------------------------------------------
echo -e "\e[1;32m\n[INFO] - Actualizando firmware.\n\e[0m"
sleep 5

#sudo fwupdmgr get-devices
sudo fwupdmgr refresh --force 
sudo fwupdmgr get-updates 
sudo fwupdmgr update

# -------------------------------------------------------------------------------------------------
echo -e "\e[1;32m\n[INFO] - Actualizando el sistema.\n\e[0m"
sleep 5

sudo dnf upgrade -y

# -------------------------------------------------------------------------------------------------
echo -e "\e[1;32m\n[INFO] - Instalando soporte multimedia.\n\e[0m"
sleep 5

sudo dnf install -y gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel

sudo dnf install -y lame\* --exclude=lame-devel

sudo dnf install -y libdvdcss 
 
sudo dnf group install -y multimedia

# OpenH264 is used for H.264/MPEG-4 media playback. 
# Adding this can enhance your web browsing experience. 
# Enable OpenH264 support in Firefox by adding the repo and installing the plugin.
sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1
sudo dnf install -y gstreamer1-plugin-openh264 mozilla-openh264

sudo dnf upgrade -y

# Referencias
# pop-shell => https://github.com/pop-os/shell
# menulibre => https://bluesabre.org/projects/menulibre
# buildah
# Solaar => Linux Device Manager for Logitech Unifying Receivers and Devices. https://pwr-solaar.github.io/Solaar/
# nextcloud-client

# -------------------------------------------------------------------------------------------------
echo -e "\e[1;32m\n[INFO] - Instalando fuentes mejoradas.\n\e[0m"
sleep 5

sudo dnf install -y fira-code-fonts 'mozilla-fira*' 'google-roboto*'

sudo dnf install -y curl cabextract xorg-x11-font-utils fontconfig

sudo rpm -i https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm

# -------------------------------------------------------------------------------------------------
echo -e "\e[1;32m\n[INFO] - Instalando aplicaciones.\n\e[0m"
sleep 5

# Add apps
APPS_ADD=(    
    gnome-tweaks
    wget
    openssl
    ca-certificates
    htop
    neofetch
    #virt-manager
    #zsh
    snapd
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
    vlc
    qt5-qtbase
    flameshot
    webapp-manager
    spice-vdagent
    # Gestor de contraseñas
    keepassxc
    unzip
    p7zip
    p7zip-plugins
    unrar 
)

sudo dnf install -y --skip-broken ${APPS_ADD[@]}

# -------------------------------------------------------------------------------------------------
echo -e "\e[1;32m\n[INFO] - Removiendo aplicaciones.\n\e[0m"
sleep 5

# ------------ 
# Remove apps (some of them will be replaced with the flatpak version)
APPS_REMOVE=(
    libreoffice*
    #gnome-extensions-app
    #gedit
    gnome-tour
    gnome-boxes
    gnome-calendar
    cheese
    #gnome-clocks
    gnome-contacts
    gnome-maps
    gnome-photos
    #totem
    gnome-weather
    gnome-characters
    #glade
    gnome-logs
    gnome-screenshot
    gnome-todo
    gnome-usage
    gnome-font-viewer
    baobab
    eog
    gnome-calculator
)    

sudo dnf remove -y ${APPS_REMOVE[@]}

# ======================================
# ------------ update system
sudo dnf upgrade -y

# PS: openssl is a dependency os the extension GSConnect

# ============================================================================
#  ------------ Flatpaks ------------
echo -e "\e[1;32m\n[INFO] - FLATPAKS.\n\e[0m"
sleep 5

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

rm eos-flatpak-keyring.gpg

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
    org.gnome.Boxes
    org.gnome.Calendar
    org.gnome.Cheese
    #org.gnome.clocks
    #org.gnome.Contacts
    org.gnome.Maps
    org.gnome.Photos
    #org.gnome.Totem
    #org.gnome.Weather
    org.gnome.Characters
    #org.gnome.Glade
    org.gnome.Logs
    #org.gnome.Screenshot
    #org.gnome.Todo
    #org.gnome.font-viewer
    # Disk Usage Analyzer
    org.gnome.baobab
    # Eye of GNOME Image Viewer
    org.gnome.eog
    org.gnome.Calculator
    #org.gnome.FileRoller
    ca.desrt.dconf-editor
    org.freefilesync.FreeFileSync
    #org.keepassxc.KeePassXC  # RMP
    com.calibre_ebook.calibre
    #org.freeplane.App
    #com.github.phase1geo.minder
    org.gimp.GIMP
    org.inkscape.Inkscape
    io.dbeaver.DBeaverCommunity
    #com.jetbrains.PyCharm-Professional  # SNAP
    org.telegram.desktop
    #org.chromium.Chromium
    de.haeckerfelix.Fragments
    org.kde.kdenlive
    com.gitlab.newsflash
    md.obsidian.Obsidian
    com.github.ahrm.sioyek
    com.jgraph.drawio.desktop
    org.jdownloader.JDownloader
    # Github Desktop
    io.github.shiftey.Desktop
    com.spotify.Client
    # Lista de tareas
    io.github.alainm23.planify
    # Seguimiento de inversiones
    info.portfolio_performance.PortfolioPerformance
    # Escritorios virtuales
    org.remmina.Remmina
    # Cliente de bittorrent
    org.qbittorrent.qBittorrent
    org.kde.kmymoney
    org.videolan.VLC
    org.mozilla.Thunderbird
)

for app in "${FLATPAK_FLATHUB[@]}"; do
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




# ============================================================================
echo -e "\e[1;32m\n[INFO] - Otras aplicaciones.\n\e[0m"
sleep 5

source ./apps/gis_software.sh
source ./apps/flatpak_libreoffice.sh
#source ./apps/flatpak_steam.sh
source ./apps/flatpak_obstudio.sh
#source ./apps/teamviewer.sh
#source ./apps/virtualbox.sh
source ./apps/yubikey_manager.sh
source ./apps/balena_etcher.sh
source ./apps/google_chrome.sh
source ./apps/pycharm_profesional.sh

# ==============================
# CONTENEDORES

#source ./apps/containers/podman.sh


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

#for folder in ${FOLDERS[@]}; do
#    find $folder -type f -exec /bin/sh -c "file {} | grep -q executable && chmod +x {}" \;
#done

# ======================================
# ------------ Miscelanious ------------


