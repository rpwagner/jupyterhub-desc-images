#!/bin/bash

export LD_PRELOAD=/usr/lib/libnss_wrapper.so

U=`id -u`
G=`id -g`

cd $HOME

FAKEPASSWD=/tmp/passwd.wrap
cp /etc/passwd ${FAKEPASSWD}
echo "${USER}:x:${U}:${G}:${USER}:${HOME}:${SHELL}" >> ${FAKEPASSWD}

FAKEGROUP=/tmp/group.wrap
cp /etc/group ${FAKEGROUP}
echo "${USER}:x:${G}:" >> ${FAKEGROUP}
echo "jovyan:x:1000:" >> ${FAKEGROUP}

export LOGNAME=${USER}

export NSS_WRAPPER_PASSWD=${FAKEPASSWD}
export NSS_WRAPPER_GROUP=${FAKEGROUP}

export CONDA_PKGS_DIRS=${HOME}/.conda/pkgs
mkdir -p ${CONDA_PKGS_DIRS}

printenv | sort >> /tmp/env.$$

# And force a PTY on our shell ; braces prevent fork()
if { true >/dev/tty; } 2>/dev/null; then
	exec >/dev/tty 2>/dev/tty </dev/tty
fi

exec "$@"
