#!/bin/bash

SNAP_VERSION='9_0_0'
FILE="esa-snap_all_unix_${SNAP_VERSION}.sh"

# Descargar archivo ZIP de instalación
wget "https://download.esa.int/step/snap/9.0/installers/${FILE}"

# Descomprimir archivo ZIP
#unzip esa-snap_sentinel_unix_9_0.sh.zip

# Ejecutar instalador
sudo chmod +x "${FILE}"
./"${FILE}" -c

# Agregar variables de entorno
echo "export PATH=\$PATH:/usr/local/snap/bin/" >> ~/.bashrc
echo "export SNAP_VERSION=9.0" >> ~/.bashrc
echo "export SNAP_HOME=/usr/local/snap" >> ~/.bashrc

# shellcheck disable=SC1090
source ~/.bashrc
