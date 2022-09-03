ARG BUILD_FROM
FROM $BUILD_FROM
ENV DATA_DIR=/data/database/

COPY start.sh /
RUN chmod a+x /start.sh
CMD [ "/start.sh" ]
