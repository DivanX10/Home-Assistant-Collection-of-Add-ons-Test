#!/usr/bin/with-contenv bash

# Извлекаем значение "override" из файла options.json
OVERRIDE=$(jq -r '.override' < /data/options.json)

# Проверяем, включен ли выключатель "override" и его значение равно "true"
if [ "$OVERRIDE" = "true" ]; then

    # Путь к папке с файлами внутри контейнера
    DOCKER_MEDIA_DIR="/agent/Media"
    DOCKER_XML_DIR="/agent/Media/XML"
    DOCKER_COMMANDS_DIR="/agent/Commands"

    # Извлекаем значение "folder" из файла options.json
    FOLDER=$(jq -r '.folder' < /data/options.json)

    # Если значение не определено или пусто, используем значение по умолчанию
    if [ -z "$FOLDER" ]; then
        FOLDER="agentdvr"
    fi

    # Путь к папке с файлами на хосте (папка share/FOLDER)
    HOST_MEDIA_DIR="/share/${FOLDER}/Media"
    HOST_XML_DIR="/share/${FOLDER}/Media/XML"
    HOST_COMMANDS_DIR="/share/${FOLDER}/Commands"

    # Создаем папки на хосте, если их нет
    mkdir -p "$HOST_MEDIA_DIR"
    mkdir -p "$HOST_XML_DIR"
    mkdir -p "$HOST_COMMANDS_DIR"

    # Копируем содержимое папок из контейнера в папки на хосте
    cp -r "$DOCKER_MEDIA_DIR"/* "$HOST_MEDIA_DIR"
    cp -r "$DOCKER_XML_DIR"/* "$HOST_XML_DIR"
    cp -r "$DOCKER_COMMANDS_DIR"/* "$HOST_COMMANDS_DIR"
fi


# Запускаем agentdvr
exec /agent/Agent