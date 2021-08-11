#!/bin/bash
###


git status
sleep 5
git add -A
sleep 1
echo "ВВЕДИТЕ ВАШ КОММИТ"
read -r varcommit 
git commit -m "$varcommit"
git push -u origin master

echo "Введите названия вашего приложения на HEROKU"
read varapp 
heroku create $varapp && \
heroku git:remote -a $varapp

heroku config:set DISABLE_COLLECTSTATIC=1