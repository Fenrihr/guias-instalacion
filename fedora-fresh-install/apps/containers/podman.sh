#!/bin/bash
# toolbox -- CONTENEDORES (https://containertoolbx.org/)

# install app
sudo dnf install -y --skip-broken podman toolbox

# create a fedora toolbox
toolbox create -y

#Inside a fedora toolbox
APPS_TOOLBOX=(
	"https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm"
	"https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"
	gramps
	megasync
)

for app in ${APPS_TOOLBOX[@]}; do
	toolbox run sudo dnf install -y "$app"
done

# make make a copy of the host themes in the toolbox
cp -r ~/.themes/* ~/.update_desktop_files/themes/
cp -r usr/share/themes/* ~/.update_desktop_files/themes/
toolbox run sudo cp -r ~/.update_desktop_files/themes/* /usr/share/themes
