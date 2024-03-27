#!/usr/bin/env bash

APP_PREFIX=idrisi18
APP_FOLDER="$HOME/.local/share/wineprefixes/${APP_PREFIX}"
APP_ARCH="win64"
COMPATIBILITY_MODE="win10"

ZIP_FILE="Clark Labs TerrSet v18.31 - Full.rar"

INSTALLER_PATH="IDRISI/${APP_PREFIX}/Setup.exe"

CRACK_SOURCE="IBM.SPSS.Statistics.v27.0.1.IF026.Multilingual.Incl.Crack-x64/Crack"
#CRACK_DEST="C:\Program Files\IBM\SPSS\Statistics\27"
CRACK_DEST="${APP_FOLDER}/drive_c/Program Files (x86)/TerrSet"

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
if ! [ -f "${ZIP_FILE}" ] ; then
    mkdir -p "${APP_PREFIX}"
    unrar x "${ZIP_FILE}" "${APP_PREFIX}"
fi
#wine "$INSTALLER_PATH"
WINEARCH="${WINEARCH}" WINEPREFIX="${WINEPREFIX}" wine explorer

