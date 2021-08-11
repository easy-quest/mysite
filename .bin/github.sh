#!/usr/bin/bash

# git config --global user.name "Yastrebov Ivan"
# git config --global user.email "easy-quest@mail.ru"
git status
sleep 5
git add -A
echo "ВВЕДИТЕ ВАШ КОММИТ"
read -r varcommit 
git commit -m "$varcommit"
git push -u origin master
sleep 5
git push heroku master
heroku ps:scale web=1
heroku open