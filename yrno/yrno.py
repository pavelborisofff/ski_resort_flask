import datetime
import json
import random
import requests
import traceback

from typing import Union

from ski_resort.tools.tech import init_logger

# SETTINGS
TZ = 3  # Difference between local and UTC time, hours
URL = 'https://api.met.no/weatherapi/locationforecast/2.0/complete'  # yr.no API endpoint
USER_AGENTS_LIST = 'user_agents.txt'
API_URL = 'http://localhost'
API_PORT = 5001
ENDPOINT = '/api/weather/{kind}/{name}/{day}'

# LIST OF GEOLOCATIONS
POINTS = [
    {'name': 'РОЗА ДОЛИНА',
     'geonames': 'https://www.geonames.org/8555881/rosa-khutor-alpine-resort-valley.html',
     'coordinates': {'lat': 43.67229, 'lon': 40.29655, 'altitude': 560},
     },
    {'name': 'РОЗА СТАДИОН',
     'geonames': 'https://www.geonames.org/8533848/rosa-khutor-alpine-center-finish-940.html',
     'coordinates': {'lat': 43.64666, 'lon': 40.3321, 'altitude': 940},
     },
    {'name': 'ГОРНАЯ ОЛИМПИЙСКАЯ ДЕРЕВНЯ',
     'geonames': 'https://www.geonames.org/8533845/rosa-khutor-plateau-1170.html',
     'coordinates': {'lat': 43.65819, 'lon': 40.31934, 'altitude': 1170},
     },
    {'name': 'РОЗА 1600',
     'geonames': 'https://www.geonames.org/8532034/rosa-khutor-1600.html',
     'coordinates': {'lat': 43.63865, 'lon': 40.31223, 'altitude': 1600},
     },
    {'name': 'РОЗА ПИК',
     'geonames': 'https://www.geonames.org/8533851/rosa-khutor-peak-2320.html',
     'coordinates': {'lat': 43.62506, 'lon': 40.31019, 'altitude': 2320},
     },
    {'name': 'ЮЖНЫЙ СКЛОН',
     'geonames': 'https://www.geonames.org/874880/urochishche-kamennyy-stolb.html',
     'coordinates': {'lat': 43.60472, 'lon': 40.31139, 'altitude': 1925},
     }
]

# LIST OF KEYS TO GETTING DATA FROM YR.NO
WEATHER_NOW = ['weather_sky', 'weather_temp', 'wind_velocity', 'wind_direction']
WEATHER_DAY = ['weather_sky_day', 'weather_temp_day', 'wind_velocity_day', 'wind_direction_day']


def get_direction(degrees: float) -> str:
    """
    Convert wind direction degrees to characters
    :param degrees: 123,5
    :return: 'SE'
    """
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


def translate_sky(symbol_code: str) -> str:
    """
    Translate yr.no point_weather types to Rosa Khutor's types
    :param symbol_code: 'clearsky_day' -> 'clearsky'
    :return: 'СОЛНЦЕ' or 'None'
    """
    en_name = symbol_code.split('_')[0]

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
    Return UTC time converted to local time. Like 06:00:00 UTC == 09:00:00 GMT+3
    :param utc_dt: datetime.datetime.utcnow() -> datetime.datetime(2020, 12, 12, 21, 49, 15, 663953)
    :return: datetime.datetime(2020, 12, 13, 0, 50, 9, 563725,
    tzinfo=datetime.timezone(datetime.timedelta(seconds=10800), 'MSK'))
    """
    return utc_dt.replace(tzinfo=datetime.timezone.utc).astimezone(tz=None)


def compare_hours(utc_time: str) -> bool:
    """
    Compare time from yr.no with current time.
    :param utc_time: str must be like '2020-12-11T21:06:52Z'
    :return: True or if difference more than 1 hour return False
    """
    try:
        to_local = utc_to_local(datetime.datetime.fromisoformat(utc_time[:-1]))
        local = datetime.datetime.now()
        return (local.hour - to_local.hour) in (0, 1)
    except ValueError as e:
        logger.error(f'{utc_time} {e.args} {traceback.format_exc()}')
        return True  # Because yr.no send current point_weather in first index


def get_weather_conds(_data: dict) -> list[Union[str, int]]:
    """
    Get point_weather data structured yr.no json
    :param _data: {'time': '2020-12-12T19:00:00Z', 'data': {'instant': {'details': {'air_pressure_at_sea_level': 17.0}}}}
    :return: []
    """
    sky_period = _data['data'].get('next_1_hours') or _data['data'].get('next_6_hours')
    return [
        translate_sky(sky_period['summary']['symbol_code']),
        round(_data['data']['instant']['details']['air_temperature']),
        round(_data['data']['instant']['details']['wind_speed']),
        get_direction(_data['data']['instant']['details']['wind_from_direction'])
    ]


def get_strftime(diff_to_utc: int = -3) -> list[str]:
    """
    Generate keys to search exactly time periods into yr.no data
    :param diff_to_utc:
    :return:
    """
    template = '{}-{:0>2}-{:0>2}T{:0>2}:00:00Z'
    today = datetime.datetime.now() + datetime.timedelta(hours=diff_to_utc)
    next_one = today + datetime.timedelta(days=1)
    next_two = today + datetime.timedelta(days=2)
    next_three = today + datetime.timedelta(days=3)

    hours_ranges = {
        range(0, 13):
            [
                template.format(today.year, today.month, today.day, today.hour),  # today
                template.format(today.year, today.month, today.day, 12 + diff_to_utc),  # today day
                template.format(next_one.year, next_one.month, next_one.day, 6 + diff_to_utc),  # next one
                template.format(next_one.year, next_one.month, next_one.day, 12 + diff_to_utc),  # next one day
                template.format(next_two.year, next_two.month, next_two.day, 6 + diff_to_utc),  # next two
                template.format(next_two.year, next_two.month, next_two.day, 12 + diff_to_utc),  # next two day
                template.format(next_three.year, next_three.month, next_three.day, 12)  # next three
            ],
        range(12, 25):
            [
                template.format(today.year, today.month, today.day, today.hour),  # next one
                template.format(today.year, today.month, today.day, today.hour),  # today day
                template.format(next_one.year, next_one.month, next_one.day, 6 + diff_to_utc),  # next one
                template.format(next_one.year, next_one.month, next_one.day, 12 + diff_to_utc),  # next one day
                template.format(next_two.year, next_two.month, next_two.day, 6 + diff_to_utc),  # next two
                template.format(next_two.year, next_two.month, next_two.day, 12 + diff_to_utc),  # next two day
                template.format(next_three.year, next_three.month, next_three.day, 12)  # next three
            ]
    }

    for hour_range in hours_ranges:
        if today.hour in hour_range:
            return hours_ranges[hour_range]


def get_point_weather(_weather_data: list[dict]) -> dict[Union[int, dict]]:
    """
    Parse point's weather from yr.no by exactly time periods
    :param _weather_data: {'time': '2020-12-13T07:00:00Z', 'data': {…}}, {'time': '2020-12-13T08:00:00Z', 'data': {…}}]
    :return: {'weather_0_yrno': {'weather_sky': 'ОБЛАЧНО', 'weather_temp': 8}}…
    """
    strftime_list = get_strftime()

    periods = []
    for item in strftime_list:
        for _data in _weather_data:
            if _data.get('time') == item:
                periods.append(_data, )

    _point_weather = {
        0: {},
        1: {},
        2: {},
        3: {}
    }

    for i, period in enumerate(periods):

        if i % 2:  # Odd
            _point_weather[i // 2].update(
                {k: v for k, v in zip(WEATHER_DAY, get_weather_conds(period))})
        else:  # Even
            _point_weather[i // 2].update(
                {k: v for k, v in zip(WEATHER_NOW, get_weather_conds(period))})

    return _point_weather


def send_to_api(_name: str, _weather: dict[dict], _day: int,
                api_url: str = 'http://localhost',
                port: int = 5001,
                endpoint: str = '/api/weather/{kind}/{name}/{day}'):
    """
    Sending data about resort's weather to DB via API, for exact day and location
    :param _name: 'ЮЖНЫЙ СКЛОН'
    :param _weather: {'weather_sky': 'ПАСМУРНО', 'weather_temp': -2, …}
    :param _day: 0-3 in this case
    :param api_url: API base url
    :param port: API port
    :param endpoint: API endpoint
    :return: True in case completed update info via API
    """

    url = f'{api_url}:{port}{endpoint.format(kind="yrno", name=_name, day=_day)}'

    try:
        _json = _weather
        _response = session.put(url, json=_json)

        if _response.status_code != 201:
            logger.error(f'{_name} error: {_response.status_code} - {_response.json()} {traceback.format_exc()}')
        else:
            return True

    except:
        logger.error(f'uncaught exception: {traceback.format_exc()}')


def main():
    # Preparation to operate
    # logger = init_logger('yrno.py')
    # session = requests.session()

    # Read list of user agents to rotate it while requesting
    with open(USER_AGENTS_LIST, encoding='utf8') as f:
        headers_list = f.readlines()
    headers = {"User-Agent": random.choice(headers_list).strip()}
    # headers = {"User-Agent": 'for test reasons'}

    points_weather = {point['name']: {} for point in POINTS}

    for point in POINTS:
        try:
            params = point['coordinates']
            response = session.get(URL, params=params, headers=headers, timeout=3)

            if response and response.status_code == 200:

                try:
                    weather_data = response.json().get('properties', {'result': None}).get('timeseries', {'result': None})
                except json.decoder.JSONDecodeError as e:
                    weather_data = None
                    logger.error(f'Weather data is not json: {e.args} {traceback.format_exc()}')

                if weather_data:
                    point_weather = get_point_weather(weather_data)
                    points_weather[point['name']] = point_weather
                else:
                    logger.error(f'Not weather data')
                    logger.error(f'Not weather data: {traceback.format_exc()}')

            else:
                logger.warning(f'STATUS CODE: {response.status_code} MESSAGE: {response.json() or response.text}')

        except Exception as e:
            logger.error(f'{point["name"]}')
            logger.error(f'uncaught exception: {traceback.format_exc()}')


    for name, data in points_weather.items():
        for day, weather in data.items():
            result = send_to_api(name, data, day, API_URL, API_PORT, ENDPOINT)

            if result:
                logger.info(f'{name} {day} {weather}')

if __name__ == '__main__':
    # Preparation to operate
    logger = init_logger('yrno.py')
    session = requests.session()
    main()
