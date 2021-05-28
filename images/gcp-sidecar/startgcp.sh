#!/bin/bash

/usr/local/bin/setupgcp.py
chmod -R go-rwx $HOME/.globusonline
nohup /opt/gcp/globusconnectpersonal -start &

