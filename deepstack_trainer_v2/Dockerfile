ARG BUILD_FROM
FROM $BUILD_FROM

# Copy script
COPY rootfs /opt/trainer
RUN chmod a+x /run.sh

# Run script
CMD [ "/run.sh" ]

#creating a folder
mkdir -p /config/deepstack/deepstack-trainer

#copy from the Home Assistant to the container&&
&& cp -r /config/deepstack/deepstack-trainer/db/* /opt/trainer/db
&& cp -r /config/deepstack/deepstack-trainer/uploads/* /opt/trainer/photos/uploads

#copy from the container to the Home Assistant
&& cp -r /opt/trainer/db /config/deepstack/deepstack-trainer/
&& cp -r /opt/trainer/photos/uploads/* /config/deepstack/deepstack-trainer/
