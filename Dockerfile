FROM jupyter/r-notebook

RUN R -e 'remotes::install_github("satijalab/seurat", ref = "release/4.0.0")'
RUN R -e 'remotes::install_github("jlmelville/uwot")'

COPY requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

USER root
RUN wget https://downloads.globus.org/globus-connect-personal/linux/stable/globusconnectpersonal-latest.tgz -O /tmp/globusconnectpersonal-latest.tgz
RUN tar -xzvf /tmp/globusconnectpersonal-latest.tgz -C /opt
RUN mv $(find /opt -type 'd' -name 'globus*' -maxdepth 1) /opt/gcp

USER $NB_UID
