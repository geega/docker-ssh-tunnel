FROM alpine:3.6

RUN apk add --no-cache autossh \
   && sed -i s/#[[:blank:]]*Host.*/Host\ */ /etc/ssh/ssh_config \
   && sed -i s/#[[:blank:]]*StrictHostKeyChecking.*/StrictHostKeyChecking\ no/ /etc/ssh/ssh_config \
   && mkdir -p /root/.ssh

VOLUME /root/.ssh
COPY docker-entrypoint.sh ./
ENTRYPOINT ["/docker-entrypoint.sh"]