from ski_resort.create_app import create_app
from ski_resort import routes


if __name__ == '__main__':
    app = create_app()
    routes.main(app)

    app.run(debug=False, port=5001)
