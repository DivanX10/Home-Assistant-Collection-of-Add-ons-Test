#!/bin/bash

# Извлекаем значение "folder_path" из файла options.json
FOLDER_PATH=$(jq -r '.folder_path' < /data/options.json)

# Путь к папке с файлами внутри контейнера
DOCKER_MEDIA_DIR="/agent/Media"
DOCKER_XML_DIR="/agent/Media/XML"
DOCKER_COMMANDS_DIR="/agent/Commands"

# Путь к папке с файлами на хосте (папка share/agentdvr)
HOST_MEDIA_DIR="$FOLDER_PATH/Media"
HOST_XML_DIR="$FOLDER_PATH/Media/XML"
HOST_COMMANDS_DIR="$FOLDER_PATH/Commands"

# Запускаем agentdvr
exec /agent/Agent

# Проверяем, существует ли папка на хосте
if [ ! -d "$HOST_MEDIA_DIR" ]; then
    # Создаем папку на хосте
    mkdir -p "$HOST_MEDIA_DIR"
fi

if [ ! -d "$HOST_XML_DIR" ]; then
    # Создаем папку на хосте
    mkdir -p "$HOST_XML_DIR"
fi

if [ ! -d "$HOST_COMMANDS_DIR" ]; then
    # Создаем папку на хосте
    mkdir -p "$HOST_COMMANDS_DIR"
fi

# Запускаем бесконечный цикл
while true
do
    # Копируем содержимое папок из контейнера в папки на хосте
    rsync -avh --ignore-existing "$DOCKER_MEDIA_DIR/" "$HOST_MEDIA_DIR"
    rsync -avh --ignore-existing "$DOCKER_XML_DIR/" "$HOST_XML_DIR"
    rsync -avh --ignore-existing "$DOCKER_COMMANDS_DIR/" "$HOST_COMMANDS_DIR"

    # Ждем 10 секунд
    sleep 10
done

