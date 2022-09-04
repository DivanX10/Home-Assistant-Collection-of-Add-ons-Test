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
COPY rootfs /opt/trainer
COPY run.sh /opt/trainer

RUN chmod a+x /run.sh
RUN chmod a+x /opt/trainer/docker_entrypoint.sh

EXPOSE 8080
WORKDIR /opt/trainer/

#ENTRYPOINT ["/docker_entrypoint.sh"]
#ENTRYPOINT ["/usr/bin/python3", "trainer.py"]



CMD [ "/opt/trainer/run.sh" ]
