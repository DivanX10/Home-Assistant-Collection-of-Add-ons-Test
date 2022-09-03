ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8
ARG BUILD_VERSION

ENV DATA_DIR=/data
WORKDIR /data

touch /data/test.txt

COPY run.sh /data
RUN chmod a+x /data/run.sh

# Run script
CMD [ "sh /data/run.sh" ]
