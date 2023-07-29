#!/usr/bin/with-contenv bash

# Функция для создания homed-zigbee.conf
create_homed_config() {
    local config_path="$1"

    # Проверяем, существует ли файл homed-zigbee.conf по указанному пути
    if [ -f "$config_path/homed-zigbee.conf" ]; then
        # Путь к файлу homed-zigbee.conf внутри контейнера
        local docker_homed_conf="/etc/homed/homed-zigbee.conf"

        # Копируем содержимое файла из указанного пути внутри контейнера
        cat "$config_path/homed-zigbee.conf" > "$docker_homed_conf"
        echo "Done setting up Homed-zigbee configuration."
    else
        echo "Error: File homed-zigbee.conf not found at path: $config_path"
    fi
}

# Проверяем, передана ли переменная окружения data_path
if [ -n "$CONFIG_PATH_ABSOLUTE" ]; then
    create_homed_config "$CONFIG_PATH_ABSOLUTE"
else
    echo "Error: 'data_path' is not specified in the environment variables."
fi

# Вечный процесс для предотвращения завершения контейнера
tail -f /dev/null


