import datetime
import random
import requests

from typing import Union

# SETTINGS
TZ = 3  # Difference between local and UTC time, hours
URL = 'https://api.met.no/weatherapi/locationforecast/2.0/complete'  # yr.no API endpoint
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
    Translate yr.no weather types to Rosa Khutor's types
    :param en_name: 'clearsky_day' -> 'clearsky'
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
        # logger.error(f'{utc_time} {e.args} {e.with_traceback()}')
        return True  # Because yr.no send current weather in first index


def get_weather_conds(data: dict) -> list[str, Union[str, int]]:
    """
    Get weather data structured yr.no json
    :param data: {'time': '2020-12-12T19:00:00Z', 'data': {'instant': {'details': {'air_pressure_at_sea_level': 17.0}}}}
    :return: []
    """
    sky_period = data['data'].get('next_1_hours') or data['data'].get('next_6_hours')
    return [
        translate_sky(sky_period['summary']['symbol_code']),
        round(data['data']['instant']['details']['air_temperature']),
        round(data['data']['instant']['details']['wind_speed']),
        get_direction(data['data']['instant']['details']['wind_from_direction'])
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



# Convert UTC time format to local\
# datetime.tzinfo.tzname()
# time_to_parse = '2020-12-11T21:06:52Z'
# utc_time = datetime.datetime.fromisoformat(time_to_parse[:-1])
# local_time = pytz.utc.localize(utc_time, is_dst=None).astimezone(pytz.timezone(TZ))

# List of local points

# Read list of user agents to rotate it while requesting

# Preparation to operate
with open(USER_AGENTS_LIST, encoding='utf8') as f:
    headers_list = f.readlines()
headers = {"User-Agent": 'for test reasons'}

session = requests.session()



# headers = {"User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36"}
# headers = {"User-Agent": random.choice(headers_list).strip()}



for point in POINTS:
    try:
        params = point['coordinates']
        response = session.get(URL, params=params, headers=headers)
        if response and response.status_code == 200:
            weather_data = response.json().get('properties', {'result': None}).get('timeseries', {'result': None})
    except Exception as e:
        print(e)

    strftime_list = get_strftime()
    periods = [data for data in weather_data if data.get('time') in strftime_list]

    weather = {
        'weather_0_yrno': {},
        'weather_1_yrno': {},
        'weather_2_yrno': {}
    }

    for day in range(0, 2):
        for i, period in enumerate(periods[:-1]):
            print(day, i, period)
            if i % 2:
                weather[f'weather_{day}_yrno'].update({k: v for k, v in zip(WEATHER_DAY, get_weather_conds(period))})
            else:
                weather[f'weather_{day}_yrno'].update({k: v for k, v in zip(WEATHER_NOW, get_weather_conds(period))})
        # {k: v for k, v in zip(WEATHER_NOW, get_weather_conds(period))}

    # if not compare_hours(weather_data[0]['time']):
    #     # logger.error(f'{data_now["time"]} CHECK TIME')
    #     pass

    # if datetime.datetime.now().hour < 6:
    #     weather['weather_0_yrno'] = {k:v for k,v in zip(WEATHER_NOW, get_weather_conds(weather_data[0]))}
    #     weather['weather_0_yrno'].update({k: v for k, v in zip(WEATHER_DAY, get_weather_conds(weather_data[0]))})
    # elif datetime.datetime.now().hour in range(12, 19):
    #     weather['now_day'] = weather['now']
    # else:


    print(weather)





