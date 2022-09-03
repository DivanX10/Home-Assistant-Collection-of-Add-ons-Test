#!/usr/bin/with-contenv bashio

mkdir -p /config/deepstack/deepstack-trainer
cp -r /config/deepstack/deepstack-trainer/ /opt/trainer/db
cp -r /config/deepstack/deepstack-trainer/ /opt/trainer/photos/uploads
cp -r /opt/trainer/db /config/deepstack/deepstack-trainer/
cp -r /opt/trainer/photos/uploads /config/deepstack/deepstack-trainer/