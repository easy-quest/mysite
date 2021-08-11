#!/usr/bin/bash

mkdir /home/zzz/mysite/templates

git config --global user.name "Yastrebov Ivan"
git config --global user.email "easy-quest@mail.ru"

# TEMPLATES

cat > templates/home.html <<ZZZ
<!-- templates/home.html -->
{% extends 'base.html' %}

{% block content %}
<h1>Homepage.</h1>
{% endblock %}
ZZZ

cat > templates/about.html <<ZZZ
<!-- templates/about.html -->
{% extends 'base.html' %}

{% block content %}
<h1>About page.</h1>
{% endblock %}
ZZZ

cat > templates/base.html <<ZZZ
<!-- templates/base.html -->
<header>
<a href="{% url 'home' %}">Home</a> | <a href="{% url 'about' %}">About</a>
</header>

{% block content %}
{% endblock %}
ZZZ

# URLS

cat > mysite/urls.py<<ZZZ

from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('pages.urls')),
]
ZZZ

cat > pages/urls.py <<ZZZ
# pages/urls.py
from django.urls import path
from . import views

urlpatterns = [
    path('', views.HomePageView.as_view(), name='home'),
    path('about/', views.AboutPageView.as_view(), name='about'),
]
ZZZ

# Views

cat > pages/views.py <<ZZZ
# pages/views.py
from django.views.generic import TemplateView

class HomePageView(TemplateView):
    template_name = 'home.html'

class AboutPageView(TemplateView):
    template_name = 'about.html'
ZZZ

# TEST

cat > pages/tests.py <<ZZZ
from django.test import SimpleTestCase

class SimpleTests(SimpleTestCase):
    def test_home_page_status_code(self):
        response = self.client.get('/')
        self.assertEqual(response.status_code, 200)


    def test_about_page_status_code(self):
        response = self.client.get('/about/')
        self.assertEqual(response.status_code, 200)
ZZZ
