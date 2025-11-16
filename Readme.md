# 🎌 AnimeStore - E-Commerce Platform

<div align="center">

![Django](https://img.shields.io/badge/Django-4.2-092E20?style=for-the-badge&logo=django&logoColor=white)
![Python](https://img.shields.io/badge/Python-3.x-3776AB?style=for-the-badge&logo=python&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-Database-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![HTML5](https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white)
![CSS3](https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=css3&logoColor=white)
![JavaScript](https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black)

**A full-featured Django e-commerce platform for anime merchandise** 🛒✨

[Features](#-features) • [Installation](#-installation) • [Usage](#-usage) • [API Endpoints](#-api-endpoints) • [Project Structure](#-project-structure)

</div>

---

## 📋 Table of Contents

- [Overview](#-overview)
- [Features](#-features)
- [Tech Stack](#-tech-stack)
- [Installation](#-installation)
- [Database Setup](#-database-setup)
- [Project Structure](#-project-structure)
- [API Endpoints](#-api-endpoints)
- [Models](#-models)
- [Screenshots](#-screenshots)
- [Contributing](#-contributing)

---

## 🌟 Overview

**AnimeStore** is a comprehensive e-commerce web application built with Django, designed specifically for anime merchandise enthusiasts. This platform provides a seamless shopping experience with features like user authentication, product categorization, shopping cart management, order processing, and user profile management.

> **📌 Note:** This project is **backend-focused**, showcasing Django's powerful backend capabilities including custom user models, complex database relationships, authentication systems, and business logic implementation. The frontend uses Django templates with basic CSS/JavaScript for demonstration purposes.

### 🎯 Key Highlights

- 🔐 **Custom User Authentication** with extended profile fields
- 🛍️ **Dynamic Product Catalog** with multiple categories
- 🛒 **Shopping Cart System** with real-time updates
- 📦 **Order Management** with status tracking
- 🔍 **Advanced Search Functionality**
- 📱 **Responsive Design** for all devices
- 🖼️ **Multi-image Product Gallery**

---

## ✨ Features

### 🔑 User Management
- ✅ Custom user registration with extended fields (phone, gender, location)
- ✅ Secure login/logout functionality
- ✅ Profile management
- ✅ Password change functionality
- ✅ User-specific cart and order history

### 🛍️ Product Management
- ✅ Product listing with detailed descriptions
- ✅ Multiple product images (up to 4 per product)
- ✅ Category-based organization
- ✅ Sale pricing support
- ✅ Stock quantity tracking
- ✅ Related products suggestions

### 🛒 Shopping Experience
- ✅ Add to cart functionality
- ✅ Cart item quantity management
- ✅ Remove items from cart
- ✅ Checkout process
- ✅ Buy now option
- ✅ Real-time price calculation

### 📦 Order Processing
- ✅ Order creation and tracking
- ✅ Order status management (Pending/Delivered/Cancelled)
- ✅ Order history for users
- ✅ Automatic stock quantity updates

### 🔍 Search & Navigation
- ✅ Product search functionality
- ✅ Category-based filtering
- ✅ Root category display with images
- ✅ Hierarchical category structure

---

## 🛠️ Tech Stack

### Backend ⭐ **(Primary Focus)**
- **Framework:** Django 4.2
- **Database:** MySQL
- **ORM:** Django ORM
- **Authentication:** Django Auth System (Custom User Model)
- **Environment Management:** python-dotenv
- **Image Handling:** Pillow

### Frontend *(Basic Implementation)*
- **Templates:** Django Template Engine
- **Styling:** CSS3
- **Scripting:** JavaScript (Vanilla)
- **Icons & Images:** Custom assets

> **💡 Development Focus:** This project emphasizes **backend architecture, database design, business logic, and Django best practices**. The frontend is functional but intentionally kept simple to highlight server-side capabilities.

### Dependencies
```
asgiref==3.10.0
Django==4.2
mysqlclient==2.2.7
pillow==12.0.0
psycopg2-binary==2.9.11
python-dotenv==1.2.1
sqlparse==0.5.3
tzdata==2025.2
```

---

## 🚀 Installation

### Prerequisites
- Python 3.8+
- MySQL Server
- pip (Python package manager)
- Virtual environment (recommended)

### Step-by-Step Setup

#### 1️⃣ Clone the Repository
```bash
git clone https://github.com/cindrellakoju/Animestore.git
cd Animestore
```

#### 2️⃣ Create Virtual Environment
```bash
# Windows
python -m venv animestore_env
animestore_env\Scripts\activate

# Linux/Mac
python3 -m venv animestore_env
source animestore_env/bin/activate
```

#### 3️⃣ Install Dependencies
```bash
pip install -r requirements.txt
```

#### 4️⃣ Configure Environment Variables
Create a `.env` file in the root directory (copy from `.env.example`):
```bash
# Windows
copy .env.example .env

# Linux/Mac
cp .env.example .env
```

Update the `.env` file with your configuration:
```env
# Django Settings
SECRET_KEY=your-secret-key-here
DEBUG=True

# Allowed Hosts (comma-separated)
ALLOWED_HOSTS=127.0.0.1,localhost

# Database Configuration
DB_ENGINE=django.db.backends.mysql
DB_NAME=animestore
DB_USER=root
DB_PASSWORD=your_mysql_password
DB_HOST=localhost
DB_PORT=3306

# Static Files
STATIC_URL=/static/
STATIC_ROOT=staticfiles

# Media Files
MEDIA_URL=/templates/media/
MEDIA_ROOT=templates/media

# Authentication
LOGIN_URL=/login/
```

#### 5️⃣ Configure Database
Create a MySQL database named `animestore`:
```sql
CREATE DATABASE animestore;
```

#### 6️⃣ Run Migrations
```bash
cd animestore
python manage.py makemigrations
python manage.py migrate
```

#### 7️⃣ Create Superuser
```bash
python manage.py createsuperuser
```

#### 8️⃣ Collect Static Files
```bash
python manage.py collectstatic
```

#### 9️⃣ Run Development Server
```bash
python manage.py runserver
```

🎉 **Visit:** `http://127.0.0.1:8000/` to see the application!

---

## 💾 Database Setup

### Import Sample Data (Optional)
```bash
mysql -u root -p animestore < animestore.sql
```

### Database Schema Overview
The application uses 8 main models:
- `CustomUser` - Extended user model
- `Category` - Product categories
- `RootCategory` - Top-level categories with images
- `Product` - Product details
- `Cart` - User shopping carts
- `CartItem` - Items in cart
- `Order` - Order records
- `OrderItem` - Items in orders

---

## 📁 Project Structure

```
Animestore/
│
├── 📄 animestore.sql              # Database dump
├── 📄 Readme.md                   # Project documentation
├── 📄 requirements.txt            # Python dependencies
│
├── 📁 animestore/                 # Main Django project
│   ├── 📄 manage.py              # Django management script
│   │
│   ├── 📁 anime/                 # Main application
│   │   ├── 📄 __init__.py
│   │   ├── 📄 admin.py           # Admin panel configuration
│   │   ├── 📄 apps.py            # App configuration
│   │   ├── 📄 forms.py           # Custom forms (SignUp, Login, Search)
│   │   ├── 📄 models.py          # Database models
│   │   ├── 📄 tests.py           # Unit tests
│   │   ├── 📄 urls.py            # URL routing
│   │   ├── 📄 views.py           # View functions
│   │   │
│   │   ├── 📁 static/            # Static files (CSS, JS)
│   │   │   ├── 📁 css/
│   │   │   └── 📁 js/
│   │   │
│   │   └── 📁 migrations/        # Database migrations
│   │       ├── 📄 __init__.py
│   │       └── 📄 0001_initial.py
│   │
│   └── 📁 animestore/            # Project settings
│       ├── 📄 __init__.py
│       ├── 📄 asgi.py            # ASGI configuration
│       ├── 📄 settings.py        # Project settings
│       ├── 📄 urls.py            # Root URL configuration
│       └── 📄 wsgi.py            # WSGI configuration
│
├── 📁 templates/                  # HTML templates
│   ├── 📄 homepage.html          # Landing page
│   ├── 📄 signup.html            # User registration
│   ├── 📄 login.html             # User login
│   ├── 📄 store.html             # Product listing
│   ├── 📄 category.html          # Category products
│   ├── 📄 product.html           # Product details
│   ├── 📄 search.html            # Search results
│   ├── 📄 cart.html              # Shopping cart
│   ├── 📄 mycart.html            # User cart view
│   ├── 📄 checkout.html          # Checkout page
│   ├── 📄 order.html             # Order history
│   ├── 📄 myaccount.html         # User account
│   ├── 📄 profile.html           # User profile
│   ├── 📄 changepass.html        # Password change
│   │
│   └── 📁 media/                 # Uploaded media files
│       ├── 📁 category_images/   # Category images
│       └── 📁 product_images/    # Product images
│
├── 📁 animestore_env/            # Virtual environment
│
├── 📁 env/                       # Alternative virtual environment
│
└── 📁 html css/                  # Static HTML/CSS prototypes
    ├── 📄 accessory.html
    ├── 📄 cart.html
    ├── 📄 category.html
    ├── 📄 login.html
    ├── 📄 manga.html
    ├── 📄 signup.html
    ├── 📄 store.html
    │
    └── 📁 withlogin/             # Authenticated user views
        ├── 📄 homepage.html
        ├── 📄 myaccount.html
        ├── 📄 mycart.html
        └── ...
```

---

## 🌐 API Endpoints

### 🔓 Public Routes

| Method | Endpoint | Description |
|--------|----------|-------------|
| `GET` | `/` | Homepage with root categories |
| `GET` | `/login/` | User login page |
| `POST` | `/login/` | Authenticate user |
| `GET` | `/signup/` | User registration page |
| `POST` | `/signup/` | Create new user account |
| `GET` | `/store/` | Browse all products |
| `GET` | `/search/?query=<keyword>` | Search products by title |
| `GET` | `/category/<category_name>/` | View products in category |
| `GET` | `/product/<product_id>/` | Product detail page |

### 🔐 Protected Routes (Login Required)

| Method | Endpoint | Description |
|--------|----------|-------------|
| `GET` | `/logout/` | Logout user |
| `GET` | `/cart/` | View shopping cart |
| `GET` | `/mycart/` | User cart management |
| `POST` | `/add_to_cart/<product_id>/` | Add product to cart |
| `POST` | `/delete_cart_item/<item_id>/` | Remove item from cart |
| `GET` | `/checkout/` | Checkout page |
| `POST` | `/checkout/` | Process checkout data |
| `GET` | `/order/` | View order history |
| `POST` | `/order/` | Place new order |
| `GET` | `/myaccount/` | User account dashboard |
| `GET` | `/profile/` | User profile page |
| `GET` | `/changepass/` | Change password page |
| `POST` | `/changepass/` | Update password |
| `GET` | `/buynow/<product_id>/` | Quick purchase (qty=1) |
| `GET` | `/buynow/<product_id>/<quantity>/` | Quick purchase with quantity |

---

## 📊 Models

### 👤 CustomUser
Extended Django user model with additional fields:
```python
- username (CharField)
- email (EmailField)
- first_name (CharField)
- last_name (CharField)
- phone_number (CharField)
- gender (CharField) [M/F/O]
- province (CharField)
- district (CharField)
- tole (CharField)
```

### 📁 Category
Hierarchical category structure:
```python
- id (AutoField)
- name (CharField)
- parent (ForeignKey to self) [nullable]
```

### 🖼️ RootCategory
Top-level categories with images:
```python
- id (AutoField)
- category (OneToOneField to Category)
- image (ImageField)
```

### 🎁 Product
Product information and inventory:
```python
- product_id (AutoField, PK)
- title (CharField)
- description (TextField)
- detail (TextField)
- price (DecimalField)
- sale (BooleanField)
- sale_price (DecimalField) [nullable]
- image1 (ImageField)
- image2, image3, image4 (ImageField) [nullable]
- available_quantity (IntegerField)
- categories (ManyToManyField to Category)
```

### 🛒 Cart
User shopping cart:
```python
- id (AutoField)
- user (ForeignKey to CustomUser)
- created_at (DateTimeField)
```

### 📦 CartItem
Items in shopping cart:
```python
- id (AutoField)
- cart (ForeignKey to Cart)
- product (ForeignKey to Product)
- quantity (PositiveIntegerField)
```

### 📋 Order
Order records:
```python
- id (AutoField)
- user (ForeignKey to CustomUser)
- ordered_items (ManyToManyField through OrderItem)
- order_date (DateTimeField)
- status (CharField) [Pending/Delivered/Cancelled]
- total_price (DecimalField)
```

### 📝 OrderItem
Items in orders:
```python
- id (AutoField)
- order (ForeignKey to Order)
- product (ForeignKey to Product)
- quantity (PositiveIntegerField)
```

---

## 🎨 Screenshots

### 🏠 Homepage
Display of root categories with featured images and navigation.

### 🛍️ Store Page
Complete product catalog with category filtering and search functionality.

### 📦 Product Detail
Detailed product view with:
- Multiple product images
- Full description and specifications
- Price information (regular/sale)
- Add to cart button
- Buy now option
- Related products

### 🛒 Shopping Cart
Interactive cart with:
- Product list with quantities
- Price calculations
- Remove item functionality
- Checkout button

### 📋 Order History
User order tracking with:
- Order ID and date
- Order status
- Total price
- Product details

### 👤 User Profile
User account management:
- Personal information
- Address details
- Password change
- Order history access

---

## 🔧 Configuration

### Environment Variables
The project uses environment variables for secure configuration management. All sensitive data is stored in the `.env` file (not tracked in git).

**Available Environment Variables:**
```env
# Django Settings
SECRET_KEY=your-secret-key-here           # Django secret key for security
DEBUG=True                                 # Debug mode (False in production)

# Allowed Hosts (comma-separated)
ALLOWED_HOSTS=127.0.0.1,localhost         # Allowed host addresses

# Database Configuration
DB_ENGINE=django.db.backends.mysql        # Database engine
DB_NAME=animestore                        # Database name
DB_USER=root                              # Database username
DB_PASSWORD=your_mysql_password           # Database password
DB_HOST=localhost                         # Database host
DB_PORT=3306                              # Database port

# Static Files
STATIC_URL=/static/                       # Static files URL
STATIC_ROOT=staticfiles                   # Static files root directory

# Media Files
MEDIA_URL=/templates/media/               # Media files URL
MEDIA_ROOT=templates/media                # Media files root directory

# Authentication
LOGIN_URL=/login/                         # Login page URL

# CSRF Trusted Origins (comma-separated URLs)
CSRF_TRUSTED_ORIGINS=http://127.0.0.1:8000,http://localhost:8000
```

**⚠️ Important Security Notes:**
- Never commit `.env` file to version control
- Use `.env.example` as a template
- Generate a strong SECRET_KEY for production
- Set DEBUG=False in production
- Configure proper ALLOWED_HOSTS for production

### Media Files
Uploaded images are stored in:
- **Categories:** `templates/media/category_images/`
- **Products:** `templates/media/product_images/`

### Static Files
CSS and JavaScript files are located in:
- `anime/static/css/`
- `anime/static/js/`

---

## 🚦 Usage

### Admin Panel
Access the Django admin panel at `http://127.0.0.1:8000/admin/`
- Manage products, categories, users, orders
- View and modify all database records

### User Flow
1. **Browse** products on the homepage or store
2. **Search** for specific items
3. **Sign up** for an account
4. **Add** products to cart
5. **Checkout** and place order
6. **Track** orders in order history


## 🌈 Features Showcase

### Dynamic Cart Management
- ✨ Real-time quantity updates
- ✨ Automatic price calculations
- ✨ Persistent cart across sessions

### Smart Search
- ✨ Case-insensitive search
- ✨ Search by product title
- ✨ Instant results

### Order Processing
- ✨ Automatic stock deduction
- ✨ Order status tracking
- ✨ User order history

### Security Features
- ✨ CSRF protection
- ✨ Password hashing
- ✨ Login required decorators
- ✨ Session management

---

## 🤝 Contributing

Contributions are welcome! Feel free to:
- 🐛 Report bugs
- 💡 Suggest new features
- 🔧 Submit pull requests
- 📖 Improve documentation

---

## 📝 License

This project is developed as a personal portfolio project. Feel free to use it for learning purposes.

---

## 👨‍💻 Author

**Cindrella Koju**
- GitHub: [@cindrellakoju](https://github.com/cindrellakoju)
