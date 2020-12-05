from ma import ma

from models.weather import *


class WeatherSchema(ma.SQLAlchemyAutoSchema):
    class Meta:
        load_instance = True
        strict = True


class WeatherZeroLocalSchema(WeatherSchema):
    class Meta(WeatherSchema.Meta):
        model = WeatherZeroLocalModel


class WeatherOneLocalSchema(WeatherSchema):
    class Meta(WeatherSchema.Meta):
        model = WeatherOneLocalModel


class WeatherTwoLocalSchema(WeatherSchema):
    class Meta(WeatherSchema.Meta):
        model = WeatherTwoLocalModel


class WeatherThreeLocalSchema(WeatherSchema):
    class Meta(WeatherSchema.Meta):
        model = WeatherThreeLocalModel
        dump_only = ('snow_state', 'snow_height', 'snow_height_new',
                     'snow_date', 'snow_avalanche')
        load_only = ('snow_state', 'snow_height', 'snow_height_new',
                     'snow_date', 'snow_avalanche')


class WeatherZeroYrnoSchema(WeatherSchema):
    class Meta(WeatherSchema.Meta):
        model = WeatherZeroYrnoModel


class WeatherOneYrnoSchema(WeatherSchema):
    class Meta(WeatherSchema.Meta):
        model = WeatherOneYrnoModel


class WeatherTwoYrnoSchema(WeatherSchema):
    class Meta(WeatherSchema.Meta):
        model = WeatherTwoYrnoModel


class WeatherThreeYrnoSchema(WeatherSchema):
    class Meta(WeatherSchema.Meta):
        model = WeatherThreeYrnoModel
        dump_only = ('snow_state', 'snow_height', 'snow_height_new',
                     'snow_date', 'snow_avalanche')
        load_only = ('snow_state', 'snow_height', 'snow_height_new',
                     'snow_date', 'snow_avalanche')
