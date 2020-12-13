from flask import Flask
from flask_restful import Api

from .config import Config
from .db import db
from .ma import ma

from .resources import item, season, user, weather


def create_app(config_class=Config):
    app = Flask(__name__)
    app.config.from_object(config_class)

    api = Api(app)

    db.init_app(app)
    ma.init_app(app)
    
    @app.before_first_request
    def create_tables():
        db.create_all()

    api.add_resource(item.Act, '/api/acts/<string:name>')
    api.add_resource(item.Acts, '/api/acts')
    api.add_resource(item.Slope, '/api/slopes/<string:name>')
    api.add_resource(item.Slopes, '/api/slopes')
    api.add_resource(item.Lift, '/api/lifts/<string:name>')
    api.add_resource(item.Lifts, '/api//lifts')
    api.add_resource(user.User, '/api/users/<string:name>')
    api.add_resource(user.Users, '/api/users')

    api.add_resource(weather.Weather, '/api/point_weather/<string:kind>/<string:name>/<int:day>')
    api.add_resource(weather.WeatherDay, '/api/point_weather/<string:kind>/<int:day>')

    api.add_resource(season.Summer, '/api/season')

    return app
