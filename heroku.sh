#!/bin/bash
###

echo "Введите названия вашего приложения на HEROKU"
read varapp 
heroku create $varapp && \
heroku git:remote -a $varapp

heroku config:set DISABLE_COLLECTSTATIC=1
heroku config:set PIPENV_IGNORE_VIRTUALENVS=1

heroku ps:scale web=1
