FROM docker.u236.org/homed-zigbee:3.4.4
LABEL maintainer="u236"

# Установите пакеты, необходимые для bashio и Tini
RUN apt-get update && apt-get install -y tini curl mc nano

# Копируем ваш скрипт docker-entrypoint.sh внутрь контейнера
COPY rootfs /etc/homed/

# Устанавливаем права на выполнение для вашего скрипта
RUN chmod +x /usr/bin/tini
RUN chmod +x /etc/homed/docker-entrypoint.sh

# Указываем точку входа (entrypoint) для контейнера с Tini в качестве первого процесса
#ENTRYPOINT ["/usr/bin/tini", "--", "/etc/homed/docker-entrypoint.sh"]
