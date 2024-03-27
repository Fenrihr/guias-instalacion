#!/usr/bin/env bash

APP_PREFIX=idrisi17
APP_FOLDER="$HOME/.local/share/wineprefixes/${APP_PREFIX}"
APP_ARCH="win32"
COMPATIBILITY_MODE="win7"

ZIP_FILE="IDRISI Selva 17.00.rar"
INSTALLER_PATH="IDRISI/IDRISI Selva 17.00/Setup.exe"

CRACK_SOURCE="IDRISI/IDRISI Selva 17.00/Crack"
#CRACK_DEST="C:\Program Files\IBM\SPSS\Statistics\27"
CRACK_DEST="${APP_FOLDER}/drive_c/Program Files/Idrisi Selva"

if [ "$USER" = "root" ];
    then
        echo "current user: $USER
        please do not run this script as root user"
        exit
    else echo ""
fi

# Check if wine and winetricks are installed
if dpkg -s wine winetricks >/dev/null 2>&1; then
    echo "==> wine and winetricks are installed!"
else
    echo "Installing wine and winetricks..."
    sudo apt update
    sudo apt install -y wine winetricks
fi


if [ ! -d "$APP_FOLDER" ]; then
    mkdir -p "$APP_FOLDER"
    echo "Created folder: $APP_FOLDER"
else
    echo "Folder already exists: $APP_FOLDER"
fi

export WINEPREFIX="${APP_FOLDER}"
export WINEARCH="${APP_ARCH}"

echo "==> Configure Wine prefix to use ${COMPATIBILITY_MODE}"
WINEARCH="${WINEARCH}" WINEPREFIX="${WINEPREFIX}" wine wineboot
WINEARCH="${WINEARCH}" WINEPREFIX="${WINEPREFIX}" winecfg

#echo "==> Set Windows version to ${COMPATIBILITY_MODE}"
#sed -i 's/^"Windows"=".*"$/ "Windows"="'${COMPATIBILITY_MODE}'"/' "$WINEPREFIX/user.reg"

echo "==> Install components in silent mode using winetricks"
winetricks --unattended corefonts vcrun2013 vcrun2015 dotnet35sp1 dotnet452 dotnet462 dotnet472

echo "==> Run installer"

if [ ! -d "$APP_PREFIX" ]; then
  mkdir -p "${APP_PREFIX}"
  unrar x "${ZIP_FILE}" "${APP_PREFIX}"
else
  echo "Folder already exists: $APP_PREFIX"
fi

#wine "$INSTALLER_PATH"
WINEARCH="${WINEARCH}" WINEPREFIX="${WINEPREFIX}" wine explorer

echo "==> Aplicando CRACK"
cp -rf "${CRACK_SOURCE}/idrisi32.exe" "${CRACK_DEST}"






#echo "==> Creando el acceso directo"
#desktop_file="$HOME/.local/share/applications/spss.desktop"
#
# Specify the necessary information
#version="1.0"
#name="IDRISI TerrSet"
#comment="IDRISI TerrSet 18.31"
#exec_command="WINEARCH=\"${WINEARCH}\" WINEPREFIX=\"${WINEPREFIX}\" wine \"C:\Program Files\Idrisi TerrSet\terrset.exe\""
#icon_path="/path/to/icon.png"
#terminal="false"
#categories="Education"
#
## Create the .desktop file
#echo "[Desktop Entry]" > "$desktop_file"
#echo "Version=$version" >> "$desktop_file"
#echo "Name=$name" >> "$desktop_file"
#echo "Comment=$comment" >> "$desktop_file"
#echo "Exec=$exec_command" >> "$desktop_file"
##echo "Icon=$icon_path" >> "$desktop_file"
#echo "Terminal=$terminal" >> "$desktop_file"
#echo "Type=Application" >> "$desktop_file"
#echo "StartupNotify=true"
#echo "Categories=$categories" >> "$desktop_file"
#echo "StartupWMClass=stats.exe"
#
#chmod +x "$desktop_file"
#
#echo "The .desktop file has been created: $desktop_file"
