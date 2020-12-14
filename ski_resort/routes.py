import datetime

import requests

from flask import request, flash, redirect, url_for, render_template, session, send_from_directory, jsonify, Response, \
    make_response
from flask_login import current_user, login_user, logout_user, login_required, LoginManager
from pprint import pprint

from .my_forms import LoginForm
from .models.user import UserModel
from .resources.item import Item, Items, Slope, Slopes, Lift, Lifts
from .resources.weather import Weather, WeatherDay


def post_items(_request: request, obj: Item, name: str) -> None:
    for field, value in _request.form.items():
        _id, key = field.split('__')

        if obj.get_by_id(int(_id)).get('name'):
            item = obj.get_by_id(int(_id))
            if value and value != item[key]:
                data = {key: value, 'updated_by': name}
                response = obj.update(_id, data)
                print(response)


def get_items(objs: Items, key: str):
    _get_items = objs.get()

    _list_items = []
    if _get_items and _get_items[0].get(key):
        _list_items = _get_items[0].get(key)

    return _list_items


def main(app):
    login_manager = LoginManager()
    login_manager.login_view = 'login'
    login_manager.init_app(app)

    @login_manager.user_loader
    def load_user(_id):
        return UserModel.find_by_id(_id)

    @app.route('/favicon.ico')
    def favicon():
        return send_from_directory('static/img', filename='favicon.ico', mimetype='image/vnd.microsoft.icon')

    @app.route('/')
    @app.route('/index')
    @login_required
    def index():
        if not current_user.is_authenticated:
            return redirect(url_for('login'))

        return redirect(url_for('page_weather', kind='local', name='Роза Долина', day=0))

    @app.route('/<string:kind>/<string:name>/<int:day>',  methods=['POST', 'GET'])
    @login_required
    def page_weather(kind, name, day):
        weather_local = Weather.get(kind, name, day)[0]

        if request.method == 'POST':

            for field, value in request.form.items():
                value = value if (set(value) - set('1234567890')) else int(value)
                if value != weather_local.get(field):
                    data = {field: value, 'updated_by': current_user.name}
                    response = Weather.update(kind, name, day, data=data)
                    print(response)
            return redirect(url_for('page_weather', kind=kind, name=name, day=day))

        return render_template('point_weather.html', name=name, weather=weather_local)

    @app.route('/login', methods=['POST', 'GET'])
    def login():
        if current_user.is_authenticated:
            return redirect(url_for('index'))

        _form = LoginForm()
        if _form.validate_on_submit():
            user = UserModel.find_by_name(_form.username.data)

            if user and user.check_password(_form.password.data):
                login_user(user, remember=_form.remember_me.data)
                return redirect(url_for('index'))

            flash('Invalid username or password')
            return redirect(url_for('login'))

        return render_template('login.html', title='Вход', form=_form)

    @app.route('/lifts', methods=['GET', 'POST'])
    @login_required
    def page_lifts():
        if request.method == 'POST':
            post_items(request, Lift, current_user.name or 'anon')
            return redirect(url_for('page_lifts'))

        list_items = get_items(Lifts, 'lifts')
        print(list_items)

        return render_template('lifts.html', list_lifts=list_items)

    @app.route('/slopes', methods=['GET', 'POST'])
    @login_required
    def page_slopes():
        if request.method == 'POST':
            post_items(request, Slope, current_user.name or 'anon')
            return redirect(url_for('page_slopes'))

        list_items = get_items(Slopes, 'slopes')

        return render_template('slopes.html', list_slopes=list_items)

    @app.route('/acts', methods=['GET', 'POST'])
    @login_required
    def page_acts():
        return render_template('acts.html')

    @app.route('/logout')
    @login_required
    def logout():
        logout_user()
        return redirect(url_for('login'))

    @app.route('/russia-russia-local.xml')
    @app.route('/xml')
    def xml():
        weather = [WeatherDay.get('yrno', i)[0]['weatherday'] for i in range(4)]

        dates = []
        for i in range(4):
            today = datetime.datetime.now() + datetime.timedelta(days=i)
            dates.append(datetime.datetime.strftime(today, '%d/%m/%Y %H:%M'))

        valrisk = ['']

        lifts = get_items(Lifts, 'lifts')

        all_slopes = get_items(Slopes, 'slopes')
        slopes = []
        slopes_south = []
        for slope in all_slopes:
            if slope.get('south'):
                slopes_south.append(slope)
            else:
                slopes.append(slope)

        values = {
            'year': datetime.datetime.now().year,
            'weather': weather,
            'dates': dates,
            'valrisk': valrisk,
            'lifts': lifts,
            'slopes': slopes,
            'slopes_south': slopes_south
        }

        template = render_template('resort.xml', values=values)

        response = make_response(template)
        response.headers['Content-Type'] = 'application/xml'

        return response
