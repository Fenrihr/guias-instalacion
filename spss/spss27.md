## Creación del prefijo y variables temporales
```bash
mkdir ~/.local/share/wineprefixes/spss27
export WINEPREFIX=~/.local/share/wineprefixes/spss27
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

2. Instalación de **Microsoft .NET Framework 4.7 ([Offline Installer)](https://www.microsoft.com/en-us/download/confirmation.aspx?id=55167))**

```bash
winetricks dotnet472
```

## Instalación de Google Sketchup

1. Abrir el explorador de archivos de wine: `wine explorer`
2. Buscar el instalador e ejecutarlo como si se tratase de Windows

