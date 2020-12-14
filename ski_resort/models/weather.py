from ski_resort.db import db
from ski_resort.models.base import BaseModel
from ski_resort.models.item import ResortItemModel


class ValriskModel(BaseModel):
    __tablename__ = 'valrisk'

    id = db.Column(db.Integer, primary_key=True)
    value = db.Column(db.String(80), default='-')


class WeatherSourceModel(BaseModel):
    __tablename__ = 'weather_source'

    id = db.Column(db.Integer, primary_key=True)
    local = db.Column(db.Boolean, default=False)


class WeatherModel(ResortItemModel):
    __abstract__ = True

    height = db.Column(db.Integer)

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

    height = db.Column(db.Integer)

    # Weather
    weather_sky = db.Column(db.String(80), default='-')
    weather_temp = db.Column(db.Integer, default=0)
    weather_sky_day = db.Column(db.String(80), default='-')
    weather_temp_day = db.Column(db.Integer, default=0)

    # Wind
    wind_velocity = db.Column(db.Integer, default=0)
    wind_direction = db.Column(db.String(20), default='-')
    wind_velocity_day = db.Column(db.Integer, default=0)
    wind_direction_day = db.Column(db.String(20), default='-')

    # Snow
    snow_state = db.Column(db.String(80), default='-')
    snow_height = db.Column(db.Integer, default=0)
    snow_height_new = db.Column(db.Integer, default=0)
    snow_date = db.Column(db.String(20), default='-')
    snow_avalanche = db.Column(db.Integer, default=0)


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
