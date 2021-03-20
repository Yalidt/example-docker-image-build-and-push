#!/bin/bash
NB_USER=jovyan
HOME=/home/${NB_USER}
cd ${HOME} && git clone -b main --single-branch https://github.com/optimizacion-2-2021-1-gh-classroom/practica-1-segunda-parte-yefovar.git 

exec "$@"
