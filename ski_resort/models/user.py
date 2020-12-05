from db import db
from item import ResortItemModel


class UserModel(ResortItemModel):
    __tablename__ = 'users'

    admin = db.Column(db.Boolean, default=False)
