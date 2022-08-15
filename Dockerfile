ARG BUILD_FROM
FROM $BUILD_FROM

# Install requirements for add-on
RUN \
  apk add --no-cache \
    python3 py3-pip

WORKDIR /data

# Copy data for add-on
COPY requirements.txt /data/requirements.txt
COPY main.py /data/main.py
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
