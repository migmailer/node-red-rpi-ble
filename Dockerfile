FROM nodered/node-red-docker:rpi-v8

USER root

RUN apt-get update && apt-get install -y --no-install-recommends \
  bluetooth \
  bluez \
  libbluetooth-dev \
  libudev-dev \
  build-essential bluez-tools

RUN usermod -a -G bluetooth node-red && \
    setcap cap_net_raw+eip /usr/local/bin/node

USER node-red

RUN npm install --quiet \
    noble

EXPOSE 1880




