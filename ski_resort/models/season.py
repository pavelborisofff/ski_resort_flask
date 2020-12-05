from db import db
from models.base import BaseModel


class SummerModel(BaseModel):
    __tablename__ = 'summer'

    id = db.Column(db.Integer, primary_key=True)
    first_day = db.Column(db.Integer, default=135)
    last_day = db.Column(db.Integer, default=335)
