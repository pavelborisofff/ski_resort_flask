from ski_resort.ma import ma

from ski_resort.models.item import ActModel, SlopeModel, LiftModel


class ItemSchema(ma.SQLAlchemyAutoSchema):
    class Meta:
        load_instance = True
        strict = True


class ActSchema(ItemSchema):
    class Meta(ItemSchema.Meta):
        model = ActModel


class SlopeSchema(ItemSchema):
    class Meta(ItemSchema.Meta):
        model = SlopeModel
        # dump_only = ('open_from', 'open_till')
        # load_only = ('open_from', 'open_till')


class LiftSchema(ItemSchema):
    class Meta(ItemSchema.Meta):
        model = LiftModel



