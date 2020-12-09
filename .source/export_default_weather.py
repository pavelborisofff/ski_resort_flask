import json
import traceback

import requests

import ski_resort.tools.tech

baseurl = 'http://localhost'
port = 5001
# endpoint = '/api/slopes/'
# file = 'slopes_south.json'
endpoints = ['/api/weather/yrno/{}/0', '/api/weather/local/{}/0',
             '/api/weather/yrno/{}/1', '/api/weather/local/{}/1',
             '/api/weather/yrno/{}/2', '/api/weather/local/{}/2']
file = 'weather_0.json'
session = requests.session()

logger = ski_resort.tools.tech.init_logger('rosa_khutor_default', logfile='../ski_resort/logger.ini')

with open(file, 'r', encoding='utf8') as f:
    items = json.load(f)

for item in items:
    name = item.get('name')

    if name:
        try:
            for endpoint in endpoints:
                url = f'{baseurl}:{port}{endpoint.format(name.upper())}'
                _json = {key: value.upper() if isinstance(value, str) else value for key, value in item.items()}
                print(_json)
                response = session.post(url, json=_json)
                if response.status_code != 201:
                    logger.error(f'{name} error: {response.status_code} - {response.json()}')
        except:
            logger.error('uncaught exception: %s', traceback.format_exc())