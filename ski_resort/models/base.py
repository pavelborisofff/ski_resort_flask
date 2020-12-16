from typing import List

from ski_resort.db import db


class BaseModel(db.Model):
    __abstract__ = True
    __table_args__ = {'extend_existing': True}

    def save_to_db(self):
        db.session.add(self)
        try:
            db.session.commit()
        except:
            db.session.rollback()
            raise
        finally:
            db.session.close()

    def update(self, loads: dict):
        for key, value in loads.items():
            if hasattr(self, key):
                setattr(self, key, value)
        self.save_to_db()

    def delete_from_db(self):
        db.session.delete(self)
        try:
            db.session.commit()
        except:
            db.session.rollback()
            raise
        finally:
            db.session.close()

    @classmethod
    def find_by_name(cls, name: str) -> 'BaseModel':
        return cls.query.filter_by(name=name).first()

    @classmethod
    def find_by_id(cls, _id: int) -> 'BaseModel':
        return cls.query.filter_by(id=_id).first()

    @classmethod
    def find_all(cls) -> List['BaseModel']:
        return cls.query.all()
