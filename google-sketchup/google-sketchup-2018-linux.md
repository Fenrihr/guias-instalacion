# Instalación de Sketchup 2018
## Requisitos
- wine (>=5.5) + winetricks (>=20200412)
- Instalador de Google Sketchup 2018
- `Net Framework 4.5.2-KB2901907-x86-x64-AllOS-ENU`

## Creación del prefijo y variables temporales
```bash
mkdir -p ~/.local/share/wineprefixes/sketchup2018
export WINEPREFIX=~/.local/share/wineprefixes/sketchup2018
export WINEARCH=win64
```

## Instalación de dependencias
```bash
winetricks corefonts vcrun2013 vcrun2015
```

## Arranque de Wine
> https://wiki.winehq.org/Wineboot

```bash
wine wineboot
```

## Configuración del Entorno Wine
1. Ejecutar `winetricks`
2. Seleccionar el prefijo `sketchup`
3. Seleccionar `winecfg` y `OK`
   
    1. Ir a "_Applications_" y Seleccionar "_Windows 8.1_"
    2. Ir a "_Librerías_" -> "_New override for library_" y "Agregar"
        1. `riched20.dll`
        2. `mfc140u.dll`
    3. Aplicar los cambios y salir
    
## Instalación de Microsoft .NET Framework 4.5.2 y 4.7.2
1. mediante winetricks

```bash
winetricks dotnet452 dotnet472
```

2. desde el instalador oficial:
- Microsoft .NET Framework 4.5.2 ([Offline Installer](https://www.microsoft.com/en-us/download/details.aspx?id=42642))
- Microsoft .NET Framework 4.7.2 ([Offline Installer)](https://support.microsoft.com/en-us/topic/microsoft-net-framework-4-7-2-offline-installer-for-windows-05a72734-2127-a15d-50cf-daf56d5faec2#bkmk_includedfixes))

```bash
wine start /unix ~/Descargas/NDP452-KB2901907-x86-x64-AllOS-ENU.exe

wine start /unix ~/Descargas/ndp472-kb4054530-x86-x64-allos-enu.exe
```
## Instalación de Google Sketchup

1. Abrir el explorador de archivos de wine: `wine explorer`
2. Buscar el instalador e ejecutarlo como si se tratase de Windows

