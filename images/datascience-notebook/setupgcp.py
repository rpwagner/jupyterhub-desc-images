#!/usr/bin/env python

import os
import subprocess
import pickle
import base64
import globus_sdk

if os.path.exists('{}/{}'.format(os.environ['HOME'], '.globusonline/lta')):
    pass
else:
    globus_env_data = os.getenv('GLOBUS_DATA')
    pickled_tokens = base64.b64decode(globus_env_data)
    tokens = pickle.loads(pickled_tokens)
    TRANSFER_TOKEN = tokens['tokens']['transfer.api.globus.org']['access_token']

    authorizer = globus_sdk.AccessTokenAuthorizer(TRANSFER_TOKEN)
    tc = globus_sdk.TransferClient(authorizer=authorizer)

    ENDPOINT_DOCUMENT = {
        "DATA_TYPE": "endpoint",
        "display_name": "Demo Jupyter GCP Endpoint",
        "description": "Example GCP endpoint used in a Jupyter notebook server",
        "is_globus_connect": True,
    }
    create_result = tc.create_endpoint(ENDPOINT_DOCUMENT)
    setup_key = create_result["globus_connect_setup_key"]
    pid = subprocess.run(['/opt/gcp/globusconnectpersonal', '-setup', setup_key])
