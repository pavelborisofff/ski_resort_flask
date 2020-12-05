import requests

from ski_resort.create_app import create_app
from ski_resort import test_route


if __name__ == '__main__':
    app = create_app()

    test_route.main(app)

    app.run(debug=False, port=5002)
