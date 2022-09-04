FROM divanx10/debian11-fastapi:v1

LABEL maintainer="tomer.klein@gmail.com"
ENV DEEPSTACK_HOST_ADDRESS=""
ENV DEEPSTACK_API_KEY=""
ENV MIN_CONFIDANCE=0.70
ENV PYTHONIOENCODING=utf-8
ENV LANG=C.UTF-8

RUN apt update -yqq

RUN apt -yqq install python3-pip
    
RUN  pip3 install --upgrade pip --no-cache-dir && \
     pip3 install --upgrade setuptools --no-cache-dir
     
RUN mkdir -p /opt/trainer/photos/uploads
RUN mkdir -p /opt/trainer/db
 
COPY trainer /opt/trainer
COPY rootfs /
RUN chmod a+x /run.sh

EXPOSE 8080
WORKDIR /opt/trainer/
ENTRYPOINT ["/usr/bin/python3", "trainer.py"]

VOLUME /mnt/data/supervisor/homeassistant/deepstack/deepstack-trainer/uploads
