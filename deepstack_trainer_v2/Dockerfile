ARG BUILD_FROM
FROM $BUILD_FROM

touch /data/test.txt
COPY run.sh /
ENTRYPOINT ["/run.sh"]
