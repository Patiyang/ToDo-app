#!/bin/bash
#running the migrations

python "/home/patto/PROJECTS/Flutter/todo_app/backend/migrate.py"db init
python "/home/patto/PROJECTS/Flutter/todo_app/backend/migrate.py"db migrate
python "/home/patto/PROJECTS/Flutter/todo_app/backend/migrate.py"db upgrade
