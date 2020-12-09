import json
import traceback

import requests

import ski_resort.tools.tech

baseurl = 'http://localhost'
port = 5001
# endpoint = '/api/slopes/'
# file = 'slopes_south.json'
endpoint = '/api/lifts/'
file = 'lifts.json'
session = requests.session()

logger = ski_resort.tools.tech.init_logger('rosa_khutor_default', logfile='../ski_resort/logger.ini')

with open(file, 'r', encoding='utf8') as f:
    items = json.load(f)

for item in items:
    name = item.get('name')

    if name:
        try:
            url = f'{baseurl}:{port}{endpoint}{name.upper()}'
            _json = {key: value.upper() if isinstance(value, str) else value for key, value in item.items()}
            print(_json)
            response = session.post(url, json=_json)
            if response.status_code != 201:
                logger.error(f'{name} error: {response.status_code} - {response.json()}')
        except:
            logger.error('uncaught exception: %s', traceback.format_exc())