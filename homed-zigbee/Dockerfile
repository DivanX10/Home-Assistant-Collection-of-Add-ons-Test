FROM docker.u236.org/homed-web:1.0.5

# Установите пакеты, необходимые для bashio и Tini
RUN apt-get update && apt-get install -y tini curl mc nano jq

# Копируем ваш скрипт docker-entrypoint.sh внутрь контейнера
#COPY rootfs/ /etc/homed/
#COPY rootfs/homed.log /var/log/

# Устанавливаем права на выполнение для вашего скрипта
RUN chmod +x /etc/homed/export_config.sh

# Указываем Tini как PID 1 и регистрируем его как subreaper
#ENTRYPOINT ["/usr/bin/tini", "-s", "--", "bash", "/etc/homed/export_config.sh"]

LABEL \
  io.hass.version="VERSION" \
  io.hass.type="addon" \
  io.hass.arch="amd64" \
  maintainer="u236"

CMD ["/usr/bin/homed-web"]  
