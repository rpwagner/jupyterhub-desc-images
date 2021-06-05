#!/bin/bash

GCP_CONFIG_DIR=${HOME}/.globusonline

# Setup GCP if needed
if [ ! -d "${GCP_CONFIG_DIR}/lta" ]
then
    # get GCP setup key
    setupkey=`/usr/local/bin/setupgcp.py`
    if [ -z ${setupkey} ]
    then
	echo "Did not get GCP setup key"
    else
	echo "Setting up GCP"
	/opt/gcp/globusconnectpersonal -setup ${setupkey}
    fi
fi

chmod -R go-rwx ${GCP_CONFIG_DIR}
cd ${GCP_CONFIG_DIR}
nohup /opt/gcp/globusconnectpersonal -start &
