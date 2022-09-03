ARG BUILD_FROM
FROM $BUILD_FROM
ENV DATA_DIR=/data/database/

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
