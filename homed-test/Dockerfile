FROM docker.u236.org/homed-zigbee:3.4.4
LABEL maintainer="u236"

COPY rootfs /etc/homed/

#Установка пакетов, необходимые для bashio
RUN apt-get update && apt-get install -y tini curl mc nano

#Установка bashio
#RUN curl -sL https://raw.githubusercontent.com/home-assistant/bashio/master/installer.sh | bash -

# Остальные команды и настройки Dockerfile
RUN chmod +x /usr/bin/tini
RUN chmod +x /etc/homed/docker-entrypoint.sh

WORKDIR /etc/homed/

ENTRYPOINT ["/usr/bin/tini", "--", "bash", "/etc/homed/docker-entrypoint.sh"]




