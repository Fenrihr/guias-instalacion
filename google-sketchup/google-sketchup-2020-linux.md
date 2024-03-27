# Instalación de Sketchup 2018
## Requisitos
- wine (>=5.5) + winetricks (>=20200412)
- Instalador de Google Sketchup 2020

## Creación del prefijo y variables temporales
```bash
mkdir -p ~/.local/share/wineprefixes/sketchup2020
export WINEPREFIX=~/.local/share/wineprefixes/sketchup2020
export WINEARCH=win64
```

## Setear Windows 10 como entorno
```bash
wine winecfg -v win81
```

## Instalación de dependencias
```bash
winetricks allfonts 
winetricks -q vcrun2019 
```

## Arranque de Wine
> https://wiki.winehq.org/Wineboot

```bash
wine wineboot
```

## Configuración del Entorno Wine
1. Ejecutar `winetricks`
2. Seleccionar el prefijo `sketchup2020`
3. Seleccionar `winecfg` y `OK`
   
    1. Ir a "_Applications_" y Seleccionar "_Windows 8.1_"
    2. Ir a "_Librerías_" -> "_New override for library_" y "Agregar"
        1. `riched20.dll`
        2. `mfc140u.dll`
    3. Aplicar los cambios y salir

```bash
winetricks mfc140
```
    
## Instalación de Microsoft .NET Framework 4.7.2
1. mediante winetricks

   - ejecutar:

```bash
winetricks -q dotnet472
```

  - restituir version de windows a Windows 8.1

```bash
wine winecfg -v win81
``` 

2. desde el instalador oficial:
- Microsoft .NET Framework 4.7.2 ([Offline Installer)](https://support.microsoft.com/en-us/topic/microsoft-net-framework-4-7-2-offline-installer-for-windows-05a72734-2127-a15d-50cf-daf56d5faec2#bkmk_includedfixes))

```bash
wine start /unix ~/Descargas/ndp472-kb4054530-x86-x64-allos-enu.exe
```
## Instalación de Google Sketchup

1. Abrir el explorador de archivos de wine: `wine explorer`
2. Buscar el instalador e ejecutarlo como si se tratase de Windows

