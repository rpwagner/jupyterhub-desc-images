#!/bin/bash

# And force a PTY on our shell ; braces prevent fork()
if { true >/dev/tty; } 2>/dev/null; then
	exec >/dev/tty 2>/dev/tty </dev/tty
fi

/usr/local/bin/setupgcp.py
chmod -R go-rwx $HOME/.globusonline
nohup /opt/gcp/globusconnectpersonal -start &

exec "$@"
