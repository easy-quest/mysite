###### 					Начальная настройка

```bash
pipenv install django
pipenv shell
django-admin startproject mysite .
python manage.py startapp pages
```
```python
# helloworld_project/settings.py
INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'pages', # new
]
```
```python
# pages_project/settings.py
TEMPLATES = [
    {
        ...
        'DIRS': [os.path.join(BASE_DIR, 'templates')],
        ...
    },
]
```
```python
# pages_project/settings.py
ALLOWED_HOSTS = ['*']
```
```python
LANGUAGE_CODE = 'ru-ru'

TIME_ZONE = 'Europe/Moscow'
```

###### Установка Git


```bash
./sh.sh
```

pipenv install gunicorn


Run 'python manage.py migrate' 

```shell
scp zzz@zzzi.site:/home/zzz/mysite/*sh  ~/mysite/.bin
```
python manage.py test

sudo npm i -g heroku
heroku login
./git.sh 