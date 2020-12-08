from ski_resort.db import db
# from resort_item import ResortItemModel


class TechModel(db.Model):
    __abstract__ = True

    name = db.Column(db.String(20), primary_key=True)
    code = db.Column(db.String(5), unique=True, nullable=False)


class StatusModel(TechModel):
    __tablename__ = 'status'


class DifficultModel(TechModel):
    __tablename__ = 'difficult'


class KindModel(TechModel):
    __tablename__ = 'kind'


def create_table(model, data: dict):
    type(model).__name__ = model(**data)

    return type(model).__name__
    # admin = UserModel('admin', 'test')
    # guest = UserModel('guest', 'test'

# open = db.Column('OO')
# paused = db.Column('P')
# closed = db.Column('C')
# out_of_order = db.Column('OO')

# green = 'G'
# blue = 'B'
# red = 'R'
# black = 'B'

# park = 'PARK'
# tc = 'TC'
# tk = 'TK'
# tr = 'TR'
# ts = 'TS'
# tsd = 'TSD'