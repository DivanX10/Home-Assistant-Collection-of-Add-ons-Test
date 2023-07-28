#!/usr/bin/with-contenv bash

# Путь к файлу homed-zigbee.conf внутри контейнера
DOCKER_HOMED_CONF="/etc/homed/homed-zigbee.conf"

# Преобразуем относительный путь в абсолютный с помощью realpath
CONFIG_PATH_ABSOLUTE=$(realpath "$CONFIG_PATH")

# Копируем содержимое файла из переменной окружения CONFIG_PATH_ABSOLUTE в новый файл внутри контейнера
cat "$CONFIG_PATH_ABSOLUTE/homed-zigbee.conf" > "$DOCKER_HOMED_CONF"

echo "Done setting up Homed-zigbee configuration."

# Вечный процесс для предотвращения завершения контейнера
tail -f /dev/null
