FROM jupyter/datascience-notebook:hub-1.3.0

USER root

RUN apt-get update && apt-get install -y emacs-nox

COPY requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

RUN wget -nv https://downloads.globus.org/globus-connect-personal/linux/stable/globusconnectpersonal-latest.tgz -O /tmp/globusconnectpersonal-latest.tgz
RUN tar -xzvf /tmp/globusconnectpersonal-latest.tgz -C /opt
RUN mv $(find /opt -type 'd' -maxdepth 1 -name 'globus*') /opt/gcp

COPY setupgcp.py /usr/local/bin/setupgcp.py
COPY rungcp.sh /usr/local/bin/rungcp.sh

USER $NB_UID
