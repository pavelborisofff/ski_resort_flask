import requests


def main(app):

    @app.route('/')
    def hello():

        return requests.get('http://localhost:5002/acts').json()

    @app.route('/sl')
    def admin():
        return requests.get('http://localhost:5002/slopes').json()