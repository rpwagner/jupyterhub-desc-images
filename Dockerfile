FROM jupyter/r-notebook

# RUN R -e 'remotes::install_github("satijalab/seurat", ref = "release/4.0.0")'
# RUN R -e 'remotes::install_github("jlmelville/uwot")'

COPY requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

USER root
RUN wget -nv https://downloads.globus.org/globus-connect-personal/linux/stable/globusconnectpersonal-latest.tgz -O /tmp/globusconnectpersonal-latest.tgz
RUN tar -xzvf /tmp/globusconnectpersonal-latest.tgz -C /opt
RUN mv $(find /opt -type 'd' -name 'globus*' -maxdepth 1) /opt/gcp

COPY initenv.sh /usr/local/bin/initenv.sh
COPY tini-wrapper /usr/local/bin/tini-wrapper

# Add Tini
ENV TINI_VERSION v0.19.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /usr/local/sbin/tini
RUN chmod +x /usr/local/sbin/tini

USER $NB_UID
