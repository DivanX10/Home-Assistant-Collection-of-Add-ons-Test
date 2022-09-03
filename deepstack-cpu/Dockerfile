ARG BUILD_FROM
FROM $BUILD_FROM
ENV DATA_DIR=/data/database/

COPY run.sh /data/run.sh
RUN chmod +x /data/run.sh
sh /data/run.sh
