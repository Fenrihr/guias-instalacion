[TOC]



# Configuraciones



## Pamac

## AUR

## Flatpak

Agregar repositorio de Elementary OS

```bash
flatpak remote-add --if-not-exists --system elementary https://flatpak.elementary.io/repo.flatpakrepo
```



# A instalar

Del video => [Amazing elementary apps you can install on other linux distributions](https://www.youtube.com/watch?v=pyg615mdZeQ)

## Ordne

It's a simple pomodoro timer that you can use to apply that working method. 

```bash
yay -S ordne
```

## Resizer

Next is resizer, it's a very simple tool that lets you resize images. You can just open it through your apps menu, and drag any image in there to resize it to the desired dimensions.

```bash
flatpak 
```

## Optimizer

Combine it with Optimizer, which automatically optimizes you images to use less space.

```bash
flatpak 
```

## Zoom

## Anaconda

Instalado desde AUR

Luego de instalar, para habilitar habilitar `conda` en linea de comandos:

```bash
source /opt/anaconda/bin/activate root
conda init
conda deactivate

source ~/.bashrc
```

Para desactivar que conda se ejecute como entorno predeterminado:

```bash
conda config --set auto_activate_base False
```

Para cambiar el directorio por defecto de creación de entornos (por uno con permisos)  ([conda docs](https://conda.io/projects/conda/en/latest/user-guide/configuration/use-condarc.html#specify-environment-directories-envs-dirs)):

1. crear el directorio:

```bash
mkdir ~/.conda_envs
```

2. abrir el archivo:

```bash
nano ~/.condarc
```

3. agregar el siguiente contenido

```bash
envs_dirs:
  - ~/.conda_envs
```

Darle permisos al usuario actual sobre `/opt/anaconda`

```
sudo chown -R francisco /opt/anaconda
```

## gImageReader

escáner OCR de imágenes

