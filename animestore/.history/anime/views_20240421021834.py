from django.shortcuts import render, redirect, get_object_or_404
from .models import Product, Cart, CartItem, CustomUser, Order, OrderItem, Category,RootCategory
from django.contrib.auth.decorators import login_required
from django.contrib.auth import login , logout, update_session_auth_hash
from .forms import SignUpForm , SearchForm
from django.http import HttpResponse
from django.contrib import messages
import json

def home(request):
    root_categories = RootCategory.objects.all()
    return render(request,'homepage.html',{'cat':root_categories})


def signup(request):
    if request.method == 'POST':
        form = SignUpForm(request.POST) 
        if form.is_valid():
            username = form.cleaned_data['username']
            email = form.cleaned_data['email']
            
            # Check if the username is already taken
            if CustomUser.objects.filter(username=username).exists():
                form.add_error('username', 'This username is already taken.',extra_tags='signup')
                return render(request, 'signup.html', {'form': form})
            
            # Check if the email is already taken
            if CustomUser.objects.filter(email=email).exists():
                form.add_error('email', 'This email address is already registered.')
                return render(request, 'signup.html', {'form': form})
            try:
                user = form.save(commit=False)  # Get the unsaved user object from the form
                user.set_password(form.cleaned_data['password'])  # Hash the password
                user.save()
                return redirect('login')  # Redirect to login page after successful registration
            except Exception as e:
                # Log the error for debugging
                print(f"An error occurred while saving user data: {e}")
                # Handle the error gracefully, such as displaying an error message to the user
                return HttpResponse("An error occurred while processing your request. Please try again later.", status=500)
        else:
            print('Form contains are invalid')
    else:
        form = SignUpForm()
    return render(request, 'signup.html', {'form': form})


def login_user(request):
    if request.method == 'POST':
        username_or_email = request.POST.get('username')
        password = request.POST.get('password')
        if username_or_email and password:
            if '@' in username_or_email:
                try:
                    user = CustomUser.objects.get(email=username_or_email)
                except CustomUser.DoesNotExist:
                    messages.error(request, 'Login failed: User does not exist', extra_tags='login_message')
            else:
                try:
                    user = CustomUser.objects.get(username=username_or_email)
                except CustomUser.DoesNotExist:
                    messages.error(request, 'Login failed: User does not exist', extra_tags='login_message')

            if user.check_password(password):
                login(request, user)
                return redirect('store')  # Redirect to the 'store' page upon successful login
            else:
                messages.error(request, 'Login failed: User does not exist', extra_tags='login_message')
        else:
            messages.error(request, 'Login failed: User does not exist', extra_tags='login_message')
  
    if request.user.is_authenticated:
        return redirect('store')
    else:
        return render(request, 'login.html')

def logout_view(request):
    logout(request)
    # Redirect to the homepage or any other page after logout
    return redirect(request.META.get('HTTP_REFERER', '/'))

def store_view(request):
    products = Product.objects.all()
    root_categories = RootCategory.objects.all()
    context = {'products': products, 'rcat':root_categories}
    return render(request, 'store.html', context)

def search_view(request):
    root_categories = RootCategory.objects.all()
    query = request.GET.get('query')
    products = []
    if query:
        products = Product.objects.filter(title__icontains=query)
    else:
        products = Product.objects.all()
    return render(request, 'search.html', {'query': query, 'products': products, 'rcat':root_categories})


def category_view(request, category_name):
    category = get_object_or_404(Category, name=category_name)
    rcategory = get_object_or_404(RootCategory, category_id=category.id)
    products = Product.objects.filter(categories=category)
    root_categories = RootCategory.objects.all()
    return render(request, 'category.html', {'category': rcategory, 'rcat':root_categories, 'products':products})

def product_detail(request, product_id):
    product = get_object_or_404(Product, pk=product_id)
    if not product.image2:
        product.image2=""
    if not product.image3:
        product.image3=""
    if not product.image4:
        product.image4=""
           
    detail_list =(product.detail).split(",")
    product.detail=detail_list
    print(product)
     
    products = Product.objects.exclude(pk=product_id)
    return render(request, 'product.html', {'product': product, 'products':products})


@login_required
def cart_view(request):
    user = request.user
    cart_items = CartItem.objects.filter(cart__user=user)
    return render(request, 'cart.html', {'cart_items': cart_items})

@login_required
def mycart(request):
    user = request.user
    cart_items = CartItem.objects.filter(cart__user=user)
    # for items in cart_items:
    #     print(items)
    # print(cart_items)
    return render(request, 'mycart.html', {'cart_items': cart_items})

@login_required
def add_to_cart(request, product_id):
    product = get_object_or_404(Product, pk=product_id)
    cart, created = Cart.objects.get_or_create(user=request.user)

    # Check if the product already exists in the cart
    cart_item, item_created = CartItem.objects.get_or_create(cart=cart, product=product)
    

    # If the item already exists in the cart, increment its quantity
    if not item_created:
        cart_item.quantity += 1
        cart_item.save()
    return redirect(request.META.get('HTTP_REFERER', '/'))

@login_required
def delete_cart_item(request, item_id):
    # Retrieve the cart item
    cart_item = get_object_or_404(CartItem, pk=item_id)
    
    cart = cart_item.cart

    cart_item.delete()
    if cart.items.count() == 0:
        cart.delete()
    return redirect(request.META.get('HTTP_REFERER', '/'))

def view_orders(request):
    orders = Order.objects.all()
    return render(request, 'view_orders.html', {'orders': orders})

def confirm_order(request, order_id):
    order = Order.objects.get(pk=order_id)
    if request.method == 'POST':
        # Update the status of the order to 'Delivered'
        order.status = 'Delivered'
        order.save()
        return redirect('view_orders')  # Redirect to view_orders page
    return render(request, 'confirm_order.html', {'order': order}) 

@login_required
def myacc_view(request):
    return render(request, 'myaccount.html')


@login_required
def profile(request):
    return render(request, 'profile.html')


cart_items1=[]
@login_required
def checkout(request):
    if request.method == 'POST':
        cart_items1.clear()
        checked_items_data = json.loads(request.body)
        # Initialize a list to store CartItem instances
        # Iterate over checked_items_data to fetch CartItem instances
        for item_data in checked_items_data:
            # Retrieve cart_item_id and quantity from item_data
            cart_item_id = item_data['productId']
            quantity = item_data['quantity']

            # Fetch the CartItem instance from the database
            cart_item = get_object_or_404(CartItem, pk=cart_item_id)
            cart_item.quantity = quantity
            cart_items1.append(cart_item)

    return render(request, 'checkout.html', {'cart_items1': cart_items1})

@login_required
def order_view(request):
    if request.method == 'POST':
        buyitem = json.loads(request.body)
        total = buyitem['totalPrice']
        cart = buyitem['cartItems']
        order = Order.objects.create(user=request.user, total_price=total)

        for item_data in cart:
            cart_item_id = item_data['productId']
            quantity = item_data['quantity']

            cart_item = get_object_or_404(CartItem, pk=cart_item_id)
            product = cart_item.product

            # Decrease the quantity of the product
            product.available_quantity -= quantity
            product.save()

            # Create OrderItem
            OrderItem.objects.create(order=order, product=product, quantity=quantity)

            # Optionally, you may want to delete the cart item after ordering
            cart_item.delete()

        print("Order placed successfully")
    
    user=request.user
    user_orders = Order.objects.filter(user=request.user)
    # shipping_address=user.tole + user.district + user.province
    title="saman"
    print(user_orders)
    return render(request, 'order.html',{'user_orders':user_orders,'shipping_address':shipping_address, 'title':title})



@login_required
def changepass(request):
    if request.method == 'POST':
        # Retrieve old password, new password, and confirm new password from the POST request
        old_password = request.POST.get('old_password')
        new_password1 = request.POST.get('new_password1')
        new_password2 = request.POST.get('new_password2')

        # Verify that the old password matches the user's current password
        if request.user.check_password(old_password):
            # Verify that the new passwords match
            if new_password1 == new_password2:
                # Change the user's password and update the session authentication hash
                request.user.set_password(new_password1)
                request.user.save()
                update_session_auth_hash(request, request.user)
                messages.success(request, 'Your password was successfully updated!', extra_tags="changepass_message")
                return redirect('changepass')  # Redirect to profile page after successful password change
            else:
                messages.error(request, "New passwords don't match.", extra_tags='changepass_message')
        else:
            messages.error(request, 'Incorrect old password.', extra_tags='changepass_message')
    else:
        # Handle GET request
        return render(request, 'changepass.html')

    # If the form submission was unsuccessful or if the request method was GET,
    # render the change password form with error messages
    return render(request, 'changepass.html')