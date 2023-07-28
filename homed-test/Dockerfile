FROM docker.u236.org/homed-zigbee:3.4.4
LABEL maintainer="u236"

COPY rootfs /etc/homed/

RUN apt-get install -y tini mc
RUN chmod +x /usr/bin/tini
RUN chmod +x /etc/homed/homed-zigbee.conf
RUN chmod 777 /etc/homed/docker-entrypoint.sh

WORKDIR /etc/homed/

#ENTRYPOINT ["/usr/bin/tini", "--", "bash", "/etc/homed/docker-entrypoint.sh"]




