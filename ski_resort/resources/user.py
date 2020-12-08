from ski_resort.models.user import UserModel
from ski_resort.resources.item import Item, Items
from ski_resort.schemas.user import UserSchema


class User(Item):
    model = UserModel
    schema = UserSchema()


class Users(Items):
    model = UserModel
    schema = UserSchema(many=True)
