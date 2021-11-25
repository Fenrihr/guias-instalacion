# BolSuite 2.12 en Linux mediante Wine

[TOC]

------

## ¿Qué es BolSuite?

Bolsuite es un software que permite la integración de la Bolsa de Valores Argentina con DDE® (Excel®), Metastock® y otras herramientas del mercado.

También provee Web Services (Web API y server SignalR integrado) para desarrolladores lo cual permite extender su uso y simplificar el desarrollo de  nuevas aplicaciones.

Página oficial: https://www.facebook.com/groups/274656386254166

## Requisitos 

- wine (>=5)
- winetricks (>=20200412)
- BolSuite 2.12

## Instalación

### Configuración del entorno

- Desde la terminal creamos la carpeta de nuestro entorno virtual (*lugar por defecto de winetricks*)

```bash
mkdir ~/.local/share/wineprefixes/bolsuite
```

- Variables temporales para la instalación

```bash
export WINEPREFIX=~/.local/share/wineprefixes/bolsuite

# export WINEARCH=win64
export WINEARCH=win32
```

**NOTA:** utilizo una configuración para windows de 64 bits



### Instalación de dependencias

- corefonts => Fuentes por defecto de Windows (Arial, Times, etc.)
- Microsoft .NET Framework 4.5 => Requerido por BolSuite
- webio => MS Windows Web I/O
- winhttp  => MS Windows HTTP Services
- wininet  => MS Windows Internet API

```bash
winetricks -q corefonts dotnet452 vcrun2015 win7
```



#### Configurando wine

- Abrimos la configuración de Wine

```bash
winecfg
```

- Ir a "*Applications*" y Seleccionar "*Windows 7*"
- Ir a "*Librerías*" e ingresar `rasapi32` en "*New override for library*" y "Agregar"
- Aplicar los cambios y salir



### Instalación de BolSuite

- Copiamos el instalador al prefijo:

```bash
mkdir -p $WINEPREFIX/drive_c/BolSuite
mv ~/Descargas/Bolsuite.exe $WINEPREFIX/drive_c/BolSuite/
```

- Abrir el explorador de archivos de wine: 

```bash
wine explorer
```

- Navegamos a `Mi PC` / `C:` / `BolSuite` y ejecutamos el instalador.
- Seguimos los pasos de configuración y listo.
- Cerramos la aplicación, el explorador y la terminal



#### Lanzador en el escritorio

Para crear un lanzador para el programa, creamos un archivo de texto en el escritorio llamado `BolSuite.desktop` con el siguiente contenido:

```bash
#!/usr/bin/env xdg-open
[Desktop Entry]
Name=BolSuite
Exec=env WINEPREFIX="~/.local/share/wineprefixes/bolsuite" wine C:\\\\BolSuite\\\\BolSuite.exe 
Type=Application
StartupNotify=true
Comment=BolSuite 2.12
```

Lo guardamos  y ejecutamos haciendo doble clic ...... y ....... ***debería*** iniciarse BolSuite!!