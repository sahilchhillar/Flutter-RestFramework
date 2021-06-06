from django.urls import path
from rest_proj import views

urlpatterns = [
    path('info/', views.infoList),
    path('info/<int:pk>/', views.infoDetails)
]
