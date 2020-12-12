import datetime
import random
import requests

from typing import Union

# SETTINGS
TZ = 3
URL = 'https://api.met.no/weatherapi/locationforecast/2.0/complete'
USER_AGENTS_LIST = 'user_agents.txt'

# LIST OF GEOLOCATIONS
POINTS = [
    {'name': 'РОЗА ДОЛИНА',
     'geonames': 'https://www.geonames.org/8555881/rosa-khutor-alpine-resort-valley.html',
     'coordinates': {'lat': 43.67229, 'lon': 40.29655, 'altitude': 560},
     },
]

# LIST OF KEYS TO GETTING DATA FROM YR.NO
WEATHER_NOW = ['weather_sky', 'weather_temp', 'wind_velocity', 'wind_direction']
WEATHER_DAY = ['weather_sky_day', 'weather_temp_day', 'wind_velocity_day', 'wind_direction_day']


def get_direction(degrees: float) -> str:
    sector = int(degrees // 22.5)
    directions = {
        0: 'N',
        1: 'NE',
        2: 'NE',
        3: 'E',
        4: 'E',
        5: 'SE',
        6: 'SE',
        7: 'S',
        8: 'S',
        9: 'SW',
        10: 'SW',
        11: 'W',
        12: 'W',
        13: 'NW',
        14: 'NW',
        15: 'N',
        16: 'N'
    }

    return directions.get(sector, '-')

def translate_sky(en_name: str) -> str:
    """
    Translate yr.no weather types to Rosa Khutor's types
    :param en_name:
    :return:
    """
    return {
        'clearsky': 'СОЛНЦЕ',
        'cloudy': 'ПАСМУРНО',
        'fair': 'ОБЛАЧНО',
        'fog': 'ПАСМУРНО',
        'heavyrain': 'ДОЖДЬ',
        'heavyrainandthunder': 'БУРЯ',
        'heavyrainshowers': 'ДОЖДЬ',
        'heavyrainshowersandthunder': 'БУРЯ',
        'heavysleet': 'ДОЖДЬ',
        'heavysleetandthunder': 'БУРЯ',
        'heavysleetshowers': 'ДОЖДЬ',
        'heavysleetshowersandthunder': 'БУРЯ',
        'heavysnow': 'СНЕГ',
        'heavysnowandthunder': 'СНЕГ',
        'heavysnowshowers': 'СНЕГ',
        'heavysnowshowersandthunder': 'СНЕГ',
        'lightrain': 'ДОЖДЬ',
        'lightrainandthunder': 'БУРЯ',
        'lightrainshowers': 'ДОЖДЬ',
        'lightrainshowersandthunder': 'БУРЯ',
        'lightsleet': 'ДОЖДЬ',
        'lightsleetandthunder': 'БУРЯ',
        'lightsleetshowers': 'ДОЖДЬ',
        'lightsnow': 'СНЕГ',
        'lightsnowandthunder': 'БУРЯ',
        'lightsnowshowers': 'СНЕГ',
        'lightssleetshowersandthunder': 'БУРЯ',
        'lightssnowshowersandthunder': 'БУРЯ',
        'partlycloudy': 'ОБЛАЧНО',
        'rain': 'ДОЖДЬ',
        'rainandthunder': 'БУРЯ',
        'rainshowers': 'ДОЖДЬ',
        'rainshowersandthunder': 'БУРЯ',
        'sleet': 'ДОЖДЬ',
        'sleetandthunder': 'БУРЯ',
        'sleetshowers': 'ДОЖДЬ',
        'sleetshowersandthunder': 'БУРЯ',
        'snow': 'СНЕГ',
        'snowandthunder': 'БУРЯ',
        'snowshowers': 'СНЕГ',
        'snowshowersandthunder': 'БУРЯ'
    }.get(en_name, 'None')


def utc_to_local(utc_dt: datetime.datetime) -> datetime.datetime:
    """
    Return UTC time converted to local time.
    :param utc_dt:
    :return:
    """
    return utc_dt.replace(tzinfo=datetime.timezone.utc).astimezone(tz=None)


def compare_hours(utc_time: str) -> bool:
    """
    Compare time from yr.no with current time.
    :param utc_time: str must be like '2020-12-11T21:06:52Z'
    :return: If difference more than 1 hour return False
    """
    try:
        to_local = utc_to_local(datetime.datetime.fromisoformat(utc_time[:-1]))
        local = datetime.datetime.now()
        return (local.hour - to_local.hour) in (0, 1)
    except ValueError as e:
        # logger.error(f'{utc_time} {e.args} {e.with_traceback()}')
        return True  # Because yr.no send current weather in first index


def get_weather_dict(data: dict) -> list[str, Union[str, int]]:
    """
    Get weather data structured yr.no json
    :param data:
    :return:
    """
    sky_period = data['data'].get('next_1_hours') or data['data'].get('next_6_hours')
    return [
        translate_sky(sky_period['summary']['symbol_code']),
        round(data['data']['instant']['details']['air_temperature']),
        round(data['data']['instant']['details']['wind_speed']),
        get_direction(data['data']['instant']['details']['wind_from_direction'])
    ]

def get_parsed_time(diff_to_utc: int = -3) -> list[str]:
    """
    Func to generate keys to search exactly time period into yr.no data
    :param diff_to_utc:
    :return:
    """
    template = '{}-{:0>2}-{:0>2}T{:0>2}:00:00Z'
    today = datetime.datetime.now() + datetime.timedelta(hours=diff_to_utc)
    next_one = today + datetime.timedelta(days=1)
    next_two = today + datetime.timedelta(days=2)
    next_three = today + datetime.timedelta(days=3)

    times = {
        range(0, 13):
            [
                template.format(today.year, today.month, today.day, today.hour),  # next one
                template.format(today.year, today.month, today.day, 12 + diff_to_utc),  # today day
                template.format(next_one.year, next_one.month, next_one.day, 6 + diff_to_utc),  # next one
                template.format(next_one.year, next_one.month, next_one.day, 12 + diff_to_utc),  # next one day
                template.format(next_two.year, next_two.month, next_two.day, 6 + diff_to_utc),  # next two
                template.format(next_two.year, next_two.month, next_two.day, 12 + diff_to_utc),  # next two day
                template.format(next_three.year, next_three.month, next_three.day, 12)  # next three
            ],
        range(12, 19):
            [
                template.format(today.year, today.month, today.day, today.hour),
                template.format(today.year, today.month, today.day, today.hour),  # next one
                template.format(next_one.year, next_one.month, next_one.day, 6 + diff_to_utc),  # next one
                template.format(next_one.year, next_one.month, next_one.day, 12 + diff_to_utc),  # next one day
                template.format(next_two.year, next_two.month, next_two.day, 6 + diff_to_utc),  # next two
                template.format(next_two.year, next_two.month, next_two.day, 12 + diff_to_utc),  # next two day
                template.format(next_three.year, next_three.month, next_three.day, 12)  # next three
            ],
        range(18, 25):
            [
                template.format(today.year, today.month, today.day, today.hour),  # next one (no next one day)
                template.format(next_one.year, next_one.month, next_one.day, 6 + diff_to_utc),  # next one
                template.format(next_one.year, next_one.month, next_one.day, 12 + diff_to_utc),  # next one day
                template.format(next_two.year, next_two.month, next_two.day, 6 + diff_to_utc),  # next two
                template.format(next_two.year, next_two.month, next_two.day, 12 + diff_to_utc),  # next two day
                template.format(next_three.year, next_three.month, next_three.day, 12)  # next three
            ]
    }

    for period in times:
        if today.hour in period:
            return times[period]



# Convert UTC time format to local\
# datetime.tzinfo.tzname()
# time_to_parse = '2020-12-11T21:06:52Z'
# utc_time = datetime.datetime.fromisoformat(time_to_parse[:-1])
# local_time = pytz.utc.localize(utc_time, is_dst=None).astimezone(pytz.timezone(TZ))

# List of local points

# Read list of user agents to rotate it while requesting
with open(USER_AGENTS_LIST, encoding='utf8') as f:
    headers_list = f.readlines()

session = requests.session()



# headers = {"User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36"}
# headers = {"User-Agent": random.choice(headers_list).strip()}
headers = {"User-Agent": 'for test reasons'}
params = POINTS[0]['coordinates']


for point in POINTS:
    try:
        params = point['coordinates']
        response = session.get(URL, params=params, headers=headers)
        if response and response.status_code == 200:
            weather_data = response.json().get('properties', {'result': None}).get('timeseries', {'result': None})
    except Exception as e:
        print(e)

    weather = {}

    # # for data in weather_data:
    # #     if not compare_time(data['time']):
    # #         next(weather_data)
    # #     else:
    # data_now = weather_data[0]
    if not compare_hours(weather_data[0]['time']):
        # logger.error(f'{data_now["time"]} CHECK TIME')
        pass

    if datetime.datetime.now().hour < 6:
        weather['weather_0_yrno'] = {k:v for k,v in zip(WEATHER_NOW, get_weather_dict(weather_data[0]))}
        weather['weather_0_yrno'].update({k: v for k, v in zip(WEATHER_DAY, get_weather_dict(weather_data[0]))})
    elif datetime.datetime.now().hour in range(12, 19):
        weather['now_day'] = weather['now']
    else:


    print(weather['now'])





