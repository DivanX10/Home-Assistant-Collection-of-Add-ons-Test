ARG BUILD_FROM
FROM $BUILD_FROM
VOLUME opt/trainer/db
VOLUME opt/trainer/photos/uploads
ENV Photos=opt/trainer/photos/uploads
WORKDIR ${Photos}   # WORKDIR /bar
ADD . $Photos       # ADD . /bar
COPY \$Photos /config/deepstack/trainer # COPY $FOO /quux


