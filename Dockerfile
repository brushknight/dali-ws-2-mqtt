ARG BUILD_FROM
FROM $BUILD_FROM

# Install requirements for add-on
RUN \
  apk add --no-cache \
    python3 py3-pip

RUN pip3 install websockets paho-mqtt

COPY rootfs /

WORKDIR /