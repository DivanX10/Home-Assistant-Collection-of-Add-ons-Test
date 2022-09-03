ARG BUILD_FROM
FROM $BUILD_FROM

# Copy script
COPY rootfs /opt/trainer
RUN chmod a+x /run.sh

# Run script
CMD [ "/run.sh" ]

mkdir -p /config/deepstack/deepstack-trainer
cp -r /config/deepstack/deepstack-trainer/ /opt/trainer/db
cp -r /config/deepstack/deepstack-trainer/ /opt/trainer/photos/uploads
cp -r /opt/trainer/db /config/deepstack/deepstack-trainer/
cp -r /opt/trainer/photos/uploads /config/deepstack/deepstack-trainer/
