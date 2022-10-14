FROM doitandbedone/ispyagentdvr:4.2.9.0

LABEL maintainer="doitandbedone"

RUN apt update -yqq
RUN apt install rsync mc nano -yqq

EXPOSE 8090

# STUN server port
EXPOSE 3478/udp

# TURN server UDP port range
EXPOSE 50000-50010/udp

# Data volumes
VOLUME ["/mnt/data/supervisor/homeassistant/AgentDVR/Commands:/agent/Commands", "/mnt/data/supervisor/homeassistant/AgentDVR/Media:/agent/Media/WebServerRoot/Media", "/mnt/data/supervisor/homeassistant/AgentDVR/Config:/agent/Media/XML"]

WORKDIR /agent
