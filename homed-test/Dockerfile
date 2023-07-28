FROM docker.u236.org/homed-zigbee:3.4.4
LABEL maintainer="u236"

COPY rootfs /
#RUN apk add --no-cache tini
RUN apt-get install tini
RUN chmod +x /docker-entrypoint.sh
RUN chmod +x /usr/bin/tini
RUN chmod 777 /docker-entrypoint.sh

ENTRYPOINT ["/usr/bin/tini", "--", "bash", "docker-entrypoint.sh"]
# Tini is now available at /sbin/tini
#ENTRYPOINT ["/usr/bin/tini", "--", "/docker-entrypoint.sh"]

WORKDIR /etc/homed/


#ENTRYPOINT ["/docker-entrypoint.sh"]
# Add Tini
#ENV TINI_VERSION v0.19.0
#ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /usr/bin/tini
#RUN chmod +x /tini
#ENTRYPOINT ["/tini", "--", "bash", "docker-entrypoint.sh"]
#ENTRYPOINT ["/usr/bin/tini", "/docker-entrypoint.sh"]

#COPY rootfs/docker-entrypoint.sh /sbin/docker-entrypoint.sh

#RUN apt-get install tini
#RUN chmod +x /sbin/docker-entrypoint.sh

#ENTRYPOINT ["/usr/bin/tini", "--", "/docker-entrypoint.sh"]



