from flask import request
from flask_restful import Resource

from schemas.weather import *


SUCCESSFULLY_UPDATED = '{obj} \'{name}\' \'{day}\' successfully updated'
ALREADY_EXISTS = '{obj} \'{name}\' already exists'
NOT_FOUND = '{obj} \'{name}\' not found'
ERROR_DATABASE = 'Error database: {err}'
ITEM_DELETED = '{obj} \'{name}\' deleted'
BAD_DAY_FORMAT = '{obj} \'{day}\' check day'
BAD_SOURCE_FORMAT = '{obj} \'{kind}\' check source'


class Weather(Resource):
    obj_choice = {
        'local': {
            'models_list': [
                WeatherZeroLocalModel,
                WeatherOneLocalModel,
                WeatherTwoLocalModel,
                WeatherThreeLocalModel
            ],
            'schema_list': [
                WeatherZeroLocalSchema,
                WeatherOneLocalSchema,
                WeatherTwoLocalSchema,
                WeatherThreeLocalSchema
            ]
        },
        'yrno': {
            'models_list': [
                WeatherZeroYrnoModel,
                WeatherOneYrnoModel,
                WeatherTwoYrnoModel,
                WeatherThreeYrnoModel
            ],
            'schema_list': [
                WeatherZeroYrnoSchema,
                WeatherOneYrnoSchema,
                WeatherTwoYrnoSchema,
                WeatherThreeYrnoSchema
            ]
        }
    }

    @classmethod
    def check_params(cls, kind: str, day: int):
        if kind not in cls.obj_choice:
            return {'message': BAD_SOURCE_FORMAT.format(obj=cls.__name__, kind=kind)}, 400

        if day > len(cls.obj_choice[kind]['models_list']):
            return {'message': BAD_DAY_FORMAT.format(obj=cls.__name__, day=day)}, 400

        cls.model = cls.obj_choice[kind]['models_list'][day]

    @classmethod
    def get(cls, kind: str, name: str, day: int) -> (dict, int):
        result = cls.check_params(kind, day)

        if result:
            return result

        weather = cls.model.find_by_name(name=name)

        if weather:
            schema = cls.obj_choice[kind]['schema_list'][day]()
            return {k: v for k, v in schema.dump(weather).items() if v}, 200

        return {'message': NOT_FOUND.format(obj=cls.__name__, name=name)}, 404

    @classmethod
    def post(cls, kind: str, name: str, day: int) -> (dict, int):
        result = cls.check_params(kind, day)

        if result:
            return result

        weather_json = request.get_json()
        weather_json['name'] = name

        print(kind, name, day)

        schema = cls.obj_choice[kind]['schema_list'][day]()
        weather = schema.load(weather_json)

        try:
            weather.save_to_db()
        except Exception as e:
            return {'message': ERROR_DATABASE.format(err=e)}, 500

        return {k: v for k, v in schema.dump(weather).items() if v}, 201

    @classmethod
    def put(cls, kind: str, name: str, day: int) -> (dict, int):
        result = cls.check_params(kind, day)

        if result:
            return result

        weather_json = request.get_json()
        schema = cls.obj_choice[kind]['schema_list'][day]()
        weather_loads = schema.load(weather_json)

        weather = cls.model.find_by_name(name=name)

        if weather:
            try:
                weather.update(weather_json)

                return {'item': {k: v for k, v in schema.dump(weather_loads).items() if v},
                        'message': SUCCESSFULLY_UPDATED.format(obj=cls.__name__, name=name, day=day)}, 201
            except Exception as e:
                return {'item': {k: v for k, v in schema.dump(weather_loads).items() if v},
                        'message': ERROR_DATABASE.format(err=e),
                        'error': e}, 500

        return {'message': NOT_FOUND.format(obj=cls.__name__, name=name)}, 404

    @classmethod
    def delete(cls, kind: str, name: str, day: int) -> (dict, int):
        result = cls.check_params(kind, day)

        if result:
            return result

        weather = cls.model.find_by_name(name=name)

        if weather:
            try:
                weather.delete_from_db()
                return {'message': ITEM_DELETED.format(obj=cls.__name__, name=name)}, 200
            except Exception as e:
                return {'message': ERROR_DATABASE.format(err=e)}, 500

        return {'message': NOT_FOUND.format(obj=cls.__name__, name=name)}, 404


class WeatherDay(Weather):

    @classmethod
    def get(cls, kind: str, day: int, name=None) -> (dict, int):
        result = cls.check_params(kind, day)

        if result:
            return result

        schema = cls.obj_choice[kind]['schema_list'][day](many=True)

        return {cls.__name__.lower():
                [{k: v for k, v in x.items() if v} for x in schema.dump(cls.model.find_all())]}, 200
