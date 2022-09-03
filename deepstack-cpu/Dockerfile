ARG BUILD_FROM
FROM $BUILD_FROM
ENV DATA_DIR=/data/database/

COPY run.sh /data
RUN chmod a+x /data/run.sh

# Run script
ENTRYPOINT ["sh /data/run.sh"]
