#!/bin/sh

# generate host keys if not present
if [ ! -f /root/.ssh/ssh_host_id_ecdsa ]; then
    ssh-keygen -t ecdsa -N "" -f /root/.ssh/ssh_host_id_ecdsa
fi

# generate authorized_keys if not present
if [ ! -f /root/.ssh/authorized_keys ]; then
    touch /root/.ssh/authorized_keys
fi

# copy
if [ ! -f /etc/ssh/sshd_config ]; then
    cp -R /root/backup/etc/ssh /etc/
fi


# do not detach (-D), log to stderr (-e), passthrough other arguments
exec /usr/sbin/sshd -D -e "$@"