# Используем базовый образ homed-web
#FROM docker.u236.org/homed-web:1.0.5

# Установим пакеты tini, mc, nano, jq
#RUN apt-get update && apt-get install -y tini mc nano jq

# Скопируем файлы во внутрь контейнера
#COPY scripts/ /tmp

# Установим права на выполнение скриптов
#RUN chmod +x /tmp/run_homed_web.sh
#RUN chmod +x /tmp/run_homed_zigbee.sh

# Укажем Tini как PID 1 и зарегистрируем его как subreaper
#ENTRYPOINT ["/usr/bin/tini", "-s", "--", "bash", "/tmp/run_homed_zigbee.sh"]
#ENTRYPOINT ["/usr/bin/tini", "-s", "--", "bash", "/tmp/run_homed_web.sh"]


FROM docker.u236.org/homed-web:1.0.5
COPY scripts/run_homed_web.sh /tmp
RUN chmod +x /tmp/run_homed_web.sh
RUN apt-get update && apt-get install -y tini mc nano jq

FROM docker.u236.org/homed-zigbee:3.4.4
COPY scripts/run_homed_zigbee.sh /tmp
RUN chmod +x /tmp/run_homed_zigbee.sh
RUN apt-get update && apt-get install -y tini mc nano jq


