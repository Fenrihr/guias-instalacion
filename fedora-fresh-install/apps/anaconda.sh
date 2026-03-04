#!/bin/bash

VERSION="latest"
EXPECTED_HASH="4766d85b5f7d235ce250e998ebb5a8a8210cbd4f2b0fea4d2177b3ed9ea87884"
#VERSION="py312_25.1.1-2"
#EXPECTED_HASH="4766d85b5f7d235ce250e998ebb5a8a8210cbd4f2b0fea4d2177b3ed9ea87884"

clear
echo -e "\e[1;32m\n[INFO] - Instalando Anaconda Python.\n\e[0m"
sleep 5

# Descargar el instalador de Miniconda
wget "https://repo.anaconda.com/miniconda/Miniconda3-$VERSION-Linux-x86_64.sh" -O Miniconda3.sh

# Calcular el SHA-256 del archivo descargado
DOWNLOADED_HASH=$(sha256sum Miniconda3.sh | awk '{print $1}')

# Comparar los hashes
if [ "$DOWNLOADED_HASH" == "$EXPECTED_HASH" ]; then
    echo "[OK] La verificación fue exitosa. El archivo es válido."
else
    echo "[ERR] Advertencia: Los hashes no coinciden. Puede que el archivo esté corrupto o haya sido modificado."
    echo "Verifique en https://repo.anaconda.com/miniconda/"
    exit 1
fi

# Ejecutar el instalador
sudo chmod +x Miniconda3.sh
bash Miniconda3.sh

# Limpiamos
rm Miniconda3.sh

# Actualizamos el entorno
source ~/.bashrc

# Desactivar la activación automática
conda config --set auto_activate_base false