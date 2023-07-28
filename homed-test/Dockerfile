FROM docker.u236.org/homed-zigbee:3.4.4
LABEL maintainer="u236"

COPY rootfs /
WORKDIR /etc/homed/

# Add Tini
ENV TINI_VERSION v0.19.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--", "bash", "docker-entrypoint.sh"]
