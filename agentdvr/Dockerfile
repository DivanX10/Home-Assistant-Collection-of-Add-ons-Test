FROM doitandbedone/ispyagentdvr:4.2.9.0
LABEL maintainer="doitandbedone"

# Установим пакеты tini, mc, nano, jq
RUN apt-get update && apt-get install -yqq tini mc nano jq && apt-get clean

# Modify permission for execution
RUN echo "Adding executable permissions" && \
    chmod +x /agent/Agent && \
    chmod +x /agent/agent-register.sh && \
    chmod +x /agent/agent-reset.sh && \
    chmod +x /agent/agent-reset-local-login.sh

# Define default environment variables
ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
# Fix a memory leak on encoded recording
ENV MALLOC_TRIM_THRESHOLD_=100000

# Main UI port
EXPOSE 8090

# STUN server port
EXPOSE 3478/udp

# TURN server UDP port range
EXPOSE 50000-50010/udp

# Data volumes
VOLUME ["/agent/Media/XML", "/agent/Media/WebServerRoot/Media", "/agent/Commands"]

WORKDIR /agent

# Скопируем файлы во внутрь контейнера
COPY run.sh /agent

# Установим права на выполнение скрипта
RUN chmod +x /agent/run.sh

# Укажем Tini как PID 1 и зарегистрируем его как subreaper
ENTRYPOINT ["/usr/bin/tini", "-s", "--", "bash", "/agent/run.sh"]

# Define service entrypoint
#CMD ["/agent/Agent"]
