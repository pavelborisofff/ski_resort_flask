from datetime import datetime
from flask import request
from flask_restful import Resource

from ski_resort.models.season import SummerModel
from ski_resort.schemas.season import SummerSchema


NOT_FOUND = '{obj} check endpoint'
ERROR_DATABASE = 'Error database: {err}'
SUCCESSFULLY_UPDATED = '{obj} successfully updated'


class Summer(Resource):
    model = SummerModel
    schema = SummerSchema()

    @classmethod
    def get(cls) -> (dict, int):
        summer = cls.model.find_by_id(_id=1)
        summer_json = {k: v for k, v in cls.schema.dump(summer).items() if v}

        if summer:
            summer_dates = range(summer_json.get('first_day', 135), summer_json.get('last_day', 335))
            today = datetime.now().timetuple().tm_yday

            return {'today': 'summer' if today in summer_dates else 'winter'}, 200

        return {'message': NOT_FOUND.format(obj=cls.__name__, name='summer')}, 404

    @classmethod
    def post(cls) -> (dict, int):

        summer_json = request.get_json()
        summer = cls.schema.load(summer_json)

        try:
            summer.save_to_db()
        except Exception as e:
            return {'message': ERROR_DATABASE.format(err=e)}, 500

        return {k: v for k, v in cls.schema.dump(summer).items() if v}, 201

    @classmethod
    def put(cls) -> (dict, int):
        summer_json = request.get_json()
        summer_loads = cls.schema.load(summer_json)

        summer = cls.model.find_by_id(_id=1)

        if summer:
            try:
                summer.update(summer_json)
                return {'item': {k: v for k, v in cls.schema.dump(summer_loads).items() if v},
                        'message': SUCCESSFULLY_UPDATED.format(obj=cls.__name__)}, 201
            except Exception as e:
                return {'item': {k: v for k, v in cls.schema.dump(summer_loads).items() if v},
                        'message': ERROR_DATABASE.format(err=e),
                        'error': e}, 500

        return {"message": NOT_FOUND.format(obj=cls.__name__)}, 404
