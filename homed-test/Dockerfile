FROM docker.u236.org/homed-zigbee:3.4.4
LABEL maintainer="u236"

COPY rootfs /
WORKDIR /etc/homed/

ENTRYPOINT ["/etc/homed", "--", "bash", "docker-entrypoint.sh"]
