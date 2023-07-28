FROM docker.u236.org/homed-zigbee:3.4.4
LABEL maintainer="u236"

COPY rootfs /etc/homed/

RUN apt-get install tini
RUN chmod +x /usr/bin/tini
RUN chmod 777 /etc/homed/docker-entrypoint.sh

WORKDIR /etc/homed/





