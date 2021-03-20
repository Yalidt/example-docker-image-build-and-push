FROM ubuntu:bionic
ARG NB_USER=jovyan
ARG NB_UID=1000
ENV USER ${NB_USER}
ENV NB_UID ${NB_UID}
ENV HOME /home/${NB_USER}
ENV DEB_PACKAGES="sudo nano less git python3-dev python3-pip python3-setuptools nodejs"

COPY . ${HOME}
USER root
RUN chown -R ${NB_UID} ${HOME}
RUN apt-get update && apt-get install -y $DEB_PACKAGES && pip3 install --upgrade pip

USER ${NB_USER}

RUN ["sudo", "chmod", "+x", "/home/jovyan/run.sh"]

ENTRYPOINT ["/home/jovyan/run.sh"]
