import json
import traceback

import requests

import tools.tech

baseurl = 'http://localhost'
port = 5001
endpoint = '/api/slopes/'
file = 'slopes_south.json'
session = requests.session()

logger = tools.tech.init_logger('rosa_khutor_default', logfile='../ski_resort/logger.ini')

with open(file, 'r', encoding='utf8') as f:
    items = json.load(f)

for item in items:
    name = item.get('name')

    if name:
        try:
            url = f'{baseurl}:{port}{endpoint}{name}'
            _json = item
            response = session.post(url, json=_json)
            if response.status_code != 201:
                logger.error(f'{name} error: {response.status_code} - {response.json()}')
        except:
            logger.error('uncaught exception: %s', traceback.format_exc())