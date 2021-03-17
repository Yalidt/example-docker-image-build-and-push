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










