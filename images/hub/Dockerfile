FROM jupyterhub/k8s-hub

USER root

RUN pip3 install --upgrade --no-cache-dir \
    git+https://github.com/rpwagner/oauthenticator.git

USER ${NB_USER}
