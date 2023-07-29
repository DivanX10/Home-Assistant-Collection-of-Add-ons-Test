FROM docker.u236.org/homed-zigbee:3.4.4
LABEL maintainer="u236"

# Установите пакеты, необходимые для bashio и Tini
RUN apt-get update && apt-get install -y tini curl mc nano jq

# Копируем ваш скрипт docker-entrypoint.sh внутрь контейнера
#COPY rootfs/docker-entrypoint.sh /etc/homed/
COPY rootfs/ /etc/homed/

# Устанавливаем права на выполнение для вашего скрипта
#RUN chmod +x /usr/bin/tini
RUN chmod +x /etc/homed/docker-entrypoint.sh

# Указываем Tini как PID 1 и регистрируем его как subreaper
ENTRYPOINT ["/usr/bin/tini", "-s", "--", "bash", "/etc/homed/docker-entrypoint.sh"]

