#!/usr/bin/env bash

echo "Start backend server"
until cd /app/backend/mlserverapp
do
    echo "Waiting for server volume..."
done

until ./manage.py migrate
do
    echo "Waiting for database to be ready..."
    sleep 2
done

./manage.py collectstatic --noinput

gunicorn mlserverapp.wsgi:application --bind 0.0.0.0:8000 --workers 4 --threads 4