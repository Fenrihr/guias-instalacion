## Creación del prefijo y variables temporales
```bash
mkdir ~/.local/share/wineprefixes/spss27
export WINEPREFIX=~/.local/share/wineprefixes/spss27
export WINEARCH=win64
```

bottles
```bash
export WINEPREFIX=~/Apps/bottles/SPSS
export WINEARCH=win64
```

## Instalación de dependencias
```bash
winetricks corefonts vcrun2013 vcrun2015
`````

## Arranque de Wine
> https://wiki.winehq.org/Wineboot

```bash
wine wineboot
```

## Configuración del Entorno Wine
1. Ejecutar `winetricks`
2. Seleccionar el prefijo `spss27`
3. Seleccionar `winecfg` y `OK`
   
    1. Ir a "_Applications_" y Seleccionar "_Windows 10_"

2. Instalación de **Microsoft .NET Framework 4.7 ([Offline Installer)](https://www.microsoft.com/en-us/download/confirmation.aspx?id=55167))**

```bash
winetricks dotnet35sp1 dotnet472
```

## Instalación de Google Sketchup

1. Abrir el explorador de archivos de wine: `wine explorer`
2. Buscar el instalador e ejecutarlo como si se tratase de Windows

### Crakeando
1. Ejecutar `winetricks`
2. Seleccionar el prefijo `spss27` -> `browse files`
3. De la carpeta "Crack", copiar y reemplazar:
   - la carpeta `JRE` en el directorio "C:\Program Files\IBM\SPSS\Statistics\27". 
   - el archivo `lservrc` en el directorio "C:\Program Files\IBM\SPSS\Statistics\27".

