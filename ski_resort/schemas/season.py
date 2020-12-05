from ma import ma

from models.season import SummerModel


class SummerSchema(ma.SQLAlchemyAutoSchema):
    class Meta:
        model = SummerModel
        load_instance = True
        strict = True
