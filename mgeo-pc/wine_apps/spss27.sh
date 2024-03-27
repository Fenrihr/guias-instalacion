#!/usr/bin/env bash

APP_PREFIX=spss27
APP_FOLDER="$HOME/.local/share/wineprefixes/${APP_PREFIX}"
APP_ARCH="win64"
COMPATIBILITY_MODE="win10"

INSTALLER_PATH="IBM.SPSS.Statistics.v27.0.1.IF026.Multilingual.Incl.Crack-x64/SPSS_Statistics_Client_27.0.1_Win_64bit.exe"

CRACK_SOURCE="IBM.SPSS.Statistics.v27.0.1.IF026.Multilingual.Incl.Crack-x64/Crack"
#CRACK_DEST="C:\Program Files\IBM\SPSS\Statistics\27"
CRACK_DEST="${APP_FOLDER}/drive_c/Program Files/IBM/SPSS/Statistics/27"

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
winetricks --unattended gecko corefonts vcrun2013 vcrun2015 dotnet35sp1 dotnet452 dotnet462 dotnet472

echo "==> Run installer"
#wine "$INSTALLER_PATH"
WINEARCH="${WINEARCH}" WINEPREFIX="${WINEPREFIX}" wine explorer

echo "==> Copy the JRE"
jre="${CRACK_SOURCE}/JRE"
#wine cmd.exe /C "cp -rf '$jre' '$CRACK_DEST'"
#wine cmd.exe /C "robocopy '$jre' '$CRACK_DEST' /E /NFL /NDL /NJH /NJS /IS"
#wine cmd.exe /C "xcopy \"$jre" \"$CRACK_DEST" /E /I /Y"
cp -rf "${CRACK_SOURCE}/JRE" "${CRACK_DEST}"

echo "==> Copy the lservrc file"
#lservrc="${CRACK_SOURCE}/lservrc"
#wine cmd.exe /C "copy /Y '$lservrc' '$CRACK_DEST'"
cp -f "${CRACK_SOURCE}/lservrc" "${CRACK_DEST}"


#echo "==> Creando el acceso directo"
#desktop_file="$HOME/.local/share/applications/spss.desktop"
#
## Specify the necessary information
#version="1.0"
#name="SPSS Statistics 27"
#comment="IBM SPSS Statistics 27.0.1"
#exec_command="WINEARCH=\"${WINEARCH}\" WINEPREFIX=\"${WINEPREFIX}\" wine \"C:\Program Files\IBM\SPSS\Statistics\27\stats.exe\""
#icon_path="/path/to/icon.png"
#terminal="false"
#categories="Office;Education"
#
## Create the .desktop file
#echo "[Desktop Entry]" > "$desktop_file"
#echo "Version=$version" >> "$desktop_file"
#echo "Name=$name" >> "$desktop_file"
#echo "Comment=$comment" >> "$desktop_file"
#echo "Exec=$exec_command" >> "$desktop_file"
#echo "Icon=$icon_path" >> "$desktop_file"
#echo "Terminal=$terminal" >> "$desktop_file"
#echo "Type=Application" >> "$desktop_file"
#echo "StartupNotify=true"
#echo "Categories=$categories" >> "$desktop_file"
#echo "StartupWMClass=stats.exe"
#
#chmod +x "$desktop_file"
#
#echo "The .desktop file has been created: $desktop_file"
