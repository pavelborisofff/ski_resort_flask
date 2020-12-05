from typing import List

from db import db


class BaseModel(db.Model):
    __abstract__ = True

    def save_to_db(self):
        db.session.add(self)
        db.session.commit()

    def update(self, loads: dict):
        for key, value in loads.items():
            if hasattr(self, key):
                setattr(self, key, value)
        self.save_to_db()

    def delete_from_db(self):
        db.session.delete(self)
        db.session.commit()

    @classmethod
    def find_by_name(cls, name: str) -> 'BaseModel':
        return cls.query.filter_by(name=name).first()

    @classmethod
    def find_by_id(cls, _id: int) -> 'BaseModel':
        return cls.query.filter_by(id=_id).first()

    @classmethod
    def find_all(cls) -> List['BaseModel']:
        return cls.query.all()
