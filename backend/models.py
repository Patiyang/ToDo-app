from flask import Flask
from marshmallow import Schema, fields, pre_load, validate
from flask_marshmallow import Marshmallow
from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()
ma = Marshmallow()

class User(db.Model):
    __tablename__ = 'users'

    id = db.Column(db.Integer, primary_key=True, unique=True, autoincrement = True) 
    username = db.Column(db.String(), primary_key=True, unique=True)
    first_name = db.Column(db.String())
    last_name = db.Column(db.String())
    password = db.Column(db.String())
    email = db.Column(db.String(),primary_key=True, unique=True)

    def __init__(self, username, first_name, last_name, password, email):
        self.username = username
        self.first_name = first_name
        self.last_name = last_name
        self.password = password
        self.email = email

"""class Tasks(db.Model):
    __table_name__ = 'tasks'
    id = db.Column(db.Integer, primary_key=True, unique=True)
    taskname = db.Column(db.String(), primary_key=True, unique=True)
    description = db.Column(db.String())
    task_summary = db.Column(db.String())
    date = db.Column(db.String())
    tags = db.Column(db.String())

    def __init__(self, id, taskname, description, task_summary, date, tags):
        self.id = id
        self.taskname = taskname
        self.description = description
        self.task_summary = task_summary
        self.date = date
        self.tags = tags"""

class UserSchema(ma.Schema):
    id = fields.Integer(dump_only=True)
    username = fields.String()
    first_name = fields.String()
    last_name = fields.String()
    email = fields.String()
   # password = fields.String()

"""class TaskSchema(ma.Schema):
    id = fields.Integer()
    taskname = fields.Integer()
    description = fields.Integer()
    task_summary = fields.Integer()
    date = fields.Integer()
    tags = fields.Integer()
    """
def __repr__(self):
        return '<id {}>'.format(self.id)

def serialize(self):
        return{
            'id': self.id,
            'username': self.username,
            'first_name': self.first_name,
            'last_name': self.last_name,
            'email': self.email,
            'password': self.password

        }