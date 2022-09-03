ARG BUILD_FROM
FROM $BUILD_FROM
ENV DATA_DIR=/data/database/

COPY run.sh /
RUN chmod a+x /run.sh
CMD ["/app/server/server","-c","/run.sh"]
