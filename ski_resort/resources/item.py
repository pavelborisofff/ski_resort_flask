from flask import request
from flask_restful import Resource

from ski_resort.schemas.item import *
from ski_resort.models.item import *


SUCCESSFULLY_UPDATED = '{obj} \'{name}\' successfully updated'
ALREADY_EXISTS = '{obj} \'{name}\' already exists'
NOT_FOUND = '{obj} \'{name}\' not found'
ERROR_DATABASE = 'Error database: {err}'
ITEM_DELETED = '{obj} \'{name}\' deleted'
BAD_DAY_FORMAT = '{obj} \'{name}\' check day'


class Item(Resource):
    @classmethod
    def get(cls, name: str) -> (dict, int):
        item = cls.model.find_by_name(name=name)

        if item:
            return {k: v for k, v in cls.schema.dump(item).items() if v}, 200

        return {'message': NOT_FOUND.format(obj=cls.__name__, name=name)}, 404

    @classmethod
    def get_by_id(cls, _id: int) -> dict:
        item = cls.model.find_by_id(_id=_id)

        if item:
            return {k: v for k, v in cls.schema.dump(item).items() if v}

        return {'message': NOT_FOUND.format(obj=cls.__name__, name=_id)}

    @classmethod
    def update(cls, _id: int, data: dict) -> (dict, int):
        item_loads = cls.schema.load(data)

        item = cls.model.find_by_id(_id=_id)

        if item:
            try:
                item.update(data)
                return {'item': {k: v for k, v in cls.schema.dump(item_loads).items() if v},
                        'message': SUCCESSFULLY_UPDATED.format(obj=cls.__name__, name=_id)}, 201
            except Exception as e:
                return {'item': {k: v for k, v in cls.schema.dump(item_loads).items() if v},
                        'message': ERROR_DATABASE.format(err=e),
                        'error': e}, 500

        return {"message": NOT_FOUND.format(obj=cls.__name__, name=_id)}, 404

    @classmethod
    def post(cls, name: str) -> (dict, int):
        if cls.model.find_by_name(name=name):
            return {'message': ALREADY_EXISTS.format(obj=cls.__name__, name=name)}, 400

        item_json = request.get_json()
        item_json['name'] = name

        item = cls.schema.load(item_json)

        try:
            item.save_to_db()
        except Exception as e:
            return {'message': ERROR_DATABASE.format(err=e)}, 500

        return {k: v for k, v in cls.schema.dump(item).items() if v}, 201

    @classmethod
    def put(cls, name: str) -> (dict, int):
        item_json = request.get_json()
        item_loads = cls.schema.load(item_json)

        item = cls.model.find_by_name(name=name)

        if item:
            try:
                item.update(item_json)
                return {'item': {k: v for k, v in cls.schema.dump(item_loads).items() if v},
                        'message': SUCCESSFULLY_UPDATED.format(obj=cls.__name__, name=name)}, 201
            # except marshmallow.exceptions as e:
            #     return {'ma_error': ERROR_DATABASE.format(err=e)}, 400
            except Exception as e:
                return {'item': {k: v for k, v in cls.schema.dump(item_loads).items() if v},
                        'message': ERROR_DATABASE.format(err=e),
                        'error': e}, 500

        return {"message": NOT_FOUND.format(obj=cls.__name__, name=name)}, 404



    @classmethod
    def delete(cls, name: str) -> (dict, int):
        item = cls.model.find_by_name(name)

        if item:
            try:
                item.delete_from_db()
                return {'message': ITEM_DELETED.format(obj=cls.__name__, name=name)}, 200
            except Exception as e:
                return {'message': ERROR_DATABASE.format(err=e)}, 500

        return {'message': NOT_FOUND.format(obj=cls.__name__, name=name)}, 404


class Act(Item):
    model = ActModel
    schema = ActSchema()


class Slope(Item):
    model = SlopeModel
    schema = SlopeSchema()


class Lift(Item):
    model = LiftModel
    schema = LiftSchema()


class Items(Resource):
    @classmethod
    def get(cls) -> (dict, int):
        return {cls.__name__.lower():
                [{k: v for k, v in x.items() if v} for x in cls.schema.dump(cls.model.find_all())]}, 200


class Acts(Items):
    model = ActModel
    schema = ActSchema(many=True)


class Slopes(Items):
    model = SlopeModel
    schema = SlopeSchema(many=True)


class Lifts(Items):
    model = LiftModel
    schema = LiftSchema(many=True)
