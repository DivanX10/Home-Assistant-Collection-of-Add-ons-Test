ARG BUILD_FROM
FROM $BUILD_FROM

COPY root /
RUN chmod a+x /run.sh
ENTRYPOINT [ "/run.sh" ]
