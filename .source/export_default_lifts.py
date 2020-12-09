import json
import traceback

import requests

import ski_resort.tools.tech

baseurl = 'http://localhost'
port = 5001
endpoint = '/api/lifts/'
file = 'lifts.json'
session = requests.session()

logger = ski_resort.tools.tech.init_logger('rosa_khutor_default', logfile='../ski_resort/logger.ini')

lifts_order = ['ОЛИМПИЯ', 'ЗАПОВЕДНЫЙ ЛЕС', 'КАВКАЗСКИЙ ЭКСПРЕСС', 'СТРЕЛА', 'СКАЗКА', 'КАБАН', 'КВАРТЕТ', 'СОЛО',
               'ВОЛЧЬЯ СКАЛА', 'БЕСЕДА', 'ДРИАДА', 'ТУНДРА', 'ДАФНА', 'ШАЛЕ', 'ЮВЕНТА', 'ЭКСТРИМ', 'КРОКУС',
               'ЭДЕЛЬВЕЙС', 'БУГЕЛИ В CНОУПАРКЕ', 'БУГЕЛЬ', 'УЧЕБНЫЙ СКЛОН', 'ДЕТСКИЙ СКЛОН', 'ТЮБИНГ']

lifts = ['ОЛИМПИЯ', 'ЗАПОВЕДНЫЙ ЛЕС', 'КАВКАЗСКИЙ ЭКСПРЕСС ВЫШЕ 1600', 'КАВКАЗСКИЙ ЭКСПРЕСС НИЖЕ 1600', 'СТРЕЛА',
         'СКАЗКА', 'КАБАН', 'КВАРТЕТ', 'СОЛО',
         'ВОЛЧЬЯ СКАЛА', 'БЕСЕДА', 'ДРИАДА', 'ТУНДРА', 'ДАФНА', 'ШАЛЕ', 'ЮВЕНТА', 'ЭКСТРИМ', 'КРОКУС',
         'ЭДЕЛЬВЕЙС', 'ПАРК 1', 'ПАРК 2', 'БУГЕЛЬ 1600-1', 'БУГЕЛЬ 1600-2', 'УЧЕБНЫЙ СКЛОН 1', 'УЧЕБНЫЙ СКЛОН 2',
         'ДЕТСКИЙ СКЛОН', 'ТЮБИНГ']

summer = ['ОЛИМПИЯ', 'ЗАПОВЕДНЫЙ ЛЕС', 'КАВКАЗСКИЙ ЭКСПРЕСС ВЫШЕ 1600', 'КАВКАЗСКИЙ ЭКСПРЕСС НИЖЕ 1600', 'ЭДЕЛЬВЕЙС',
          'ВОЛЧЬЯ СКАЛА', 'КРОКУС', 'СТРЕЛА']

with open(file, 'r', encoding='utf8') as f:
    items = json.load(f)

with open('lfits_sorted.json', 'w', encoding='utf8') as f:
    json.dump(items, f, ensure_ascii=False, indent=4)
#
# for item in items:
#     name = item.get('name')
#
#     if name:
#         try:
#             url = f'{baseurl}:{port}{endpoint}{name.upper()}'
#             _json = {key: value.upper() if isinstance(value, str) else value for key, value in item.items()}
#             print(_json)
#             response = session.post(url, json=_json)
#             if response.status_code != 201:
#                 logger.error(f'{name} error: {response.status_code} - {response.json()}')
#         except:
#             logger.error('uncaught exception: %s', traceback.format_exc())
