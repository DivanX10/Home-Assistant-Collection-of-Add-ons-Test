ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8
ARG BUILD_VERSION

ENV DATA_DIR=/opt/trainer
WORKDIR /opt/trainer

touch /opt/trainer test.txt &&
apt update && apt install git wget -y &&
wget https://raw.githubusercontent.com/DivanX10/Home-Assistant-Add-on-DeepStack-Edge/main/deepstack_trainer_v2/run.sh -O /opt/trainer/run.sh
