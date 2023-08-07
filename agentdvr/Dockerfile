#!/bin/bash

# Путь к папке с файлами внутри контейнера
DOCKER_MEDIA_DIR="/agent/Media"
DOCKER_XML_DIR="/agent/Media/XML"
DOCKER_COMMANDS_DIR="/agent/Commands"

# Путь к папке с файлами на хосте (папка share/agentdvr)
HOST_MEDIA_DIR="$FOLDER_PATH/Media"
HOST_XML_DIR="$FOLDER_PATH/Media/XML"
HOST_COMMANDS_DIR="$FOLDER_PATH/Commands"

# Функция для копирования измененных файлов
copy_files() {
    # Проверяем, существует ли папка /agent и она не пуста
    if [ ! -d "$DOCKER_MEDIA_DIR" ] || [ -z "$(ls -A $DOCKER_MEDIA_DIR)" ]; then
        # Копируем содержимое папок из контейнера в папки на хосте
        rsync -avh --ignore-existing "$HOST_MEDIA_DIR/" "$DOCKER_MEDIA_DIR"
        rsync -avh --ignore-existing "$HOST_XML_DIR/" "$DOCKER_XML_DIR"
        rsync -avh --ignore-existing "$HOST_COMMANDS_DIR/" "$DOCKER_COMMANDS_DIR"
    else
        # Копируем только измененные файлы из папок на хосте в контейнер
        rsync -avh --update "$HOST_MEDIA_DIR/" "$DOCKER_MEDIA_DIR"
        rsync -avh --update "$HOST_XML_DIR/" "$DOCKER_XML_DIR"
        rsync -avh --update "$HOST_COMMANDS_DIR/" "$DOCKER_COMMANDS_DIR"
    fi
}

# Добавляем задачу в крон
echo "*/1 * * * * /tmp/run_agentdvr.sh" > cronjob

# Устанавливаем задачу в крон
crontab cronjob

# Удаляем временный файл
rm cronjob

# Запускаем скрипт для копирования файлов
copy_files

# Запускаем agentdvr
exec /agent/Agent

# После завершения работы agentdvr копируем файлы обратно в папку на хосте
copy_files
