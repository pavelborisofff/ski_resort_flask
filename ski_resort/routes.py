from flask import request, redirect, url_for, render_template, session, send_from_directory


def main(app):
    @app.route('/favicon.ico')
    def favicon():
        return send_from_directory('static/img', filename='favicon.ico', mimetype='image/vnd.microsoft.icon')

    @app.route('/')
    def index():
        return render_template('index.html')

    @app.route('/login', methods=['POST', 'GET'])
    def login():
        if request.method == 'POST':
            user = request.form['nm']
            session['user'] = user
            return render_template(url_for('user', usr=user))
        return render_template('login.html')

        # return request.get('http://localhost:5001/acts').json()

    @app.route('/sl')
    def admin():
        return request.get('http://localhost:5001/slopes').json()
