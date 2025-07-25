<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Cart" %>
<%@page import="model.ProductVariant"%>
<%@page import="model.Product"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <title>Index - eStore Bootstrap Template</title>
        <meta name="description" content="">
        <meta name="keywords" content="">

        <!-- Favicons -->
        <link href="${pageContext.request.contextPath}/assets/img/favicon.png" rel="icon">
        <link href="${pageContext.request.contextPath}/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

        <!-- Fonts -->
        <link href="https://fonts.googleapis.com" rel="preconnect">
        <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Nunito:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

        <!-- Vendor CSS Files -->
        <link href="${pageContext.request.contextPath}/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assets/vendor/aos/aos.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assets/vendor/drift-zoom/drift-basic.css" rel="stylesheet">

        <!-- Main CSS File -->
        <link href="${pageContext.request.contextPath}/assets/css/main.css" rel="stylesheet">

        <!-- =======================================================
        * Template Name: eStore
        * Template URL: https://bootstrapmade.com/estore-bootstrap-ecommerce-template/
        * Updated: Apr 26 2025 with Bootstrap v5.3.5
        * Author: BootstrapMade.com
        * License: https://bootstrapmade.com/license/
        ======================================================== -->
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Bootstrap Icons -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
        <!-- jQuery -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <!-- Popper -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>

        <!-- Bootstrap JS -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <style>
            .cart-item img {
                max-width: 100px;
                height: auto;
            }
            /* Ẩn radio gốc */
            .payment-method__item input[type="radio"] {
                display: none;
            }

            /* Checkmark tùy biến */
            .checkmark {
                display: inline-block;
                width: 18px;
                height: 18px;
                border: 2px solid #6c757d;
                border-radius: 50%;
                margin-right: 10px;
                position: relative;
            }

            /* Khi được chọn */
            .payment-method__item input[type="radio"]:checked + .checkmark {
                background-color: #007bff;
                border-color: #007bff;
            }

            /* Toàn bộ item */
            .payment-method__item {
                display: flex;
                align-items: center;
                border: 1px solid #ced4da;
                padding: 15px;
                border-radius: 10px;
                margin-bottom: 15px;
                transition: all 0.3s ease;
                cursor: pointer;
            }

            .payment-method__item:hover {
                border-color: #007bff;
                background-color: #f8f9fa;
            }

            .payment-method__item-icon-wrapper img {
                width: 60px;
                height: auto;
                margin-right: 15px;
            }

            .payment-method__item-name {
                font-size: 16px;
                color: #212529;
            }

            /* Modal styling */
            .modal-header {
                background-color: #343a40;
                color: #fff;
                border-bottom: none;
                justify-content: center;
            }

            .modal-title {
                font-size: 20px;
                font-weight: bold;
                text-transform: uppercase;
            }

            .modal-header .close {
                color: #fff;
                opacity: 1;
                font-size: 1.5rem;
            }

            .modal-body img {
                border-radius: 8px;
                margin-bottom: 15px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            }

            .modal-body video {
                border-radius: 10px;
                box-shadow: 0 5px 10px rgba(0,0,0,0.2);
            }

            /* Responsive */
            @media (max-width: 768px) {
                .modal-dialog.modal-dialog-centered {
                    max-width: 95%;
                    margin: 1.75rem auto;
                }

                .modal-body video {
                    width: 100%;
                }
            }

            .css_address_section {
                margin-top: 20px;
                padding: 15px;
                background-color: #fff;
                border: 1px solid #ddd;
                border-radius: 5px;
            }

            .css_address_label {
                font-size: 20px;
                font-weight: bold;
                color: #333;
                margin-bottom: 10px;
                display: block;
            }

            .css_select_div {
                display: flex;
                gap: 10px;
                margin-bottom: 15px;
            }

            .css_select,
            .css_input {
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                font-size: 14px;
                width: 100%;
                box-sizing: border-box;
            }

            .css_select:focus,
            .css_input:focus {
                border-color: #00796b;
                outline: none;
                box-shadow: 0 0 5px rgba(0, 121, 107, 0.3);
            }

            .css_input {
                margin-bottom: 10px;
            }

            .css_note {
                width: 100%;
                height: 80px;
                resize: vertical;
            }
        </style>
    </head>
    <body>
        <%
            ArrayList<Cart> cart = (ArrayList<Cart>) session.getAttribute("cart");
            int cartSize = (cart != null) ? cart.size() : 0;
        %>
        <header id="header" class="header position-relative">
            <!-- Top Bar -->
            <div class="top-bar py-2">
                <div class="container-fluid container-xl">
                    <div class="row align-items-center">
                        <div class="col-lg-4 d-none d-lg-flex">
                            <div class="top-bar-item">
                                <i class="bi bi-telephone-fill me-2"></i>
                                <span>Need help? Call us: </span>
                                <a href="tel:+1234567890">+1 (234) 567-890</a>
                            </div>
                        </div>

                        <div class="col-lg-4 col-md-12 text-center">
                            <div class="announcement-slider swiper init-swiper">
                                <script type="application/json" class="swiper-config">
                                    {
                                    "loop": true,
                                    "speed": 600,
                                    "autoplay": {
                                    "delay": 5000
                                    },
                                    "slidesPerView": 1,
                                    "direction": "vertical",
                                    "effect": "slide"
                                    }
                                </script>
                                <div class="swiper-wrapper">
                                    <div class="swiper-slide">🚚 Free shipping on orders over $50</div>
                                    <div class="swiper-slide">💰 30 days money back guarantee.</div>
                                    <div class="swiper-slide">🎁 20% off on your first order</div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4 d-none d-lg-block">
                            <div class="d-flex justify-content-end">
                                <div class="top-bar-item dropdown me-3">
                                    <a href="#" class="dropdown-toggle" data-bs-toggle="dropdown">
                                        <i class="bi bi-translate me-2"></i>EN
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="#"><i class="bi bi-check2 me-2 selected-icon"></i>English</a></li>
                                        <li><a class="dropdown-item" href="#">Español</a></li>
                                        <li><a class="dropdown-item" href="#">Français</a></li>
                                        <li><a class="dropdown-item" href="#">Deutsch</a></li>
                                    </ul>
                                </div>
                                <div class="top-bar-item dropdown">
                                    <a href="#" class="dropdown-toggle" data-bs-toggle="dropdown">
                                        <i class="bi bi-currency-dollar me-2"></i>USD
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="#"><i class="bi bi-check2 me-2 selected-icon"></i>USD</a></li>
                                        <li><a class="dropdown-item" href="#">EUR</a></li>
                                        <li><a class="dropdown-item" href="#">GBP</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Main Header -->
            <div class="main-header">
                <div class="container-fluid container-xl">
                    <div class="d-flex py-3 align-items-center justify-content-between">

                        <!-- Logo -->
                        <a href="${pageContext.request.contextPath}/Home" class="logo d-flex align-items-center">
                            <!-- Uncomment the line below if you also wish to use an image logo -->
                            <!-- <img src="${pageContext.request.contextPath}/assets/img/logo.webp" alt=""> -->
                            <h1 class="sitename">eStore</h1>
                        </a>

                        <!-- Search -->
                        <form class="search-form desktop-search-form">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Search for products">
                                <button class="btn" type="submit">
                                    <i class="bi bi-search"></i>
                                </button>
                            </div>
                        </form>

                        <!-- Actions -->
                        <div class="header-actions d-flex align-items-center justify-content-end">

                            <!-- Mobile Search Toggle -->
                            <button class="header-action-btn mobile-search-toggle d-xl-none" type="button" data-bs-toggle="collapse" data-bs-target="#mobileSearch" aria-expanded="false" aria-controls="mobileSearch">
                                <i class="bi bi-search"></i>
                            </button>

                            <!-- Account -->
                            <div class="dropdown account-dropdown">
                                <button class="header-action-btn" data-bs-toggle="dropdown">
                                    <i class="bi bi-person"></i>
                                </button>
                                <div class="dropdown-menu">
                                    <div class="dropdown-header">
                                        <h6>Welcome to <span class="sitename">eStore</span></h6>
                                        <p class="mb-0">Access account &amp; manage orders</p>
                                    </div>
                                    <div class="dropdown-body">
                                        <a class="dropdown-item d-flex align-items-center" href="Profile.jsp">
                                            <i class="bi bi-person-circle me-2"></i>
                                            <span>My Profile</span>
                                        </a>
                                        <a class="dropdown-item d-flex align-items-center" href="account.html">
                                            <i class="bi bi-bag-check me-2"></i>
                                            <span>My Orders</span>
                                        </a>
                                        <a class="dropdown-item d-flex align-items-center" href="account.html">
                                            <i class="bi bi-heart me-2"></i>
                                            <span>My Wishlist</span>
                                        </a>
                                        <a class="dropdown-item d-flex align-items-center" href="account.html">
                                            <i class="bi bi-gear me-2"></i>
                                            <span>Settings</span>
                                        </a>
                                    </div>
                                    <div class="dropdown-footer">
                                        <%
                                            // Kiểm tra session user (ví dụ: attribute "user" được lưu khi login thành công)
                                            if (session.getAttribute("user") != null) {
                                                // Đã login -> hiển thị nút Logout
                                        %>
                                        <a href="<%= request.getContextPath()%>/LogoutAccount" class="btn btn-primary w-100 mb-2">Logout</a>
                                        <%
                                        } else {
                                            // Chưa login -> hiển thị Sign In/Register
                                        %>
                                        <a href="jsp/admin/loginRegister.jsp?tab=login" class="btn btn-primary w-100 mb-2">Sign In</a>
                                        <a href="jsp/admin/loginRegister.jsp?tab=register" class="btn btn-outline-primary w-100">Register</a>
                                        <% }%>
                                    </div>
                                </div>
                            </div>

                            <!-- Wishlist -->
                            <a href="account.html" class="header-action-btn d-none d-md-block">
                                <i class="bi bi-heart"></i>
                                <span class="badge">0</span>
                            </a>

                            <!-- Cart -->
                            <a href="cartList" class="header-action-btn">
                                <i class="bi bi-cart3"></i>
                                <span id="quantityCart" class="badge"><%=cart != null ? cart.size() : 0%></span>
                            </a>

                            <!-- Mobile Navigation Toggle -->
                            <i class="mobile-nav-toggle d-xl-none bi bi-list me-0"></i>

                        </div>
                    </div>
                </div>
            </div>

            <!-- Navigation -->
            <div class="header-nav">
                <div class="container-fluid container-xl">
                    <div class="position-relative">
                        <nav id="navmenu" class="navmenu">
                            <ul>
                                <li><a href="Home" class="active">Home</a></li>
                                <li><a href="about.html">About</a></li>
                                <li><a href="category.html">Category</a></li>
                                <li><a href="product-details.html">Product Details</a></li>
                                <li><a href="cart.html">Cart</a></li>
                                <li><a href="checkout.html">Checkout</a></li>
                                <li class="dropdown"><a href="#"><span>Dropdown</span> <i class="bi bi-chevron-down toggle-dropdown"></i></a>
                                    <ul>
                                        <li><a href="#">Dropdown 1</a></li>
                                        <li class="dropdown"><a href="#"><span>Deep Dropdown</span> <i class="bi bi-chevron-down toggle-dropdown"></i></a>
                                            <ul>
                                                <li><a href="#">Deep Dropdown 1</a></li>
                                                <li><a href="#">Deep Dropdown 2</a></li>
                                                <li><a href="#">Deep Dropdown 3</a></li>
                                                <li><a href="#">Deep Dropdown 4</a></li>
                                                <li><a href="#">Deep Dropdown 5</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="#">Dropdown 2</a></li>
                                        <li><a href="#">Dropdown 3</a></li>
                                        <li><a href="#">Dropdown 4</a></li>
                                    </ul>
                                </li>

                                <!-- Products Mega Menu 1 -->
                                <li class="products-megamenu-1"><a href="#"><span>Megamenu 1</span> <i class="bi bi-chevron-down toggle-dropdown"></i></a>

                                    <!-- Products Mega Menu 1 Mobile View -->
                                    <ul class="mobile-megamenu">

                                        <li><a href="#">Featured Products</a></li>
                                        <li><a href="#">New Arrivals</a></li>
                                        <li><a href="#">Sale Items</a></li>

                                        <li class="dropdown"><a href="#"><span>Clothing</span> <i class="bi bi-chevron-down toggle-dropdown"></i></a>
                                            <ul>
                                                <li><a href="#">Men's Wear</a></li>
                                                <li><a href="#">Women's Wear</a></li>
                                                <li><a href="#">Kids Collection</a></li>
                                                <li><a href="#">Sportswear</a></li>
                                                <li><a href="#">Accessories</a></li>
                                            </ul>
                                        </li>

                                        <li class="dropdown"><a href="#"><span>Electronics</span> <i class="bi bi-chevron-down toggle-dropdown"></i></a>
                                            <ul>
                                                <li><a href="#">Smartphones</a></li>
                                                <li><a href="#">Laptops</a></li>
                                                <li><a href="#">Audio Devices</a></li>
                                                <li><a href="#">Smart Home</a></li>
                                                <li><a href="#">Accessories</a></li>
                                            </ul>
                                        </li>

                                        <li class="dropdown"><a href="#"><span>Home &amp; Living</span> <i class="bi bi-chevron-down toggle-dropdown"></i></a>
                                            <ul>
                                                <li><a href="#">Furniture</a></li>
                                                <li><a href="#">Decor</a></li>
                                                <li><a href="#">Kitchen</a></li>
                                                <li><a href="#">Bedding</a></li>
                                                <li><a href="#">Lighting</a></li>
                                            </ul>
                                        </li>

                                        <li class="dropdown"><a href="#"><span>Beauty</span> <i class="bi bi-chevron-down toggle-dropdown"></i></a>
                                            <ul>
                                                <li><a href="#">Skincare</a></li>
                                                <li><a href="#">Makeup</a></li>
                                                <li><a href="#">Haircare</a></li>
                                                <li><a href="#">Fragrances</a></li>
                                                <li><a href="#">Personal Care</a></li>
                                            </ul>
                                        </li>

                                    </ul><!-- End Products Mega Menu 1 Mobile View -->

                                    <!-- Products Mega Menu 1 Desktop View -->
                                    <div class="desktop-megamenu">

                                        <div class="megamenu-tabs">
                                            <ul class="nav nav-tabs" id="productMegaMenuTabs" role="tablist">
                                                <li class="nav-item" role="presentation">
                                                    <button class="nav-link active" id="featured-tab" data-bs-toggle="tab" data-bs-target="#featured-content-1862" type="button" aria-selected="true" role="tab">Featured</button>
                                                </li>
                                                <li class="nav-item" role="presentation">
                                                    <button class="nav-link" id="new-tab" data-bs-toggle="tab" data-bs-target="#new-content-1862" type="button" aria-selected="false" tabindex="-1" role="tab">New Arrivals</button>
                                                </li>
                                                <li class="nav-item" role="presentation">
                                                    <button class="nav-link" id="sale-tab" data-bs-toggle="tab" data-bs-target="#sale-content-1862" type="button" aria-selected="false" tabindex="-1" role="tab">Sale</button>
                                                </li>
                                                <li class="nav-item" role="presentation">
                                                    <button class="nav-link" id="category-tab" data-bs-toggle="tab" data-bs-target="#category-content-1862" type="button" aria-selected="false" tabindex="-1" role="tab">Categories</button>
                                                </li>
                                            </ul>
                                        </div>

                                        <!-- Tabs Content -->
                                        <div class="megamenu-content tab-content">

                                            <!-- Featured Tab -->
                                            <div class="tab-pane fade show active" id="featured-content-1862" role="tabpanel" aria-labelledby="featured-tab">
                                                <div class="product-grid">
                                                    <div class="product-card">
                                                        <div class="product-image">
                                                            <img src="${pageContext.request.contextPath}/assets/img/product/product-1.webp" alt="Featured Product" loading="lazy">
                                                        </div>
                                                        <div class="product-info">
                                                            <h5>Premium Headphones</h5>
                                                            <p class="price">$129.99</p>
                                                            <a href="#" class="btn-view">View Product</a>
                                                        </div>
                                                    </div>
                                                    <div class="product-card">
                                                        <div class="product-image">
                                                            <img src="${pageContext.request.contextPath}/assets/img/product/product-2.webp" alt="Featured Product" loading="lazy">
                                                        </div>
                                                        <div class="product-info">
                                                            <h5>Smart Watch</h5>
                                                            <p class="price">$199.99</p>
                                                            <a href="#" class="btn-view">View Product</a>
                                                        </div>
                                                    </div>
                                                    <div class="product-card">
                                                        <div class="product-image">
                                                            <img src="${pageContext.request.contextPath}/assets/img/product/product-3.webp" alt="Featured Product" loading="lazy">
                                                        </div>
                                                        <div class="product-info">
                                                            <h5>Wireless Earbuds</h5>
                                                            <p class="price">$89.99</p>
                                                            <a href="#" class="btn-view">View Product</a>
                                                        </div>
                                                    </div>
                                                    <div class="product-card">
                                                        <div class="product-image">
                                                            <img src="${pageContext.request.contextPath}/assets/img/product/product-4.webp" alt="Featured Product" loading="lazy">
                                                        </div>
                                                        <div class="product-info">
                                                            <h5>Bluetooth Speaker</h5>
                                                            <p class="price">$79.99</p>
                                                            <a href="#" class="btn-view">View Product</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- New Arrivals Tab -->
                                            <div class="tab-pane fade" id="new-content-1862" role="tabpanel" aria-labelledby="new-tab">
                                                <div class="product-grid">
                                                    <div class="product-card">
                                                        <div class="product-image">
                                                            <img src="${pageContext.request.contextPath}/assets/img/product/product-5.webp" alt="New Arrival" loading="lazy">
                                                            <span class="badge-new">New</span>
                                                        </div>
                                                        <div class="product-info">
                                                            <h5>Fitness Tracker</h5>
                                                            <p class="price">$69.99</p>
                                                            <a href="#" class="btn-view">View Product</a>
                                                        </div>
                                                    </div>
                                                    <div class="product-card">
                                                        <div class="product-image">
                                                            <img src="${pageContext.request.contextPath}/assets/img/product/product-6.webp" alt="New Arrival" loading="lazy">
                                                            <span class="badge-new">New</span>
                                                        </div>
                                                        <div class="product-info">
                                                            <h5>Wireless Charger</h5>
                                                            <p class="price">$39.99</p>
                                                            <a href="#" class="btn-view">View Product</a>
                                                        </div>
                                                    </div>
                                                    <div class="product-card">
                                                        <div class="product-image">
                                                            <img src="${pageContext.request.contextPath}/assets/img/product/product-7.webp" alt="New Arrival" loading="lazy">
                                                            <span class="badge-new">New</span>
                                                        </div>
                                                        <div class="product-info">
                                                            <h5>Smart Bulb Set</h5>
                                                            <p class="price">$49.99</p>
                                                            <a href="#" class="btn-view">View Product</a>
                                                        </div>
                                                    </div>
                                                    <div class="product-card">
                                                        <div class="product-image">
                                                            <img src="${pageContext.request.contextPath}/assets/img/product/product-8.webp" alt="New Arrival" loading="lazy">
                                                            <span class="badge-new">New</span>
                                                        </div>
                                                        <div class="product-info">
                                                            <h5>Portable Power Bank</h5>
                                                            <p class="price">$59.99</p>
                                                            <a href="#" class="btn-view">View Product</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- Sale Tab -->
                                            <div class="tab-pane fade" id="sale-content-1862" role="tabpanel" aria-labelledby="sale-tab">
                                                <div class="product-grid">
                                                    <div class="product-card">
                                                        <div class="product-image">
                                                            <img src="${pageContext.request.contextPath}/assets/img/product/product-9.webp" alt="Sale Product" loading="lazy">
                                                            <span class="badge-sale">-30%</span>
                                                        </div>
                                                        <div class="product-info">
                                                            <h5>Wireless Keyboard</h5>
                                                            <p class="price"><span class="original-price">$89.99</span> $62.99</p>
                                                            <a href="#" class="btn-view">View Product</a>
                                                        </div>
                                                    </div>
                                                    <div class="product-card">
                                                        <div class="product-image">
                                                            <img src="${pageContext.request.contextPath}/assets/img/product/product-10.webp" alt="Sale Product" loading="lazy">
                                                            <span class="badge-sale">-25%</span>
                                                        </div>
                                                        <div class="product-info">
                                                            <h5>Gaming Mouse</h5>
                                                            <p class="price"><span class="original-price">$59.99</span> $44.99</p>
                                                            <a href="#" class="btn-view">View Product</a>
                                                        </div>
                                                    </div>
                                                    <div class="product-card">
                                                        <div class="product-image">
                                                            <img src="${pageContext.request.contextPath}/assets/img/product/product-11.webp" alt="Sale Product" loading="lazy">
                                                            <span class="badge-sale">-40%</span>
                                                        </div>
                                                        <div class="product-info">
                                                            <h5>Desk Lamp</h5>
                                                            <p class="price"><span class="original-price">$49.99</span> $29.99</p>
                                                            <a href="#" class="btn-view">View Product</a>
                                                        </div>
                                                    </div>
                                                    <div class="product-card">
                                                        <div class="product-image">
                                                            <img src="${pageContext.request.contextPath}/assets/img/product/product-12.webp" alt="Sale Product" loading="lazy">
                                                            <span class="badge-sale">-20%</span>
                                                        </div>
                                                        <div class="product-info">
                                                            <h5>USB-C Hub</h5>
                                                            <p class="price"><span class="original-price">$39.99</span> $31.99</p>
                                                            <a href="#" class="btn-view">View Product</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- Categories Tab -->
                                            <div class="tab-pane fade" id="category-content-1862" role="tabpanel" aria-labelledby="category-tab">
                                                <div class="category-grid">
                                                    <div class="category-column">
                                                        <h4>Clothing</h4>
                                                        <ul>
                                                            <li><a href="#">Men's Wear</a></li>
                                                            <li><a href="#">Women's Wear</a></li>
                                                            <li><a href="#">Kids Collection</a></li>
                                                            <li><a href="#">Sportswear</a></li>
                                                            <li><a href="#">Accessories</a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="category-column">
                                                        <h4>Electronics</h4>
                                                        <ul>
                                                            <li><a href="#">Smartphones</a></li>
                                                            <li><a href="#">Laptops</a></li>
                                                            <li><a href="#">Audio Devices</a></li>
                                                            <li><a href="#">Smart Home</a></li>
                                                            <li><a href="#">Accessories</a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="category-column">
                                                        <h4>Home &amp; Living</h4>
                                                        <ul>
                                                            <li><a href="#">Furniture</a></li>
                                                            <li><a href="#">Decor</a></li>
                                                            <li><a href="#">Kitchen</a></li>
                                                            <li><a href="#">Bedding</a></li>
                                                            <li><a href="#">Lighting</a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="category-column">
                                                        <h4>Beauty</h4>
                                                        <ul>
                                                            <li><a href="#">Skincare</a></li>
                                                            <li><a href="#">Makeup</a></li>
                                                            <li><a href="#">Haircare</a></li>
                                                            <li><a href="#">Fragrances</a></li>
                                                            <li><a href="#">Personal Care</a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>

                                    </div><!-- End Products Mega Menu 1 Desktop View -->

                                </li><!-- End Products Mega Menu 1 -->
                                <!-- Products Mega Menu 2 -->
                                <li class="products-megamenu-2"><a href="#"><span>Megamenu 2</span> <i class="bi bi-chevron-down toggle-dropdown"></i></a>

                                    <!-- Products Mega Menu 2 Mobile View -->
                                    <ul class="mobile-megamenu">

                                        <li><a href="#">Women</a></li>
                                        <li><a href="#">Men</a></li>
                                        <li><a href="#">Kids'</a></li>

                                        <li class="dropdown"><a href="#"><span>Clothing</span> <i class="bi bi-chevron-down toggle-dropdown"></i></a>
                                            <ul>
                                                <li><a href="#">Shirts &amp; Tops</a></li>
                                                <li><a href="#">Coats &amp; Outerwear</a></li>
                                                <li><a href="#">Underwear</a></li>
                                                <li><a href="#">Sweatshirts</a></li>
                                                <li><a href="#">Dresses</a></li>
                                                <li><a href="#">Swimwear</a></li>
                                            </ul>
                                        </li>

                                        <li class="dropdown"><a href="#"><span>Shoes</span> <i class="bi bi-chevron-down toggle-dropdown"></i></a>
                                            <ul>
                                                <li><a href="#">Boots</a></li>
                                                <li><a href="#">Sandals</a></li>
                                                <li><a href="#">Heels</a></li>
                                                <li><a href="#">Loafers</a></li>
                                                <li><a href="#">Slippers</a></li>
                                                <li><a href="#">Oxfords</a></li>
                                            </ul>
                                        </li>

                                        <li class="dropdown"><a href="#"><span>Accessories</span> <i class="bi bi-chevron-down toggle-dropdown"></i></a>
                                            <ul>
                                                <li><a href="#">Handbags</a></li>
                                                <li><a href="#">Eyewear</a></li>
                                                <li><a href="#">Hats</a></li>
                                                <li><a href="#">Watches</a></li>
                                                <li><a href="#">Jewelry</a></li>
                                                <li><a href="#">Belts</a></li>
                                            </ul>
                                        </li>

                                        <li class="dropdown"><a href="#"><span>Specialty Sizes</span> <i class="bi bi-chevron-down toggle-dropdown"></i></a>
                                            <ul>
                                                <li><a href="#">Plus Size</a></li>
                                                <li><a href="#">Petite</a></li>
                                                <li><a href="#">Wide Shoes</a></li>
                                                <li><a href="#">Narrow Shoes</a></li>
                                            </ul>
                                        </li>

                                    </ul><!-- End Products Mega Menu 2 Mobile View -->

                                    <!-- Products Mega Menu 2 Desktop View -->
                                    <div class="desktop-megamenu">

                                        <div class="megamenu-tabs">
                                            <ul class="nav nav-tabs" role="tablist">
                                                <li class="nav-item" role="presentation">
                                                    <button class="nav-link active" id="womens-tab" data-bs-toggle="tab" data-bs-target="#womens-content-1883" type="button" aria-selected="true" role="tab">WOMEN</button>
                                                </li>
                                                <li class="nav-item" role="presentation">
                                                    <button class="nav-link" id="mens-tab" data-bs-toggle="tab" data-bs-target="#mens-content-1883" type="button" aria-selected="false" tabindex="-1" role="tab">MEN</button>
                                                </li>
                                                <li class="nav-item" role="presentation">
                                                    <button class="nav-link" id="kids-tab" data-bs-toggle="tab" data-bs-target="#kids-content-1883" type="button" aria-selected="false" tabindex="-1" role="tab">KIDS</button>
                                                </li>
                                            </ul>
                                        </div>

                                        <!-- Tabs Content -->
                                        <div class="megamenu-content tab-content">

                                            <!-- Women Tab -->
                                            <div class="tab-pane fade show active" id="womens-content-1883" role="tabpanel" aria-labelledby="womens-tab">
                                                <div class="category-layout">
                                                    <div class="categories-section">
                                                        <div class="category-headers">
                                                            <h4>Clothing</h4>
                                                            <h4>Shoes</h4>
                                                            <h4>Accessories</h4>
                                                            <h4>Specialty Sizes</h4>
                                                        </div>

                                                        <div class="category-links">
                                                            <div class="link-row">
                                                                <a href="#">Shirts &amp; Tops</a>
                                                                <a href="#">Boots</a>
                                                                <a href="#">Handbags</a>
                                                                <a href="#">Plus Size</a>
                                                            </div>
                                                            <div class="link-row">
                                                                <a href="#">Coats &amp; Outerwear</a>
                                                                <a href="#">Sandals</a>
                                                                <a href="#">Eyewear</a>
                                                                <a href="#">Petite</a>
                                                            </div>
                                                            <div class="link-row">
                                                                <a href="#">Underwear</a>
                                                                <a href="#">Heels</a>
                                                                <a href="#">Hats</a>
                                                                <a href="#">Wide Shoes</a>
                                                            </div>
                                                            <div class="link-row">
                                                                <a href="#">Sweatshirts</a>
                                                                <a href="#">Loafers</a>
                                                                <a href="#">Watches</a>
                                                                <a href="#">Narrow Shoes</a>
                                                            </div>
                                                            <div class="link-row">
                                                                <a href="#">Dresses</a>
                                                                <a href="#">Slippers</a>
                                                                <a href="#">Jewelry</a>
                                                                <a href="#"></a>
                                                            </div>
                                                            <div class="link-row">
                                                                <a href="#">Swimwear</a>
                                                                <a href="#">Oxfords</a>
                                                                <a href="#">Belts</a>
                                                                <a href="#"></a>
                                                            </div>
                                                            <div class="link-row">
                                                                <a href="#">View all</a>
                                                                <a href="#">View all</a>
                                                                <a href="#">View all</a>
                                                                <a href="#"></a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="featured-section">
                                                        <div class="featured-image">
                                                            <img src="${pageContext.request.contextPath}/assets/img/product/product-f-1.webp" alt="Women's Heels Collection">
                                                            <div class="featured-content">
                                                                <h3>Women's<br>Bags<br>Collection</h3>
                                                                <a href="#" class="btn-shop">Shop now</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- Men Tab -->
                                            <div class="tab-pane fade" id="mens-content-1883" role="tabpanel" aria-labelledby="mens-tab">
                                                <div class="category-layout">
                                                    <div class="categories-section">
                                                        <div class="category-headers">
                                                            <h4>Clothing</h4>
                                                            <h4>Shoes</h4>
                                                            <h4>Accessories</h4>
                                                            <h4>Specialty Sizes</h4>
                                                        </div>

                                                        <div class="category-links">
                                                            <div class="link-row">
                                                                <a href="#">Shirts &amp; Polos</a>
                                                                <a href="#">Sneakers</a>
                                                                <a href="#">Watches</a>
                                                                <a href="#">Big &amp; Tall</a>
                                                            </div>
                                                            <div class="link-row">
                                                                <a href="#">Jackets &amp; Coats</a>
                                                                <a href="#">Boots</a>
                                                                <a href="#">Belts</a>
                                                                <a href="#">Slim Fit</a>
                                                            </div>
                                                            <div class="link-row">
                                                                <a href="#">Underwear</a>
                                                                <a href="#">Loafers</a>
                                                                <a href="#">Ties</a>
                                                                <a href="#">Wide Shoes</a>
                                                            </div>
                                                            <div class="link-row">
                                                                <a href="#">Hoodies</a>
                                                                <a href="#">Dress Shoes</a>
                                                                <a href="#">Wallets</a>
                                                                <a href="#">Extended Sizes</a>
                                                            </div>
                                                            <div class="link-row">
                                                                <a href="#">Suits</a>
                                                                <a href="#">Sandals</a>
                                                                <a href="#">Sunglasses</a>
                                                                <a href="#"></a>
                                                            </div>
                                                            <div class="link-row">
                                                                <a href="#">Activewear</a>
                                                                <a href="#">Slippers</a>
                                                                <a href="#">Hats</a>
                                                                <a href="#"></a>
                                                            </div>
                                                            <div class="link-row">
                                                                <a href="#">View all</a>
                                                                <a href="#">View all</a>
                                                                <a href="#">View all</a>
                                                                <a href="#"></a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="featured-section">
                                                        <div class="featured-image">
                                                            <img src="${pageContext.request.contextPath}/assets/img/product/product-m-4.webp" alt="Men's Footwear Collection">
                                                            <div class="featured-content">
                                                                <h3>Men's<br>Footwear<br>Collection</h3>
                                                                <a href="#" class="btn-shop">Shop now</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- Kids Tab -->
                                            <div class="tab-pane fade" id="kids-content-1883" role="tabpanel" aria-labelledby="kids-tab">
                                                <div class="category-layout">
                                                    <div class="categories-section">
                                                        <div class="category-headers">
                                                            <h4>Clothing</h4>
                                                            <h4>Shoes</h4>
                                                            <h4>Accessories</h4>
                                                            <h4>By Age</h4>
                                                        </div>

                                                        <div class="category-links">
                                                            <div class="link-row">
                                                                <a href="#">T-shirts &amp; Tops</a>
                                                                <a href="#">Sneakers</a>
                                                                <a href="#">Backpacks</a>
                                                                <a href="#">Babies (0-24 months)</a>
                                                            </div>
                                                            <div class="link-row">
                                                                <a href="#">Outerwear</a>
                                                                <a href="#">Boots</a>
                                                                <a href="#">Hats &amp; Caps</a>
                                                                <a href="#">Toddlers (2-4 years)</a>
                                                            </div>
                                                            <div class="link-row">
                                                                <a href="#">Pajamas</a>
                                                                <a href="#">Sandals</a>
                                                                <a href="#">Socks</a>
                                                                <a href="#">Kids (4-7 years)</a>
                                                            </div>
                                                            <div class="link-row">
                                                                <a href="#">Sweatshirts</a>
                                                                <a href="#">Slippers</a>
                                                                <a href="#">Gloves</a>
                                                                <a href="#">Older Kids (8-14 years)</a>
                                                            </div>
                                                            <div class="link-row">
                                                                <a href="#">Dresses</a>
                                                                <a href="#">School Shoes</a>
                                                                <a href="#">Scarves</a>
                                                                <a href="#"></a>
                                                            </div>
                                                            <div class="link-row">
                                                                <a href="#">Swimwear</a>
                                                                <a href="#">Sports Shoes</a>
                                                                <a href="#">Hair Accessories</a>
                                                                <a href="#"></a>
                                                            </div>
                                                            <div class="link-row">
                                                                <a href="#">View all</a>
                                                                <a href="#">View all</a>
                                                                <a href="#">View all</a>
                                                                <a href="#"></a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="featured-section">
                                                        <div class="featured-image">
                                                            <img src="${pageContext.request.contextPath}/assets/img/product/product-9.webp" alt="Kids' New Arrivals">
                                                            <div class="featured-content">
                                                                <h3>Kids<br>New<br>Arrivals</h3>
                                                                <a href="#" class="btn-shop">Shop now</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>

                                    </div><!-- End Products Mega Menu 2 Desktop View -->

                                </li><!-- End Products Mega Menu 2 -->

                                <li><a href="contact.html">Contact</a></li>

                            </ul>
                        </nav>
                    </div>
                </div>
            </div>

            <!-- Mobile Search Form -->
            <div class="collapse" id="mobileSearch">
                <div class="container">
                    <form class="search-form">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Search for products">
                            <button class="btn" type="submit">
                                <i class="bi bi-search"></i>
                            </button>
                        </div>
                    </form>
                </div>
            </div>

        </header>

        <!-- Modal: Hướng dẫn thanh toán bằng ảnh -->
        <div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Hướng dẫn thanh toán</h5>

                    </div>
                    <div class="modal-body">
                        <!-- Danh sách ảnh hướng dẫn -->
                        <c:forEach begin="1" end="12" var="i">
                            <img style="max-width: 100%; padding-bottom: 2%;" src="img/cart-completion/htu${i}.png"><br>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal: Hướng dẫn thanh toán bằng video -->
        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Hướng dẫn thanh toán bằng video</h5>

                    </div>
                    <div class="modal-body text-center">
                        <video style="max-width: 100%;" controls>
                            <source src="https://sandbox.vnpayment.vn/apis/assets/images/Gioi-thieu-CTT-VNPAY.mp4" type="video/mp4">
                            Trình duyệt của bạn không hỗ trợ video.
                        </video>
                    </div>
                </div>
            </div>
        </div>

        <!-- Giao diện cảm ơn và chọn thanh toán -->
        <div class="container rounded bg-white mt-5 mb-5">
            <form id="formCheckout">
                <div class="row" style="margin-top: 9%;">
                    <h1 class="mb-4">🛒Cart Checkout</h1>
                    <div class="col-md-12">
                        <table class="table table-bordered table-hover align-middle text-center">
                            <thead class="table-primary">
                                <tr>
                                    <th>#</th>
                                    <th>Image</th>
                                    <th>Name</th>
                                    <th>Variant</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Total</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    int index = 1;
                                    double grandTotal = 0;
                                    for (Cart item : cart) {
                                        Product p = item.getProduct();
                                        ProductVariant variant = item.getProductVariant();
                                        long price = variant.getPrice();
                                        String imgUrl = p.getThumbnailURL() != null ? p.getThumbnailURL() : "img/default.jpg";
                                        double total = price * item.getQuantity();
                                        grandTotal += total;
                                %>
                                <tr>
                                    <td><%= index++%></td>
                                    <td>
                                        <img src="<%= imgUrl%>" alt="Product" class="img-thumbnail" style="width: 80px; height: 80px; object-fit: cover;">
                                    </td>
                                    <td><%= p.getProductName()%></td>
                                    <td>
                                        <% if (variant.getColor() != null) {%>
                                        <span><b>Color:</b> <%= variant.getColor().getName()%></span><br>
                                        <% } %>
                                        <% if (variant.getSize() != null) {%>
                                        <span><b>Size:</b> <%= variant.getSize().getName()%></span>
                                        <% }%>
                                    </td>
                                    <td>$<%= price%></td>
                                    <td>
                                        <input type="number" class="form-control text-center" value="<%= item.getQuantity()%>" readonly>
                                    </td>
                                    <td>$<%= String.format("%.0f", total)%></td>
                                </tr>
                                <% }%>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <td colspan="6" class="text-end fw-bold">Grand Total:</td>
                                    <td class="fw-bold">$<%= String.format("%.0f", grandTotal)%></td>
                                    <td></td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                    <!-- Cảm ơn và nút hướng dẫn -->
                    <!--                    <div class="col-md-6 border-right">
                                            <div class="p-3 py-5 text-center">
                                                <img style="width: 40%;" src="${pageContext.request.contextPath}/img/confirm.png">
                                                <h3 class="mt-3">Cảm ơn vì đã đặt hàng</h3>
                                                <p>Chúng tôi sẽ gửi cho bạn một email xác nhận đơn hàng với thông tin chi tiết và hướng dẫn thanh toán.</p>
                                                <button type="button" class="btn btn-outline-dark mt-3" data-toggle="modal" data-target="#exampleModalLong">
                                                    Hướng dẫn thanh toán
                                                </button>
                                                <button type="button" class="btn btn-outline-dark mt-3" data-toggle="modal" data-target="#exampleModalCenter">
                                                    Hướng dẫn bằng video
                                                </button>
                                            </div>
                                        </div>-->

                    <div class="col-md-6">
                        <div class="css_address_section">
                            <label class="css_address_label">Địa chỉ giao hàng</label>
                            <div class="css_select_div">
                                <select class="css_select" id="tinh" name="provinceCode" title="Chọn Tỉnh Thành" required>
                                    <option value="0">Tỉnh Thành</option>
                                </select>
                                <select class="css_select" id="quan" name="districtCode" title="Chọn Quận Huyện" required>
                                    <option value="0">Quận Huyện</option>
                                </select>
                                <select class="css_select" id="phuong" name="wardCode" title="Chọn Phường Xã" required>
                                    <option value="0">Phường Xã</option>
                                </select>
                            </div>
                            <input type="text" class="css_input" id="soNha" name="soNha" placeholder="Số nhà" required>
                            <div id="response" style="text-align: center; margin-top: 15px;"></div>
                        </div>
                    </div>
                    <!-- Form chọn hình thức thanh toán -->
                    <div class="col-md-6">
                        <div class="p-3">
                            <label class="css_address_label">Hình thức thanh toán</label>
                            <label class="payment-method__item">
                                <input type="radio" name="paymentMethod" value="COD" checked>
                                <span class="checkmark"></span>
                                <span class="payment-method__item-icon-wrapper"><img src="img/cart-completion/cod.png" alt=""></span>
                                <span class="payment-method__item-name">COD<br>Thanh toán khi nhận hàng</span>
                            </label>

                            <label class="payment-method__item">
                                <input type="radio" name="paymentMethod" value="vnpay" hidden>
                                <span class="checkmark"></span>
                                <span class="payment-method__item-icon-wrapper"><img src="img/cart-completion/vnpay.png" alt=""></span>
                                <span class="payment-method__item-name">
                                    Thẻ ATM / Internet Banking<br>Thẻ tín dụng / Ghi nợ<br>QR VNPay
                                </span>
                            </label>

                            <div class="text-center mt-4">
                                <button class="btn btn-primary" type="submit">Thanh toán</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>


        <footer id="footer" class="footer" style="margin-top: 40px">
            <div class="footer-newsletter">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-8 text-center">
                            <h2>Join Our Newsletter</h2>
                            <p>Subscribe to get special offers, free giveaways, and once-in-a-lifetime deals.</p>
                            <form action="forms/newsletter.php" method="post" class="php-email-form">
                                <div class="newsletter-form d-flex">
                                    <input type="email" name="email" placeholder="Your email address" required="">
                                    <button type="submit">Subscribe</button>
                                </div>
                                <div class="loading">Loading</div>
                                <div class="error-message"></div>
                                <div class="sent-message">Your subscription request has been sent. Thank you!</div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <div class="footer-main">
                <div class="container">
                    <div class="row gy-4">
                        <div class="col-lg-3 col-md-6 col-sm-12">
                            <div class="footer-widget footer-about">
                                <a href="Home" class="logo">
                                    <span class="sitename">eStore</span>
                                </a>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam in nibh vehicula, facilisis magna ut, consectetur lorem.</p>
                                <div class="footer-contact mt-4">
                                    <div class="contact-item">
                                        <i class="bi bi-geo-alt"></i>
                                        <span>123 Fashion Street, New York, NY 10001</span>
                                    </div>
                                    <div class="contact-item">
                                        <i class="bi bi-telephone"></i>
                                        <span>+1 (555) 123-4567</span>
                                    </div>
                                    <div class="contact-item">
                                        <i class="bi bi-envelope"></i>
                                        <span>hello@example.com</span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-2 col-md-6 col-sm-6">
                            <div class="footer-widget">
                                <h4>Shop</h4>
                                <ul class="footer-links">
                                    <li><a href="category.html">New Arrivals</a></li>
                                    <li><a href="category.html">Bestsellers</a></li>
                                    <li><a href="category.html">Women's Clothing</a></li>
                                    <li><a href="category.html">Men's Clothing</a></li>
                                    <li><a href="category.html">Accessories</a></li>
                                    <li><a href="category.html">Sale</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="col-lg-2 col-md-6 col-sm-6">
                            <div class="footer-widget">
                                <h4>Support</h4>
                                <ul class="footer-links">
                                    <li><a href="support.html">Help Center</a></li>
                                    <li><a href="account.html">Order Status</a></li>
                                    <li><a href="shiping-info.html">Shipping Info</a></li>
                                    <li><a href="return-policy.html">Returns &amp; Exchanges</a></li>
                                    <li><a href="#">Size Guide</a></li>
                                    <li><a href="contact.html">Contact Us</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="col-lg-2 col-md-6 col-sm-6">
                            <div class="footer-widget">
                                <h4>Company</h4>
                                <ul class="footer-links">
                                    <li><a href="about.html">About Us</a></li>
                                    <li><a href="about.html">Careers</a></li>
                                    <li><a href="about.html">Press</a></li>
                                    <li><a href="about.html">Affiliates</a></li>
                                    <li><a href="about.html">Responsibility</a></li>
                                    <li><a href="about.html">Investors</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="footer-widget">
                                <h4>Download Our App</h4>
                                <p>Shop on the go with our mobile app</p>
                                <div class="app-buttons">
                                    <a href="#" class="app-btn">
                                        <i class="bi bi-apple"></i>
                                        <span>App Store</span>
                                    </a>
                                    <a href="#" class="app-btn">
                                        <i class="bi bi-google-play"></i>
                                        <span>Google Play</span>
                                    </a>
                                </div>
                                <div class="social-links mt-4">
                                    <h5>Follow Us</h5>
                                    <div class="social-icons">
                                        <a href="#" aria-label="Facebook"><i class="bi bi-facebook"></i></a>
                                        <a href="#" aria-label="Instagram"><i class="bi bi-instagram"></i></a>
                                        <a href="#" aria-label="Twitter"><i class="bi bi-twitter-x"></i></a>
                                        <a href="#" aria-label="TikTok"><i class="bi bi-tiktok"></i></a>
                                        <a href="#" aria-label="Pinterest"><i class="bi bi-pinterest"></i></a>
                                        <a href="#" aria-label="YouTube"><i class="bi bi-youtube"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="footer-bottom">
                <div class="container">

                    <div class="payment-methods d-flex align-items-center justify-content-center">
                        <span>We Accept:</span>
                        <div class="payment-icons">
                            <i class="bi bi-credit-card" aria-label="Credit Card"></i>
                            <i class="bi bi-paypal" aria-label="PayPal"></i>
                            <i class="bi bi-apple" aria-label="Apple Pay"></i>
                            <i class="bi bi-google" aria-label="Google Pay"></i>
                            <i class="bi bi-shop" aria-label="Shop Pay"></i>
                            <i class="bi bi-cash" aria-label="Cash on Delivery"></i>
                        </div>
                    </div>

                    <div class="legal-links">
                        <a href="tos.html">Terms of Service</a>
                        <a href="privacy.html">Privacy Policy</a>
                        <a href="tos.html">Cookies Settings</a>
                    </div>

                    <div class="copyright text-center">
                        <p>© <span>Copyright</span> <strong class="sitename">eStore</strong>. All Rights Reserved.</p>
                    </div>

                    <div class="credits">
                        <!-- All the links in the footer should remain intact. -->
                        <!-- You can delete the links only if you've purchased the pro version. -->
                        <!-- Licensing information: https://bootstrapmade.com/license/ -->
                        <!-- Purchase the pro version with working PHP/AJAX contact form: [buy-url] -->
                        Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
                    </div>

                </div>

            </div>
        </footer>

        <!-- Bootstrap JS and Popper -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
            $(document).ready(function () {
                // Lấy danh sách tỉnh/thành
                $.getJSON('https://provinces.open-api.vn/api/p/', function (data) {
                    $.each(data, function (index, val) {
                        $("#tinh").append('<option value="' + val.code + '">' + val.name + '</option>');
                    });
                });

                // Khi chọn tỉnh, lấy danh sách quận/huyện
                $("#tinh").change(function () {
                    var provinceCode = $(this).val();
                    $("#quan").html('<option value="0">Quận Huyện</option>');
                    $("#phuong").html('<option value="0">Phường Xã</option>');
                    if (provinceCode !== "0") {
                        $.getJSON('https://provinces.open-api.vn/api/p/' + provinceCode + '?depth=2', function (data) {
                            $.each(data.districts, function (index, val) {
                                $("#quan").append('<option value="' + val.code + '">' + val.name + '</option>');
                            });
                        });
                    }
                });

                // Khi chọn quận/huyện, lấy danh sách phường/xã
                $("#quan").change(function () {
                    var districtCode = $(this).val();
                    $("#phuong").html('<option value="0">Phường Xã</option>');
                    if (districtCode !== "0") {
                        $.getJSON('https://provinces.open-api.vn/api/d/' + districtCode + '?depth=2', function (data) {
                            $.each(data.wards, function (index, val) {
                                $("#phuong").append('<option value="' + val.code + '">' + val.name + '</option>');
                            });
                        });
                    }
                });

                $("#formCheckout").submit(function (event) {
                    event.preventDefault();
                    if ($("#tinh").val() === "0" || $("#quan").val() === "0" || $("#phuong").val() === "0") {
                        $("#response").html("Vui lòng chọn đầy đủ Tỉnh, Quận/Huyện và Phường/Xã.");
                        return;
                    }

                    // Lấy cả id và name từ các dropdown
                    var formData = {
                        provinceCode: $("#tinh").val(),
                        provinceName: $("#tinh option:selected").text(),
                        districtCode: $("#quan").val(),
                        districtName: $("#quan option:selected").text(),
                        wardCode: $("#phuong").val(),
                        wardName: $("#phuong option:selected").text(),
                        soNha: $("#soNha").val(),
                        paymentMethod: $("input[name='paymentMethod']:checked").val()
                    };

                    $.ajax({
                        url: 'checkout',
                        type: 'POST',
                        data: formData,
                        success: function (response) {
                            console.log(response);
                            window.location.href = response;//redirect
                        },
                        error: function () {
                            $("#response").html("Đã có lỗi xảy ra khi gửi dữ liệu.");
                        }
                    });
                });
            });
        </script>
    </body>
</html>