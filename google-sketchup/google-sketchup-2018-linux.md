# Instalación de Sketchup 2018
## Requisitos
- wine (>=5.5) + winetricks (>=20200412)
- Instalador de Google Sketchup 2018
- `Net Framework 4.5.2-KB2901907-x86-x64-AllOS-ENU`

## Creación del prefijo y variables temporales
```bash
mkdir ~/.local/share/wineprefixes/sketchup
export WINEPREFIX=~/.local/share/wineprefixes/sketchup
export WINEARCH=win64
```

## Instalación de dependencias
```bash
winetricks corefonts vcrun2013 vcrun2015
```

## Arranque de Wine
>> https://wiki.winehq.org/Wineboot

```bash
wine wineboot
```

## Configuración del Entorno Wine
1. Ejecutar `winetricks`
2. Seleccionar el prefijo `sketchup`
3. Seleccionar `winecfg` y `OK`
    
    1. Ir a "_Applications_" y Seleccionar "_Windows 8.1_"
    2. Ir a "_Librerías_" e ingresar `mfc140u.dll` en "_New override for library_" y "Agregar"
    3. Aplicar los cambios y salir
    
## Instalación de Microsoft .NET Framework 4.5.2 (Offline Installer)
1. Descargar instalador desde [aquí](https://www.microsoft.com/en-us/download/details.aspx?id=42642)
2. Ejecutar
```bash
wine start /unix ~/Descargas/NDP452-KB2901907-x86-x64-AllOS-ENU.exe
```

## Instalación de Google Sketchup
1. Abrir el explorador de archivos de wine: `wine explorer`
2. Buscar el instalador e ejecutarlo como si se tratase de Windows
