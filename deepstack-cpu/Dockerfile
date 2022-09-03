ARG BUILD_FROM
FROM $BUILD_FROM
ENV DATA_DIR=/data/database/

COPY start.sh /app/server/server/
RUN chmod a+x /app/server/server/start.sh
CMD ["/app/server/server/start.sh"]
