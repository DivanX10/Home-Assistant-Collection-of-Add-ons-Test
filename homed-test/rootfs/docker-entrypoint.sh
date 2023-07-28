#!/usr/bin/with-contenv bash

# Путь к файлу homed-zigbee.conf внутри контейнера
DOCKER_HOMED_CONF="/etc/homed/homed-zigbee.conf"

# Проверяем, существует ли переменная data_path и не пустая ли она
if [ -n "$data_path" ]; then
    # Преобразуем относительный путь в абсолютный с помощью realpath
    CONFIG_PATH_ABSOLUTE=$(realpath "$data_path")

    # Проверяем, существует ли файл homed-zigbee.conf по указанному пути
    if [ -f "$CONFIG_PATH_ABSOLUTE/homed-zigbee.conf" ]; then
        # Копируем содержимое файла из переменной окружения CONFIG_PATH_ABSOLUTE в новый файл внутри контейнера
        cat "$CONFIG_PATH_ABSOLUTE/homed-zigbee.conf" > "$DOCKER_HOMED_CONF"
        echo "Done setting up Homed-zigbee configuration."
    else
        echo "Error: File homed-zigbee.conf not found at path: $CONFIG_PATH_ABSOLUTE"
    fi
else
    echo "Error: 'data_path' is not specified in the addon configuration."
fi

# Вечный процесс для предотвращения завершения контейнера
tail -f /dev/null

