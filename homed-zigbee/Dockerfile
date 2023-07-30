# Используем базовый образ
FROM docker.u236.org/homed-web:1.0.5
FROM docker.u236.org/homed-zigbee:3.4.4

# Добавим метаданные к образу
LABEL \
  io.hass.version="VERSION" \
  io.hass.type="addon" \
  io.hass.arch="amd64" \
  maintainer="u236"

# Установим пакеты tini, mc, nano, jq
RUN apt-get update && apt-get install -y tini mc nano jq

# Скопируем файлы во внутрь контейнера
COPY run_homed.sh /tmp
#COPY homed-web.conf /etc/homed

# Установим права на выполнение скрипта
RUN chmod +x /tmp/run_homed.sh

# Укажем Tini как PID 1 и зарегистрируем его как subreaper
ENTRYPOINT ["/usr/bin/tini", "-s", "--", "bash", "/tmp/run_homed.sh"]
