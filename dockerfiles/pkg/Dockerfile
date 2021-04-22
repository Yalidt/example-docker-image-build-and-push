#Dummy line
FROM ubuntu:bionic
#ENV JUPYTERLAB_VERSION 1.1.0
ENV TIMEZONE America/Mexico_City
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV DEBIAN_FRONTEND noninteractive 
ENV DEB_BUILD_DEPS="sudo nano less git wget curl python3-dev python3-pip python3-setuptools"
ENV DEB_PACKAGES=""
ENV PIP_PACKAGES_COMMON=""
#ENV USER_BINDER jovyan
ENV PIP_PACKAGES_KALE="kubeflow-kale==0.6.1"
#RUN apt-get update && export DEBIAN_FRONTEND=noninteractive && echo "America/Mexico_City" > /etc/timezone && apt-get install -y tzdata

RUN apt-get update && export $DEBIAN_FRONTEND && \
    echo $TIMEZONE > /etc/timezone && apt-get install -y tzdata
    
#RUN apt-get update && apt-get install -y \
#	    build-essential \
#            sudo \
#            nano \
#            less \
#            git \
#            python3-dev \
#            python3-pip \
#            python3-setuptools && pip3 install --upgrade pip

RUN apt-get update && apt-get install -y $DEB_BUILD_DEPS $DEB_PACKAGES && pip3 install --upgrade pip  

RUN curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash - && apt-get install -y nodejs

#RUN echo 'jovyan ALL=(ALL:ALL) NOPASSWD:ALL' | (EDITOR='tee -a' visudo)
#RUN echo 'jovyan:qwerty' | chpasswd

RUN pip3 install jupyter "jupyterlab>=2.0.0,<3.0.0" --upgrade

#next password is dummy

RUN jupyter notebook --generate-config && \
    sed -i "s/#c.NotebookApp.password = .*/c.NotebookApp.password = u'sha1:115e429a919f:21911277af52f3e7a8b59380804140d9ef3e2380'/" ~/.jupyter/jupyter_notebook_config.py        
#RUN pip install $PIP_PACKAGES_COMMON --upgrade
RUN pip install $PIP_PACKAGES_KALE --upgrade
RUN jupyter labextension install kubeflow-kale-labextension

#Clona el repositorio
#RUN git clone https://github.com/optimizacion-2-2021-1-gh-classroom/practica-1-segunda-parte-yefovar.git 
#Instala paquetes necesario
#RUN pip install practica-1-segunda-parte-yefovar/src/  
RUN pip install --quiet "git+https://github.com/optimizacion-2-2021-1-gh-classroom/practica-1-segunda-parte-yefovar.git#egg=opt&subdirectory=src"



#RUN groupadd ${USER_BINDER}
#RUN useradd ${USER_BINDER} -g ${USER_BINDER} -m -s /bin/bash

#RUN pip3 install jupyter jupyterlab==$JUPYTERLAB_VERSION --upgrade
#RUN pip3 install jupyter "jupyterlab>=2.0.0,<3.0.0" --upgrade
#RUN chown -R ${USER_BINDER}:${USER_BINDER} /home/jovyan/   #da permisos al usuario
#USER ${USER_BINDER}
#RUN jupyter notebook --generate-config && sed -i "s/#c.NotebookApp.password = .*/c.NotebookApp.password = u'sha1:115e429a919f:21911277af52f3e7a8b59380804140d9ef3e2380'/" /home/jovyan/.jupyter/jupyter_notebook_config.py
#ENV LC_ALL C.UTF-8
#ENV LANG C.UTF-8

#RUN pip install $PIP_PACKAGES_KALE --upgrade
#RUN jupyter labextension install kubeflow-kale-labextension

VOLUME ["/shared_volume"]

WORKDIR /

ENV NB_PREFIX opturl

ENTRYPOINT ["/usr/local/bin/jupyter", "lab", "--ip=0.0.0.0", "--no-browser", "--allow-root", "--LabApp.allow_origin='*'", "--LabApp.base_url=opturl"]
