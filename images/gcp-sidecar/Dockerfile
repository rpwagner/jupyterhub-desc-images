FROM ubuntu:20.04

ARG NB_USER="jovyan"
ARG NB_UID="1000"
ARG NB_GID="100"

USER root

RUN apt-get update && apt-get install -y python3-pip wget

COPY requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

RUN wget -nv https://downloads.globus.org/globus-connect-personal/linux/stable/globusconnectpersonal-latest.tgz -O /tmp/globusconnectpersonal-latest.tgz
RUN tar -xzvf /tmp/globusconnectpersonal-latest.tgz -C /opt
RUN mv $(find /opt -type 'd' -name 'globus*' -maxdepth 1) /opt/gcp

COPY startgcp.sh /usr/local/bin/startgcp.sh
COPY setupgcp.py /usr/local/bin/setupgcp.py

USER $NB_UID
