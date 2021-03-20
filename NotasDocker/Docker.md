# ¿Qué es Docker? 🐳 

Es un software que ayuda a la creación de contenedores (maquina virtuales ligeras) con las cuales es posible crear desde cero una máquina 
(CPU, memoria, unidades de disco, tarjetas de interfaz de red, etc.) y esto ayuda a que otras personas que tengan distinto distinto sistema operativo puedan 
replicar los flujos de trabajo sin necesidad de buscar la configuración asociada a su computadora. Ayuda a la reproducibilidad sin depender se sistemas
operativos, sorftwares, versiones etc.

## ¿Como crear una imagen de docker?

Comandos más comunes en un Docker file :

1)  `FROM` 
 La primera línea de un docker file es `FROM`el cual indica la base de la imagen, sobre la cual se va a construir. Por ejemplo: `FROM ubuntu`
 
2) `ADD`
+ Para agregar archivos al contenedor por ejemplo un html
+ El primer caracter es un punto(.) y el segundo es la ubicación del archivo

Ejemplo:

`ADD . <directorio_del_arhivo>`

3) `RUN`

Se usa para agregar etiquetas e instalar los componentes a la imagen con comandos de bash

Ejemplos:

`RUN apt-get` : Instala y actualiza , usualmente se pone que es lo que se quiere instalar en ese *layer*...<br>
`RUN apt-get update && apt-get install -y  \
   $DEB_PACKAGES && pip3 install --upgrade pip ` : Obtiene, instala y actualiza pip3<br>
`RUN sudo apt-get update` : Utiliza el super usuario y se emplea cuanto te quieres asegurar de que se actualice<br>
`RUN pip install opencv-python` : Una vez instalado pyhton3 instala opencv-python

4)`CMD o ENTRYPOINT`

Se utiliza para correr los demás comandos al levantar el contenedor(*start*) y define el ejecutable <br>
Ejemplo:<br>
`CMD ["/start.sh"]` <br>
`ENTRYPOINT ["/usr/local/bin/jupyter", "lab", "--ip=0.0.0.0", "--no-browser"]`

5) `ENV`

Se usa para definir el ambiente del contenedor al ejecutarlo

Ejemplos:<br>
`ENV JUPYTERLAB_VERSION 3.0.0` <br>
`ENV LANG C.UTF-8` <br>
`ENV LC_ALL C.UTF-8` <br>


## ¿Como correr una imagen?
### 1. Bajar o construir la imagen

1.1 *Bajar la imagen*

Esto se tendrá que hacer desde DockerHub que es un contenedor de imágenes aprobadas, usualmente cuando construímos una imagen nos basamos en estan imagenes ya trabajadas e incluímos lo que necesaitamos (las personalizamos). Se puede bajar directamente la imágen desde el DockerHub, por ejemplo la imagen de este repositorio ya esta alojada en DockerHub:

`docker pull yalidt/pkg:0.1`

Para listar imágenes en la terminal

`docker images`

1.2 Construir la imagen

Aqui se debe tener el dockerfile para posteriormente construir la imagen

`docker build --tag hello-world`

### 2. Levantar el contenedor

`docker run --rm --name micontenedor -d -p 8888:8888 yalidt/pkg:0.1` 

+ Las opciones --name para el nombre que es uno que tu quieras poner al contenedor
+ -d es para que corra on the background el contenedor
+  Los puertos que hay que exponer son el 8888 que es donde sirve el jupyterlab (y es el 8888 que está a la derecha de :) , se puede modificar el 8888 que está a la izquierda del : por ejemplo -p 9090:8888

Otra opción sin el flag -d para que se ejecute en la terminal:

`docker run --rm --name micontenedor -p 8888:8888 yalidt/pkg:0.1` 


### 3. Para un contenedor

`docker stop <nombre_del_contenedor>`

### Ejemplo Dockerfile:

`FROM ubuntu:bionic`

`ENV JUPYTERLAB_VERSION 3.0.0`
`ENV LANG C.UTF-8`
`ENV LC_ALL C.UTF-8`

`ENV DEB_PACKAGES="sudo nano less git python3-dev python3-pip python3-setuptools nodejs"`

`RUN apt-get update && export DEBIAN_FRONTEND=noninteractive && echo "America/Mexico_City" > /etc/timezone && apt-get install -y tzdata`

`RUN apt-get update && apt-get install -y $DEB_PACKAGES && pip3 install --upgrade pip`
`RUN pip install numpy`

`RUN groupadd miuser`
`RUN useradd miuser -g miuser -m -s /bin/bash`
`RUN echo 'miuser ALL=(ALL:ALL) NOPASSWD:ALL' | (EDITOR='tee -a' visudo)`
`RUN echo 'miuser:qwerty' | chpasswd`
`RUN pip3 install jupyter jupyterlab==$JUPYTERLAB_VERSION --upgrade`
`USER miuser`
`RUN jupyter notebook --generate-config && sed -i "s/#c.NotebookApp.password = .`

¿Que hace este Dockerfile?
+ Tiene como ambiente jupyterlab
+ Instala pyhton 3
+ Logra acceso al jupyterlab por medio del localhost:8888







