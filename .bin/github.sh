#!/usr/bin/bash

# git config --global user.name "Yastrebov Ivan"
# git config --global user.email "easy-quest@mail.ru"
git status
sleep 5
git add -A
echo 'напиши коммит'
read varcommit
git commit -m "$varcommit"
git push -u origin master
