#__author__ = 'lenovo'
from django.urls import path
from . import views

#index.urls
urlpatterns = [
    path('', views.indexView, name = 'index')
]