from models.user import UserModel
from resources.item import Item, Items
from schemas.user import UserSchema


class User(Item):
    model = UserModel
    schema = UserSchema()


class Users(Items):
    model = UserModel
    schema = UserSchema(many=True)
