import requests

from flask import request, flash, redirect, url_for, render_template, session, send_from_directory, jsonify
from flask_login import current_user, login_user, logout_user, login_required, LoginManager

from forms import LoginForm
from models.user import UserModel
from resources.item import Item, Items, Slope, Slopes


def post_items(_request: request, obj: Item, objs: Items, key: str, name: str) -> list:
    if _request.method == 'POST':

        for field, value in request.form.items():
            _id, key = field.split('__')

            if obj.get_by_id(int(_id)).get('name'):
                item = obj.get_by_id(int(_id))
                if value and value != item[key]:
                    data = {key: value, 'updated_by': name}
                    response = obj.update(_id, data)
                    print(response)

    get_items = objs.get()

    _list_items = []
    if get_items and get_items[0].get(key):
        _list_items = get_items[0].get(key)

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
    @app.route('/weather')
    # @login_required
    def index():
        return render_template('index.html')

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
        return render_template('login.html', title='Сигн ин', form=_form)

        # flash('Login requested for user {}, remember_me={}'.format(
        #     form.username.data, form.remember_me.data))

        # if request.method == 'POST':
        #     user = request.form['nm']
        #     session['user'] = user
        #     return render_template(url_for('user', usr=user))
        # return render_template('login.html')

        # return request.get('http://localhost:5001/acts').json()

    @app.route('/lifts', methods=['GET', 'POST'])
    def page_lifts():
        return render_template('lifts.html')

    @app.route('/slopes', methods=['GET', 'POST'])
    def page_slopes():

        list_items = post_items(request, Slope, Slopes, 'slopes', current_user.name)

        return render_template('slopes.html', list_slopes=list_items)

    @app.route('/acts', methods=['GET', 'POST'])
    def page_acts():
        return render_template('acts.html')

    @app.route('/logout')
    def logout():
        logout_user()
        return redirect(url_for('login'))
