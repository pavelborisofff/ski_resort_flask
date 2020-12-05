from flask import Flask
from flask_restful import Api

from config import Config
from db import db
from ma import ma

from resources import item, season, user, weather


def create_app(config_class=Config):
    app = Flask(__name__)
    app.config.from_object(config_class)

    api = Api(app)

    db.init_app(app)
    ma.init_app(app)

    @app.before_first_request
    def create_tables():
        db.create_all()

    api.add_resource(item.Act, '/acts/<string:name>')
    api.add_resource(item.Acts, '/acts')
    api.add_resource(item.Slope, '/slopes/<string:name>')
    api.add_resource(item.Slopes, '/slopes')
    api.add_resource(item.Lift, '/lifts/<string:name>')
    api.add_resource(item.Lifts, '/lifts')
    api.add_resource(user.User, '/users/<string:name>')
    api.add_resource(user.Users, '/users')

    api.add_resource(weather.Weather, '/weather/<string:kind>/<string:name>/<int:day>')
    api.add_resource(weather.WeatherDay, '/weather/<string:kind>/<int:day>')

    api.add_resource(season.Summer, '/season')

    return app
