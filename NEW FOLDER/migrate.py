
from run import create_app
from flask_migrate import Migrate
from sqlalchemy.testing.config import db
from flask_script import Manager

app = create_app('config')

migrate = Migrate(app, db)
manager = Manager(app)
# manager.add_command('db', MigrateCommand)


if __name__ == '__main__':
    manager.run()