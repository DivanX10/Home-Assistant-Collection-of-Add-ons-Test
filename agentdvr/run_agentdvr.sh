#!/bin/bash

# Создаем папки на хосте, если их нет
mkdir -p /share/agentdvr/Media
mkdir -p /share/agentdvr/Media/XML
mkdir -p /share/agentdvr/Commands

# Монтируем Docker volumes в папки внутри контейнера
mount -o bind /share/agentdvr/Media /agent/Media
mount -o bind /share/agentdvr/Media/XML /agent/Media/XML
mount -o bind /share/agentdvr/Commands /agent/Commands

# Запускаем agentdvr
exec /agent/Agent


