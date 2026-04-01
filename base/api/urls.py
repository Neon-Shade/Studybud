from django.urls import path
from django.conf import settings # Buni ham tekshirib ko'ring
from django.conf.urls.static import static # MANA SHU QATORNI QO'SHING
from . import views

urlpatterns = [
    path('', views.getRoutes),
    path('rooms/', views.getRooms),
    path('rooms/<str:pk>/', views.getRoom),
] + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)