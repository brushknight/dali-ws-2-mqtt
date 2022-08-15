#!/usr/bin/with-contenv bashio

MQTT_HOST=$(bashio::config 'mqtt_host')
MQTT_PORT=$(bashio::config 'mqtt_port')
MQTT_USER=$(bashio::config 'mqtt_user')
MQTT_PASS=$(bashio::config 'mqtt_pass')
DALI_2_IOT_HOST=$(bashio::config '  dali_2_iot_host')

ls -la

#pip3 install -r requirements.txt
pip3 install paho-mqtt websockets

python3 main.py