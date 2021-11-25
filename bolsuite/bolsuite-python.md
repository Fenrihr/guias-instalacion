# Bolsuit y Bolsuite.Python en Linux

> `bolsuite.python` obtiene las cotizaciones del mercado de capitales desde Bolsuite dejando disponible la información real-time para ser utilizada desde cualquier programa Python.
>
> Los métodos que provee `bolsuite.python` se dividen en 3 grupos:
>
> - Paneles
> - Profundidad de mercado (Nivel 2)
> - Histórico intradiario
>
> Los tres grupos retornan pandas dataframes lo cual permite manejar la información de manera rápida, sencilla y en un "Pythonic way".
>

**Fuente:** https://github.com/crapher/bolsuite.python



## Requisitos

- Tener instalado Bolsuite 2.12
- Anaconda Virtual Enviroment



## Configuración del Entorno

- Creamos el entorno para `python=3.7` y lo activamos

```bash
$ conda create -n bolsuite python=3.7

$ conda activate bolsuite
```

- Instalamos las dependencias

```
(bolsuite)$ pip install pandas numpy requests
```

- Instalamos `bolsuite.python` según el sitio

```bash
(bolsuite)$ pip install git+https://github.com/crapher/bolsuite.python --upgrade --no-cache-dir
```

- Lo probamos abriendo el interprete de python

```bash
(bolsuite)$ python
```

- Probamos la conexión con BolSuite

```python
import bolsuite as bs

bsc = bs.Connector()
# Si bolsuite no se esta ejecutando en la misma computadora o esta configurado 
# en un puerto diferente se puede indicar en la URL como parametro
# bsc = bs.Connector(base_url="http://10.20.43.20:6091")

# Obtener todas las acciones del panel general
bsc.general_board()

# Obtener una accion del panel general filtrada por nombre
bsc.general_board(ticker='LOMA')
```



## Error

BolSuite (*ejecutado desde la terminal*) devuelve el siguiente error cuando trato de conectarme:


```bash
wine: Call from 0x7b034745 to unimplemented function httpapi.dll.HttpWaitForDisconnect, aborting
```

Y en python devuelve los datos vacios





```bash
winetricks -q msxml6 win7
```

