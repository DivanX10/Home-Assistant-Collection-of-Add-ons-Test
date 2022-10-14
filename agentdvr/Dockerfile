FROM doitandbedone/ispyagentdvr:4.2.9.0
ARG ELK_VERSION
FROM docker.elastic.co/elasticsearch/elasticsearch:${ELK_VERSION}
ADD --chown=elasticsearch:root elasticsearch-single-node.yml /usr/share/elasticsearch/config/elasticsearch.yml


LABEL maintainer="doitandbedone"

RUN apt update -yqq
RUN apt install rsync mc nano -yqq

#EXPOSE 8090 3478/udp 50000-50010/udp

#EXPOSE 8090

# STUN server port
#EXPOSE 3478/udp

# TURN server UDP port range
#EXPOSE 50000-50010/udp

COPY docker-compose-es-single-node.yml /agent

WORKDIR /agent
