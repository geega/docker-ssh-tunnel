FROM alpine:3.6

RUN apk add --no-cache openssh \
  && sed -i '1s/^/## This is the only part of the file that we recommend editing. ###############\n\n/' /etc/ssh/sshd_config \
  && sed -i '3s/^/PermitOpen any \n\n/' /etc/ssh/sshd_config \
  && sed -i '5s/^/##################################################################################\n/' /etc/ssh/sshd_config \
  && sed -i s,#HostKey.*,HostKey\ /root/.ssh/ssh_host_id_ecdsa, /etc/ssh/sshd_config \
  && sed -i s/#PermitRootLogin.*/PermitRootLogin\ without-password/ /etc/ssh/sshd_config \
  && sed -i s/#GatewayPorts.*/GatewayPorts\ clientspecified/ /etc/ssh/sshd_config \
  && sed -i s/#PasswordAuthentication.*/PasswordAuthentication\ no/ /etc/ssh/sshd_config \
  && sed -i s/#X11Forwarding.*/X11Forwarding\ no/ /etc/ssh/sshd_config \
  && sed -i s/#PermitUserRC.*/PermitUserRC\ no/ /etc/ssh/sshd_config \
  && sed -i s/#PermitUserEnvironment.*/PermitUserEnvironment\ no/ /etc/ssh/sshd_config \
  && sed -i s/#PermitTTY.*/PermitTTY\ no/ /etc/ssh/sshd_config \
  && sed -i s/#PermitTunnel.*/PermitTunnel\ yes/ /etc/ssh/sshd_config \
  && mkdir -p /root/.ssh \
  && mkdir -p /root/backup/etc \
  && cp -R /etc/ssh /root/backup/etc/

ENTRYPOINT ["/docker-entrypoint.sh"]
COPY docker-entrypoint.sh /
VOLUME /root/.ssh /etc/ssh
EXPOSE 22