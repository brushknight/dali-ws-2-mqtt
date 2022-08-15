import asyncio
import os

import websockets
import paho.mqtt.client as paho

broker = os.environ['MQTT_HOST']
port = os.environ['MQTT_PORT']
username = os.environ['MQTT_USER']
password = os.environ['MQTT_PASS']
dali2iotHost = os.environ['DALI_2_IOT_HOST']  #

mqttClient = paho.Client("home_assistant")
mqttClient.username_pw_set(username, password)
mqttClient.connect(broker, port)


async def receive_message(websocket):
    async for message in websocket:
        print(message)
        res = mqttClient.publish("dali/monitor", message)
        print(res)


async def run_client(url):
    try:
        async with websockets.connect(url) as websocket:
            wait_task = asyncio.create_task(
                receive_message(websocket)
            )
            websocket.send('{"type": "filtering","data": {"daliMonitor": true,"daliStatus": true}}')
            await asyncio.wait([wait_task])
            wait_task.result()
    except:
        pass


asyncio.run(run_client("ws://" + dali2iotHost))
