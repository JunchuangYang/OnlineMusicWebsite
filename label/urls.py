#__author__ = 'lenovo'
from django.urls import path,re_path
from .import views
urlpatterns = [
    re_path(r'(?P<label_id>[0-9]+)/(?P<page>[0-9]+).html$', views.LabelView, name="label"),
]
