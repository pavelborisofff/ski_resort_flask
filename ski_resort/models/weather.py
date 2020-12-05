from db import db
from item import ResortItemModel


class WeatherModel(ResortItemModel):
    __abstract__ = True

    # Weather
    weather_sky = db.Column(db.String(80), default='-')
    weather_temp = db.Column(db.Integer, default=0)
    weather_sky_day = db.Column(db.String(80), default='-')
    weather_temp_day = db.Column(db.Integer, default=0)

    # Wind
    wind_velocity = db.Column(db.Integer, default=0)
    wind_direction = db.Column(db.String(20), default='-')


class WeatherZeroModel(ResortItemModel):
    __abstract__ = True

    # Weather
    weather_sky = db.Column(db.String(80), default='-')
    weather_temp = db.Column(db.Integer, default=0)
    weather_sky_day = db.Column(db.String(80), default='-')
    weather_temp_day = db.Column(db.Integer, default=0)

    # Wind
    wind_velocity = db.Column(db.Integer, default=0)
    wind_direction = db.Column(db.String(20), default='-')

    # Snow
    snow_state = db.Column(db.String(80), default='-')
    snow_height = db.Column(db.Integer, default=0)
    snow_height_new = db.Column(db.Integer, default=0)
    snow_date = db.Column(db.String(20), default='-')
    snow_avalanche = db.Column(db.String(20), default='-')


class WeatherZeroLocalModel(WeatherZeroModel):
    __tablename__ = 'weather_0_local'


class WeatherOneLocalModel(WeatherZeroModel):
    __tablename__ = 'weather_1_local'


class WeatherTwoLocalModel(WeatherZeroModel):
    __tablename__ = 'weather_2_local'


class WeatherThreeLocalModel(WeatherModel):
    __tablename__ = 'weather_3_local'


class WeatherZeroYrnoModel(WeatherZeroModel):
    __tablename__ = 'weather_0_yrno'


class WeatherOneYrnoModel(WeatherZeroModel):
    __tablename__ = 'weather_1_yrno'


class WeatherTwoYrnoModel(WeatherZeroModel):
    __tablename__ = 'weather_2_yrno'


class WeatherThreeYrnoModel(WeatherModel):
    __tablename__ = 'weather_3_yrno'