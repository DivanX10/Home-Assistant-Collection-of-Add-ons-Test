#!/usr/bin/with-contenv bash

# Путь к файлу homed-zigbee.conf внутри контейнера
DOCKER_HOMED_CONF="/etc/homed/homed-zigbee.conf"

# Путь к файлу homed-zigbee.conf на хосте (папка config/homed)
HOST_HOMED_CONF="/config/homed/homed-zigbee.conf"

# Проверяем, существует ли файл homed-zigbee.conf на хосте
if [ -f "$HOST_HOMED_CONF" ]; then
    # Копируем содержимое файла на хосте в новый файл внутри контейнера
    cat "$HOST_HOMED_CONF" > "$DOCKER_HOMED_CONF"
else
    # Создаем пустой файл homed-zigbee.conf, если его нет на хосте
    touch "$DOCKER_HOMED_CONF"
    # Копируем содержимое файла на хосте в новый файл внутри контейнера
    cat "$HOST_HOMED_CONF" > "$DOCKER_HOMED_CONF"
fi

echo "Done setting up Homed-zigbee configuration."



