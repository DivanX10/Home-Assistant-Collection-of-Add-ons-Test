#!/bin/bash
set -e

exec /usr/bin/python3 trainer.py &
exec mkdir -p /config/deepstack/deepstack-trainer/db &
exec mkdir -p /config/deepstack/deepstack-trainer/uploads &

#copy from the Home Assistant to the container
exec cp -r /config/deepstack/deepstack-trainer/db/* /opt/trainer/db/ &
exec cp -r /config/deepstack/deepstack-trainer/uploads/* /opt/trainer/photos/uploads/ &

#copy from the container to the Home Assistant
exec cp -r /opt/trainer/db/ /config/deepstack/deepstack-trainer/ &
exec cp -r /opt/trainer/photos/uploads/* /config/deepstack/deepstack-trainer/uploads/ &
