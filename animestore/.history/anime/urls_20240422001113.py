from django.urls import path
from django.contrib.auth import views as auth_views
from django.conf import settings
from django.conf.urls.static import static
from . import views

urlpatterns = [
    path('', views.home , name='home'),
    path('login/', views.login_user, name='login'),
    path('logout/', views.logout_view, name='logout'),
    path('store/', views.store_view, name='store'),
    path('signup/', views.signup, name='signup'),
    path('search/', views.search_view, name='search'),
    path('category/<str:category_name>/', views.category_view, name='category'),
    path('product/<int:product_id>/', views.product_detail, name='product'),
    path('add_to_cart/<int:product_id>/', views.add_to_cart, name='add_to_cart'),
    path('delete_cart_item/<int:item_id>/', views.delete_cart_item, name='delete_cart_item'),
    path('cart/', views.cart_view, name='cart'),
    path('myaccount/', views.myacc_view, name='myacc'),
    path('order/', views.order_view, name='order'),
    path('profile/', views.profile, name='profile'),
    path('mycart/', views.mycart, name='mycart'),
    path('changepass/', views.changepass, name='changepass'),
    path('checkout/',views.checkout,name='checkout'),
    path('buynow/<int:product_id>/')
    
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)