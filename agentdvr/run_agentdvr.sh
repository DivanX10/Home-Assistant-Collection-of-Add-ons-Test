#!/usr/bin/with-contenv bash

# Извлекаем значение "override" из файла options.json
OVERRIDE=$(jq -r '.override' < /data/options.json)

# Проверяем, включен ли выключатель "override" и его значение равно "true"
if [ "$OVERRIDE" = "true" ]; then

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

    # Создаем папку "agentdvr" в сетевой папке "share", если она не существует
    mkdir -p "/share/${FOLDER}"
    # Создаем подпапки "Media", "Media/XML" и "Commands" внутри папки "agentdvr"
    mkdir -p "$HOST_MEDIA_DIR"
    mkdir -p "$HOST_XML_DIR"
    mkdir -p "$HOST_COMMANDS_DIR"

    # Копируем содержимое папок из контейнера в папки на хосте, если они существуют
    if [ -d "/agent/Media" ]; then
        cp -r "/agent/Media"/* "$HOST_MEDIA_DIR"
    fi

    if [ -d "/agent/Media/XML" ]; then
        cp -r "/agent/Media/XML"/* "$HOST_XML_DIR"
    fi

    if [ -d "/agent/Commands" ]; then
        cp -r "/agent/Commands"/* "$HOST_COMMANDS_DIR"
    fi
fi

# Запускаем agentdvr
exec /agent/Agent

