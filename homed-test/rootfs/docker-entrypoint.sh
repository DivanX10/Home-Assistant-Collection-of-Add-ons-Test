#!/usr/bin/with-contenv bash

# Подключаем библиотеку bashio
source /usr/lib/bashio

# Проверяем наличие параметра data_path в конфигурации
bashio::config.require 'data_path'

# Теперь, если 'data_path' присутствует в конфигурации, вы можете получить его значение
data_path=$(bashio::config 'data_path')

# Продолжайте ваш скрипт как обычно
touch /etc/homed/homed-zigbee.conf

# Путь к файлу homed-zigbee.conf внутри контейнера
DOCKER_HOMED_CONF="/etc/homed/homed-zigbee.conf"

# Путь к файлу homed-zigbee.conf на хосте (папка config/homed)
HOST_HOMED_CONF="$data_path/homed/homed-zigbee.conf"

# Копируем файл, если он существует на хосте
if [ -f "$HOST_HOMED_CONF" ]; then
    cp -p "$HOST_HOMED_CONF" "$DOCKER_HOMED_CONF"
fi

echo "Done copy config Homed-zigbee"


