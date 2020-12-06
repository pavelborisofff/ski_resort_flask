import enum
import datetime

from db import db
from base import BaseModel


class StatusEnum(enum.Enum):
    open = 'O'
    paused = 'P'
    closed = 'C'
    out_of_order = 'OO'


class DifficultEnum(enum.Enum):
    green = 'G'
    blue = 'B'
    red = 'R'
    black = 'B'


class KindEnum(enum.Enum):
    park = 'PARK'
    tc = 'TC'
    tk = 'TK'
    tr = 'TR'
    ts = 'TS'
    tsd = 'TSD'


class ResortItemModel(BaseModel):
    __abstract__ = True

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), unique=True)
    updated = db.Column(db.String(40))
    inactive = db.Column(db.Boolean, default=False)

    def save_to_db(self):
        self.updated = datetime.datetime.now()
        db.session.add(self)
        db.session.commit()


class ItemModel(ResortItemModel):
    __abstract__ = True

    status = db.Column(db.String(2), default='OO')
    open_from = db.Column(db.String(5), default='-')
    open_till = db.Column(db.String(5), default='-')
    # status = db.Column(db.Enum(StatusEnum), default=StatusEnum.out_of_order)
    # open_from = db.Column(db.TIME, default=datetime.time(hour=00, minute=00), nullable=True)
    # open_till = db.Column(db.TIME, default=datetime.time(hour=23, minute=59), nullable=True)


class ActModel(ItemModel):
    __tablename__ = 'acts'

    icon = db.Column(db.String(80))

    def __repr__(self):
        return f'Act {self.name}'


class SlopeModel(ItemModel):
    __tablename__ = 'slopes'

    difficult = db.Column(db.String(10), default='green')
    length = db.Column(db.Integer)
    height = db.Column(db.Integer)
    night = db.Column(db.Boolean, default=False)

    def __repr__(self):
        return f'Slope {self.name}'


class LiftModel(ItemModel):
    __tablename__ = 'lifts'

    night = db.Column(db.Boolean, default=False)
    night_open_from = db.Column(db.String(5), default='19:00')
    night_open_till = db.Column(db.String(5), default='22:45')
    summer = db.Column(db.Boolean, default=False)
    add_time = db.Column(db.String(50), default=None)
    add_time_open_from = db.Column(db.String(5), default=None)
    add_time_open_till = db.Column(db.String(5), default=None)
    last_up0 = db.Column(db.String(50), default=None)
    last_up0_open_from = db.Column(db.String(5), default=None)
    last_up0_open_till = db.Column(db.String(5), default=None)
    last_up1 = db.Column(db.String(50), default=None)
    last_up1_open_from = db.Column(db.String(5), default=None)
    last_up1_open_till = db.Column(db.String(5), default=None)
    last_up2 = db.Column(db.String(50), default=None)
    last_up2_open_from = db.Column(db.String(5), default=None)
    last_up2_open_till = db.Column(db.String(5), default=None)
    last_up3 = db.Column(db.String(50), default=None)
    last_up3_open_from = db.Column(db.String(5), default=None)
    last_up3_open_till = db.Column(db.String(5), default=None)

    def __repr__(self):
        return f'Lift {self.name}'
