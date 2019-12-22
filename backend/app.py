from flask import Blueprint
from flask_restful import Api
from resources.user import User
from resources.register import Register
from resources.signin import SignIn
from resources.Task import Tasks

api_bp = Blueprint('api', __name__)
api = Api(api_bp)

# Route
api.add_resource(Register, '/register')
api.add_resource(SignIn, '/signin')
api.add_resource(Tasks, '/tasks')
