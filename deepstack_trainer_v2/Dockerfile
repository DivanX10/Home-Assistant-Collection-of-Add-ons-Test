ARG BUILD_FROM
FROM $BUILD_FROM

# Copy script
COPY rootfs /
RUN chmod a+x /run.sh

# Run script
CMD [ "/run.sh" ]
