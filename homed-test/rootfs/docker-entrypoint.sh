#!/usr/bin/with-contenv bash

# Путь к файлу homed-zigbee.conf внутри контейнера
DOCKER_HOMED_CONF="/etc/homed/homed-zigbee.conf"

# Функция для создания homed-zigbee.conf
create_homed_config() {
    local config_path="$1"

    # Проверяем, существует ли файл homed-zigbee.conf по указанному пути
    if [ -f "$config_path/homed-zigbee.conf" ]; then
        # Копируем содержимое файла из указанного пути внутри контейнера
        cat "$config_path/homed-zigbee.conf" > "$DOCKER_HOMED_CONF"
        echo "Done setting up Homed-zigbee configuration."
    else
        echo "Error: File homed-zigbee.conf not found at path: $config_path"
    fi
}

# Проверяем, доступна ли переменная окружения HASSIO_ADDON_CONFIG
if [ -n "$HASSIO_ADDON_CONFIG" ]; then
    # Извлекаем значение переменной data_path из HASSIO_ADDON_CONFIG
    data_path=$(echo "$HASSIO_ADDON_CONFIG" | jq -r '.data_path')
    if [ -n "$data_path" ]; then
        create_homed_config "$data_path"
    else
        echo "Error: 'data_path' is not specified in the addon configuration."
    fi
else
    echo "Error: HASSIO_ADDON_CONFIG environment variable is not available."
fi

# Вечный процесс для предотвращения завершения контейнера
tail -f /dev/null



