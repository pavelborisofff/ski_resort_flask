from ski_resort.ma import ma

from ski_resort.models.season import SummerModel


class SummerSchema(ma.SQLAlchemyAutoSchema):
    class Meta:
        model = SummerModel
        load_instance = True
        strict = True
