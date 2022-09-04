FROM divanx10/debian11-fastapi:v1

LABEL maintainer="tomer.klein@gmail.com"
ENV DEEPSTACK_HOST_ADDRESS=""
ENV DEEPSTACK_API_KEY=""
ENV MIN_CONFIDANCE=0.70
ENV PYTHONIOENCODING=utf-8
ENV LANG=C.UTF-8

RUN apt update -yqq

RUN apt -yqq install python3-pip

RUN pip3 install --upgrade pip --no-cache-dir && \
    pip3 install --upgrade setuptools --no-cache-dir

RUN mkdir -p /opt/trainer/photos/uploads
RUN mkdir -p /opt/trainer/db
RUN mkdir -p /opt/trainer/myvol

COPY trainer /opt/trainer
COPY files /opt/trainer

RUN echo "hello world" > /opt/trainer/myvol/greeting

EXPOSE 8080
WORKDIR /opt/trainer/

ENTRYPOINT ["/usr/bin/python3", "trainer.py"]

RUN --mount=type=bind,source=/mnt/data/supervisor/homeassistant/deepstack/deepstack-trainer/uploads,destination=/opt/trainer/photos/uploads
