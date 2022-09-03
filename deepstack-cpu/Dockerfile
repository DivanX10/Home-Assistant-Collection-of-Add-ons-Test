ARG BUILD_FROM
FROM $BUILD_FROM
ENV DATA_DIR=/data/database/

COPY start.sh /app/server/
RUN chmod a+x /app/server/start.sh
CMD ["/app/server/start.sh"]
