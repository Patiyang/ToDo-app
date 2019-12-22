from flask_restful import Resource
from flask import request
from models import db, User, Task, TaskSchema
import random
import string

tasks_schema = TaskSchema(many=True)
task_schema = TaskSchema()


class Tasks(Resource):
    def post(self):
        header = request.headers['Authorization']
        json_data = request.get_json(force=True)
        if not header:
            return {'message':'No Api Key'}, 400
        else:
            user = User.query.filter_by(api_key=header).first()
            if user:
                tasks = Task(
                    user_id= user.id,
                    done= json_data['done'],
                    repeats= json_data['repeats'],
                    deadline= json_data['deadline'],
                    reminder= json_data['reminder'],
                    note= json_data['note']
                )
                db.session.add(tasks)
                db.session.commit()

                result = task_schema.dump(tasks).data
                return{'status':'success', 'data':result}, 201
            else:
                return {'Message':'No user with that api key'}, 400


    def get(self):
        # result = []
        header = request.headers['Authorization']
        if not header:
            return {'message':'No Api Key'}, 400
        else:
            user = User.query.filter_by(api_key=header).first()
            if user:
                tasks = Task.query.filter_by(user_id = user.id).all()
                # for task in tasks:
                #     result.append(Task.serialize(task))
                tasks = tasks_schema.dump(tasks).data

 
        return{'status': 'success', 'data': tasks}, 201