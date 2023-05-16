#!/bin/bash

# Pedir el nuevo nombre de red
read -p "Ingrese el nuevo nombre de la red: " NEW_NAME

# Crear una copia de seguridad de los archivos de configuración
sudo cp /etc/hostname /etc/hostname.bak
sudo cp /etc/hosts /etc/hosts.bak

# Reemplazar el nombre de red en los archivos de configuración
sudo sed -i "s/$(cat /etc/hostname)/$NEW_NAME/g" /etc/hostname
sudo sed -i "s/$(cat /etc/hostname)/$NEW_NAME/g" /etc/hosts

# Mostrar el nuevo nombre de red
echo "El nuevo nombre de red es: $NEW_NAME"

# Preguntar al usuario si desea reiniciar el sistema
read -p "¿Desea reiniciar el sistema ahora? (s/n)" RESPONSE

# Si el usuario no responde en 30 segundos, reiniciar automáticamente
sleep 30
if [ -z "$RESPONSE" ]; then
  echo "No se recibió respuesta, reiniciando automáticamente..."
  sudo reboot
fi

# Si el usuario responde "s" o "S", reiniciar el sistema
if [ "$RESPONSE" = "s" ] || [ "$RESPONSE" = "S" ]; then
  echo "Reiniciando el sistema..."
  sudo reboot
else
  echo "No se reiniciará el sistema."
fi

