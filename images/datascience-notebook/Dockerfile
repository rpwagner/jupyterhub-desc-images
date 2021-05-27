FROM jupyter/datascience-notebook

USER root

COPY requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

RUN wget -nv https://downloads.globus.org/globus-connect-personal/linux/stable/globusconnectpersonal-latest.tgz -O /tmp/globusconnectpersonal-latest.tgz
RUN tar -xzvf /tmp/globusconnectpersonal-latest.tgz -C /opt
RUN mv $(find /opt -type 'd' -name 'globus*' -maxdepth 1) /opt/gcp

COPY initenv.sh /usr/local/bin/initenv.sh
COPY tini-wrapper /usr/local/bin/tini-wrapper
COPY setupgcp.py /usr/local/bin/setupgcp.py

USER $NB_UID
