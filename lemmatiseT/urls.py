from django.urls import path
from lemmatiseT import views

urlpatterns = [
    path('', views.index),
]