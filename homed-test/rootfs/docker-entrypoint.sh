#!/usr/bin/with-contenv bash

touch /etc/homed/homed-zigbee.conf

# Путь к файлу homed-zigbee.conf внутри контейнера
DOCKER_HOMED_CONF="/etc/homed/homed-zigbee.conf"

# Путь к файлу homed-zigbee.conf на хосте (папка config/homed)
HOST_HOMED_CONF="/config/homed/homed-zigbee.conf"

# Копируем файл, если он существует на хосте
if [ -f "$HOST_HOMED_CONF" ]; then
    cp -p "$HOST_HOMED_CONF" "$DOCKER_HOMED_CONF"
fi

echo "Done copy config Homed-zigbee"

