from flask_login import UserMixin

from db import db
from item import ResortItemModel


class UserModel(UserMixin, ResortItemModel):
    __tablename__ = 'users'

    admin = db.Column(db.Boolean, default=False)
    password = db.Column(db.String(40), nullable=False)

    def check_password(self, password: str):
        return password == self.find_by_name(name=self.name).password

    def __repr__(self):
        return f'User {self.name}'
