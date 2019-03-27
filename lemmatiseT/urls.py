#from django.urls import path
from lemmatiseT import views
from django.conf.urls import url

urlpatterns = [
    url('/lemm/<phrase_list>/', views.index),
]