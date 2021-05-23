#!/bin/sh

if [ ! -f /root/.ssh/id_ecdsa ]; then
    ssh-keygen -t ecdsa -N "" -f /root/.ssh/id_ecdsa
fi

>&2 echo "------------ CLIENT id_ecdsa KEY ------------"
>&2 cat /root/.ssh/id_ecdsa.pub
>&2 echo "---------------------------------------------"

autossh -M 0 -o ServerAliveInterval=30 -o ServerAliveCountMax=3 $@
#    -nNT \
#    -R ${REMOTE_IP}:${REMOTE_PORT}:${LOCAL_IP}:${LOCAL_PORT} ${USER_TO_CONNECT}@${HOST_TO_CONNECT} \
#    -p ${SSH_PORT}