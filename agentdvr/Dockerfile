FROM doitandbedone/ispyagentdvr:4.2.9.0

LABEL maintainer="doitandbedone"

RUN apt update -yqq
RUN apt install rsync mc nano -yqq

#EXPOSE 8090 3478/udp 50000-50010/udp

#EXPOSE 8090

# STUN server port
#EXPOSE 3478/udp

# TURN server UDP port range
#EXPOSE 50000-50010/udp

COPY docker-compose-agentdvr.yml /agent

ADD docker-compose-agentdvr.yml /agent

WORKDIR /agent
