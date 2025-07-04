<%-- 
    Document   : Home
    Created on : Jun 1, 2025, 7:16:34 PM
    Author     : tulok
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Cart" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <title>Index - eStore Bootstrap Template</title>
        <meta name="description" content="">
        <meta name="keywords" content="">

        <!-- Favicon -->
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
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <style>
            .view-all-btn {
                background-color: #007bff;             /* Màu nền xanh */
                color: white;                          /* Màu chữ trắng */
                padding: 12px 30px;                    /* Khoảng cách trong */
                border-radius: 8px;                    /* Bo góc vừa phải */
                font-size: 16px;                       /* Cỡ chữ */
                font-weight: 600;                      /* Đậm */
                text-decoration: none;                 /* Bỏ gạch dưới */
                box-shadow: 0 4px 12px rgba(0, 123, 255, 0.2); /* Đổ bóng nhẹ */
                transition: all 0.3s ease;             /* Hiệu ứng mượt */
                display: inline-flex;
                align-items: center;
                gap: 8px;
            }

            .view-all-btn:hover {
                background-color: #0056b3;             /* Màu khi hover */
                box-shadow: 0 6px 16px rgba(0, 86, 179, 0.3); /* Đổ bóng mạnh hơn */
                transform: translateY(-2px);           /* Nhấc lên khi hover */
                color: white;
                text-decoration: none;
            }
            /* === Product Card Layout === */
            .product-card {
                background: #ffffff;
                border-radius: 10px;
                overflow: hidden;
                box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
                transition: all 0.3s ease;
            }

            .product-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 8px 24px rgba(0, 0, 0, 0.1);
            }

            /* === Product Image Hover === */
            .product-image {
                position: relative;
                overflow: hidden;
            }

            .product-image img {
                width: 100%;
                transition: transform 0.3s ease;
            }

            .product-card:hover .product-image img.main-img {
                transform: scale(1.05);
            }

            .badge {
                position: absolute;
                top: 10px;
                left: 10px;
                background-color: #e63946;
                color: white;
                padding: 4px 8px;
                border-radius: 4px;
                font-size: 12px;
                font-weight: 500;
                z-index: 1;
            }

            /* === Product Info === */
            .product-info {
                padding: 15px;
                background-color: #fff;
            }

            .product-title a {
                font-size: 16px;
                font-weight: 600;
                color: #333;
                text-decoration: none;
                transition: color 0.3s;
            }

            .product-title a:hover {
                color: #007bff;
            }

            /* === Product Price === */
            .product-price {
                margin: 10px 0;
                font-size: 18px;
                font-weight: 600;
                display: flex;
                align-items: baseline;
                gap: 10px;
            }

            .product-price .current-price {
                color: #e63946;
                font-weight: bold;
            }

            .product-price .old-price {
                color: #999;
                font-size: 14px;
                text-decoration: line-through;
            }

            /* === Product Variant Info: Color & Size === */
            .color-dot {
                display: inline-block;
                width: 14px;
                height: 14px;
                border-radius: 50%;
                margin-right: 5px;
                vertical-align: middle;
                border: 1px solid #ccc; /* Viền mỏng để thấy cả màu sáng như trắng */
            }
            .product-variant-info {
                background-color: #f0f0f0;
                padding: 6px 12px;
                border-radius: 8px;
                display: inline-block;
                margin-top: 5px;
                font-size: 0.875rem;
            }

            /* === Product Rating === */
            .product-rating {
                font-size: 14px;
                color: #f7c948;
                margin-top: 5px;
            }

            /* === Overlay and Cart === */
            .product-overlay {
                position: absolute;
                bottom: 0;
                left: 0;
                right: 0;
                padding: 10px;
                background: rgba(0, 0, 0, 0.05);
                opacity: 0;
                transition: 0.3s ease-in-out;
                text-align: center;
            }

            .product-card:hover .product-overlay {
                opacity: 1;
            }

            .btn-cart {
                background: #007bff;
                color: white;
                padding: 8px 14px;
                font-size: 14px;
                border-radius: 6px;
                text-decoration: none;
                display: inline-block;
                transition: background 0.3s ease;
            }

            .btn-cart:hover {
                background: #0056b3;
                color: white;
            }

            /* === Product Actions === */
            .product-actions {
                margin-top: 10px;
            }

            .action-btn {
                color: #333;
                margin: 0 5px;
                font-size: 16px;
                transition: color 0.2s;
            }

            .action-btn:hover {
                color: #007bff;
            }
        </style>
    </head>

    <body class="index-page">
        <%
            ArrayList<Cart> cart = (ArrayList<Cart>) session.getAttribute("cart");
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
                        <a href="index.html" class="logo d-flex align-items-center">
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
                                        <a class="dropdown-item d-flex align-items-center" href="jsp/Profile.jsp">
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
                                <li><a href="index.html" class="active">Home</a></li>
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

        <main class="main">

            <!-- Hero Section -->
            <section class="ecommerce-hero-1 hero section" id="hero">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-lg-6 content-col" data-aos="fade-right" data-aos-delay="100">
                            <div class="content">
                                <span class="promo-badge">New Collection 2025</span>
                                <h1>Discover Stylish <span>Fashion</span> For Every Season</h1>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut elit tellus, luctus nec ullamcorper mattis, pulvinar dapibus leo. Vestibulum ante ipsum primis in faucibus.</p>
                                <div class="hero-cta">
                                    <a href="#" class="btn btn-shop">Shop Now <i class="bi bi-arrow-right"></i></a>
                                    <a href="#" class="btn btn-collection">View Collection</a>
                                </div>
                                <div class="hero-features">
                                    <div class="feature-item">
                                        <i class="bi bi-truck"></i>
                                        <span>Free Shipping</span>
                                    </div>
                                    <div class="feature-item">
                                        <i class="bi bi-shield-check"></i>
                                        <span>Secure Payment</span>
                                    </div>
                                    <div class="feature-item">
                                        <i class="bi bi-arrow-repeat"></i>
                                        <span>Easy Returns</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 image-col" data-aos="fade-left" data-aos-delay="200">
                            <div class="hero-image">
                                <img src="${pageContext.request.contextPath}/assets/img/product/product-f-9.webp" alt="Fashion Product" class="main-product" loading="lazy">
                                <div class="floating-product product-1" data-aos="fade-up" data-aos-delay="300">
                                    <img src="${pageContext.request.contextPath}/assets/img/product/product-4.webp" alt="Product 2">
                                    <div class="product-info">
                                        <h4>Summer Collection</h4>
                                        <span class="price">$89.99</span>
                                    </div>
                                </div>
                                <div class="floating-product product-2" data-aos="fade-up" data-aos-delay="400">
                                    <img src="${pageContext.request.contextPath}/assets/img/product/product-3.webp" alt="Product 3">
                                    <div class="product-info">
                                        <h4>Casual Wear</h4>
                                        <span class="price">$59.99</span>
                                    </div>
                                </div>
                                <div class="discount-badge" data-aos="zoom-in" data-aos-delay="500">
                                    <span class="percent">30%</span>
                                    <span class="text">OFF</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section><!-- /Hero Section -->

            <!-- Info Cards Section -->
            <section id="info-cards" class="info-cards section light-background">

                <div class="container" data-aos="fade-up" data-aos-delay="100">

                    <div class="row g-4 justify-content-center">
                        <!-- Info Card 1 -->
                        <div class="col-12 col-sm-6 col-lg-3" data-aos="fade-up" data-aos-delay="200">
                            <div class="info-card text-center">
                                <div class="icon-box">
                                    <i class="bi bi-truck"></i>
                                </div>
                                <h3>Free Shipping</h3>
                                <p>Nulla sit morbi vestibulum eros duis amet, consectetur vitae lacus. Ut quis tempor felis sed nunc viverra.</p>
                            </div>
                        </div><!-- End Info Card 1 -->

                        <!-- Info Card 2 -->
                        <div class="col-12 col-sm-6 col-lg-3" data-aos="fade-up" data-aos-delay="300">
                            <div class="info-card text-center">
                                <div class="icon-box">
                                    <i class="bi bi-piggy-bank"></i>
                                </div>
                                <h3>Money Back Guarantee</h3>
                                <p>Nullam gravida felis ac nunc tincidunt, sed malesuada justo pulvinar. Vestibulum nec diam vitae eros.</p>
                            </div>
                        </div><!-- End Info Card 2 -->

                        <!-- Info Card 3 -->
                        <div class="col-12 col-sm-6 col-lg-3" data-aos="fade-up" data-aos-delay="400">
                            <div class="info-card text-center">
                                <div class="icon-box">
                                    <i class="bi bi-percent"></i>
                                </div>
                                <h3>Discount Offers</h3>
                                <p>Nulla ipsum nisi vel adipiscing amet, dignissim consectetur ornare. Vestibulum quis posuere elit auctor.</p>
                            </div>
                        </div><!-- End Info Card 3 -->

                        <!-- Info Card 4 -->
                        <div class="col-12 col-sm-6 col-lg-3" data-aos="fade-up" data-aos-delay="500">
                            <div class="info-card text-center">
                                <div class="icon-box">
                                    <i class="bi bi-headset"></i>
                                </div>
                                <h3>24/7 Support</h3>
                                <p>Ipsum dolor amet sit consectetur adipiscing, nullam vitae euismod tempor nunc felis vestibulum ornare.</p>
                            </div>
                        </div><!-- End Info Card 4 -->
                    </div>

                </div>

            </section><!-- /Info Cards Section -->

            <!-- Category Cards Section -->
            <section id="category-cards" class="category-cards section">

                <div class="container" data-aos="fade-up" data-aos-delay="100">

                    <div class="category-slider swiper init-swiper">
                        <script type="application/json" class="swiper-config">
                            {
                            "loop": true,
                            "autoplay": {
                            "delay": 5000,
                            "disableOnInteraction": false
                            },
                            "grabCursor": true,
                            "speed": 600,
                            "slidesPerView": "auto",
                            "spaceBetween": 20,
                            "navigation": {
                            "nextEl": ".swiper-button-next",
                            "prevEl": ".swiper-button-prev"
                            },
                            "breakpoints": {
                            "320": {
                            "slidesPerView": 2,
                            "spaceBetween": 15
                            },
                            "576": {
                            "slidesPerView": 3,
                            "spaceBetween": 15
                            },
                            "768": {
                            "slidesPerView": 4,
                            "spaceBetween": 20
                            },
                            "992": {
                            "slidesPerView": 5,
                            "spaceBetween": 20
                            },
                            "1200": {
                            "slidesPerView": 6,
                            "spaceBetween": 20
                            }
                            }
                            }
                        </script>

                        <div class="swiper-wrapper">
                            <!-- Category Card 1 -->
                            <div class="swiper-slide">
                                <div class="category-card" data-aos="fade-up" data-aos-delay="100">
                                    <div class="category-image">
                                        <img src="${pageContext.request.contextPath}/assets/img/product/product-1.webp" alt="Category" class="img-fluid">
                                    </div>
                                    <h3 class="category-title">Vestibulum ante</h3>
                                    <p class="category-count">4 Products</p>
                                    <a href="ctaegory.html" class="stretched-link"></a>
                                </div>
                            </div>

                            <!-- Category Card 2 -->
                            <div class="swiper-slide">
                                <div class="category-card" data-aos="fade-up" data-aos-delay="200">
                                    <div class="category-image">
                                        <img src="${pageContext.request.contextPath}/assets/img/product/product-6.webp" alt="Category" class="img-fluid">
                                    </div>
                                    <h3 class="category-title">Maecenas nec</h3>
                                    <p class="category-count">8 Products</p>
                                    <a href="ctaegory.html" class="stretched-link"></a>
                                </div>
                            </div>

                            <!-- Category Card 3 -->
                            <div class="swiper-slide">
                                <div class="category-card" data-aos="fade-up" data-aos-delay="300">
                                    <div class="category-image">
                                        <img src="${pageContext.request.contextPath}/assets/img/product/product-9.webp" alt="Category" class="img-fluid">
                                    </div>
                                    <h3 class="category-title">Aenean tellus</h3>
                                    <p class="category-count">4 Products</p>
                                    <a href="ctaegory.html" class="stretched-link"></a>
                                </div>
                            </div>

                            <!-- Category Card 4 -->
                            <div class="swiper-slide">
                                <div class="category-card" data-aos="fade-up" data-aos-delay="400">
                                    <div class="category-image">
                                        <img src="${pageContext.request.contextPath}/assets/img/product/product-f-1.webp" alt="Category" class="img-fluid">
                                    </div>
                                    <h3 class="category-title">Donec quam</h3>
                                    <p class="category-count">12 Products</p>
                                    <a href="ctaegory.html" class="stretched-link"></a>
                                </div>
                            </div>

                            <!-- Category Card 5 -->
                            <div class="swiper-slide">
                                <div class="category-card" data-aos="fade-up" data-aos-delay="500">
                                    <div class="category-image">
                                        <img src="${pageContext.request.contextPath}/assets/img/product/product-10.webp" alt="Category" class="img-fluid">
                                    </div>
                                    <h3 class="category-title">Phasellus leo</h3>
                                    <p class="category-count">4 Products</p>
                                    <a href="ctaegory.html" class="stretched-link"></a>
                                </div>
                            </div>

                            <!-- Category Card 6 -->
                            <div class="swiper-slide">
                                <div class="category-card" data-aos="fade-up" data-aos-delay="600">
                                    <div class="category-image">
                                        <img src="${pageContext.request.contextPath}/assets/img/product/product-m-1.webp" alt="Category" class="img-fluid">
                                    </div>
                                    <h3 class="category-title">Quisque rutrum</h3>
                                    <p class="category-count">2 Products</p>
                                    <a href="ctaegory.html" class="stretched-link"></a>
                                </div>
                            </div>

                            <!-- Category Card 7 -->
                            <div class="swiper-slide">
                                <div class="category-card" data-aos="fade-up" data-aos-delay="700">
                                    <div class="category-image">
                                        <img src="${pageContext.request.contextPath}/assets/img/product/product-10.webp" alt="Category" class="img-fluid">
                                    </div>
                                    <h3 class="category-title">Etiam ultricies</h3>
                                    <p class="category-count">4 Products</p>
                                    <a href="ctaegory.html" class="stretched-link"></a>
                                </div>
                            </div>

                            <!-- Category Card 8 -->
                            <div class="swiper-slide">
                                <div class="category-card" data-aos="fade-up" data-aos-delay="800">
                                    <div class="category-image">
                                        <img src="${pageContext.request.contextPath}/assets/img/product/product-2.webp" alt="Category" class="img-fluid">
                                    </div>
                                    <h3 class="category-title">Fusce fermentum</h3>
                                    <p class="category-count">4 Products</p>
                                    <a href="ctaegory.html" class="stretched-link"></a>
                                </div>
                            </div>
                        </div>

                        <div class="swiper-button-next"></div>
                        <div class="swiper-button-prev"></div>
                    </div>

                </div>

            </section><!-- /Category Cards Section -->

            <!-- Best Sellers Section -->
            <section id="best-sellers" class="best-sellers section">

                <!-- Section Title -->
                <div class="container section-title" data-aos="fade-up">
                    <h2>Best Sellers</h2>
                    <p>Necessitatibus eius consequatur ex aliquid fuga eum quidem sint consectetur velit</p>
                </div><!-- End Section Title -->

                <div class="container" data-aos="fade-up" data-aos-delay="100">

                    <div class="row gy-4">
                        <!-- Product 1 -->
                        <div class="col-md-6 col-lg-3" data-aos="fade-up" data-aos-delay="100">
                            <div class="product-card">
                                <div class="product-image">
                                    <img src="${pageContext.request.contextPath}/assets/img/product/product-1.webp" class="img-fluid default-image" alt="Product" loading="lazy">
                                    <img src="${pageContext.request.contextPath}/assets/img/product/product-1-variant.webp" class="img-fluid hover-image" alt="Product hover" loading="lazy">
                                    <div class="product-tags">
                                        <span class="badge bg-accent">New</span>
                                    </div>
                                    <div class="product-actions">
                                        <button class="btn-wishlist" type="button" aria-label="Add to wishlist">
                                            <i class="bi bi-heart"></i>
                                        </button>
                                        <button class="btn-quickview" type="button" aria-label="Quick view">
                                            <i class="bi bi-eye"></i>
                                        </button>
                                    </div>

                                </div>
                                <div class="product-info">
                                    <h3 class="product-title"><a href="">Lorem ipsum dolor sit amet</a></h3>
                                    <div class="product-price">
                                        <span class="current-price">$89.99</span>
                                    </div>
                                    <div class="product-rating">
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-half"></i>
                                        <span class="rating-count">(42)</span>
                                    </div>
                                    <button class="btn btn-add-to-cart">
                                        <i class="bi bi-bag-plus me-2"></i>Add to Cart
                                    </button>
                                </div>
                            </div>
                        </div><!-- End Product 1 -->

                        <!-- Product 2 -->
                        <div class="col-md-6 col-lg-3" data-aos="fade-up" data-aos-delay="150">
                            <div class="product-card">
                                <div class="product-image">
                                    <img src="${pageContext.request.contextPath}/assets/img/product/product-4.webp" class="img-fluid default-image" alt="Product" loading="lazy">
                                    <img src="${pageContext.request.contextPath}/assets/img/product/product-4-variant.webp" class="img-fluid hover-image" alt="Product hover" loading="lazy">
                                    <div class="product-tags">
                                        <span class="badge bg-sale">Sale</span>
                                    </div>
                                    <div class="product-actions">
                                        <button class="btn-wishlist" type="button" aria-label="Add to wishlist">
                                            <i class="bi bi-heart"></i>
                                        </button>
                                        <button class="btn-quickview" type="button" aria-label="Quick view">
                                            <i class="bi bi-eye"></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="product-info">
                                    <h3 class="product-title"><a href="productDetail?pid=">Consectetur adipiscing elit</a></h3>
                                    <div class="product-price">
                                        <span class="current-price">$64.99</span>
                                        <span class="original-price">$79.99</span>
                                    </div>
                                    <div class="product-rating">
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star"></i>
                                        <span class="rating-count">(28)</span>
                                    </div>
                                    <button class="btn btn-add-to-cart">
                                        <i class="bi bi-bag-plus me-2"></i>Add to Cart
                                    </button>
                                </div>
                            </div>
                        </div><!-- End Product 2 -->

                        <!-- Product 3 -->
                        <div class="col-md-6 col-lg-3" data-aos="fade-up" data-aos-delay="200">
                            <div class="product-card">
                                <div class="product-image">
                                    <img src="${pageContext.request.contextPath}/assets/img/product/product-7.webp" class="img-fluid default-image" alt="Product" loading="lazy">
                                    <img src="${pageContext.request.contextPath}/assets/img/product/product-7-variant.webp" class="img-fluid hover-image" alt="Product hover" loading="lazy">
                                    <div class="product-actions">
                                        <button class="btn-wishlist" type="button" aria-label="Add to wishlist">
                                            <i class="bi bi-heart"></i>
                                        </button>
                                        <button class="btn-quickview" type="button" aria-label="Quick view">
                                            <i class="bi bi-eye"></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="product-info">
                                    <h3 class="product-title"><a href="product-details.html">Sed do eiusmod tempor incididunt</a></h3>
                                    <div class="product-price">
                                        <span class="current-price">$119.00</span>
                                    </div>
                                    <div class="product-rating">
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                        <span class="rating-count">(56)</span>
                                    </div>
                                    <button class="btn btn-add-to-cart">
                                        <i class="bi bi-bag-plus me-2"></i>Add to Cart
                                    </button>
                                </div>
                            </div>
                        </div><!-- End Product 3 -->

                        <!-- Product 4 -->
                        <div class="col-md-6 col-lg-3" data-aos="fade-up" data-aos-delay="250">
                            <div class="product-card">
                                <div class="product-image">
                                    <img src="${pageContext.request.contextPath}/assets/img/product/product-12.webp" class="img-fluid default-image" alt="Product" loading="lazy">
                                    <img src="${pageContext.request.contextPath}/assets/img/product/product-12-variant.webp" class="img-fluid hover-image" alt="Product hover" loading="lazy">
                                    <div class="product-tags">
                                        <span class="badge bg-sold-out">Sold Out</span>
                                    </div>
                                    <div class="product-actions">
                                        <button class="btn-wishlist" type="button" aria-label="Add to wishlist">
                                            <i class="bi bi-heart"></i>
                                        </button>
                                        <button class="btn-quickview" type="button" aria-label="Quick view">
                                            <i class="bi bi-eye"></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="product-info">
                                    <h3 class="product-title"><a href="product-details.html">Ut labore et dolore magna aliqua</a></h3>
                                    <div class="product-price">
                                        <span class="current-price">$75.50</span>
                                    </div>
                                    <div class="product-rating">
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star"></i>
                                        <i class="bi bi-star"></i>
                                        <span class="rating-count">(15)</span>
                                    </div>
                                    <button class="btn btn-add-to-cart btn-disabled" disabled="">
                                        <i class="bi bi-bag-plus me-2"></i>Sold Out
                                    </button>
                                </div>
                            </div>
                        </div><!-- End Product 4 -->
                    </div>

                </div>

            </section><!-- /Best Sellers Section -->

            <!-- Product List Section -->
            <section id="product-list" class="product-list section">
                <!-- isotope-layout bao quanh danh sách sản phẩm -->
                <div class="container isotope-layout" data-aos="fade-up" data-aos-delay="100" data-default-filter="*" data-layout="masonry" data-sort="original-order">

                    <!-- Bộ lọc -->
                    <div class="row">
                        <div class="col-12">
                            <div class="product-filters isotope-filters mb-5 d-flex justify-content-center" data-aos="fade-up">
                                <ul class="d-flex flex-wrap gap-2 list-unstyled">
                                    <li class="filter-active" data-filter="*">All</li>
                                    <li data-filter=".filter-clothing">Clothing</li>
                                    <li data-filter=".filter-accessories">Accessories</li>
                                    <li data-filter=".filter-electronics">Electronics</li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <!-- Danh sách sản phẩm -->
                    <div class="row product-container isotope-container" data-aos="fade-up" data-aos-delay="200">
                        <c:forEach items="${products}" var="o">
                            <div class="col-md-6 col-lg-3 product-item filter-${o.categoryID}">
                                <div class="product-card">
                                    <div class="product-image">
                                        <span class="badge">Sale</span>

                                        <c:choose>
                                            <c:when test="${not empty o.imageUrls}">
                                                <img src="${o.imageUrls[0]}" alt="Product" class="img-fluid main-img" />
                                                <img src="${o.imageUrls[0]}" alt="Product Hover" class="img-fluid hover-img" />
                                            </c:when>
                                            <c:otherwise>
                                                <img src="img/default-product.jpg" alt="Default" class="img-fluid main-img" />
                                                <img src="img/default-product.jpg" alt="Default Hover" class="img-fluid hover-img" />
                                            </c:otherwise>
                                        </c:choose>

                                        <div class="product-overlay">
                                            <c:if test="${not empty o.variants}">
                                                <a href="#" class="btn-cart" onclick="addToCart('${o.variants[0].productVariantId}'); event.preventDefault();">
                                                    <i class="bi bi-cart-plus"></i> Add to Cart
                                                </a>
                                            </c:if>
                                            <div class="product-actions">
                                                <a href="#" class="action-btn"><i class="bi bi-heart"></i></a>
                                                <a href="#" class="action-btn"><i class="bi bi-eye"></i></a>
                                                <a href="#" class="action-btn"><i class="bi bi-arrow-left-right"></i></a>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="product-info">
                                        <h5 class="product-title">
                                            <a href="DetailProduct?pid=${o.productId}">${o.productName}</a>
                                        </h5>

                                        <div class="product-price">
                                            <c:choose>
                                                <c:when test="${not empty o.variants}">
                                                    <span class="current-price">${o.variants[0].price}</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="current-price">Contact</span>
                                                </c:otherwise>
                                            </c:choose>
                                            <span class="old-price">${o.variants[0].price* 2}</span>
                                        </div>

                                        <c:if test="${not empty o.variants}">
                                            <div class="product-variant-info">
                                                Color:
                                                <span class="color-dot" style="background-color:${fn:toLowerCase(o.variants[0].color.name)};"></span>
                                                |
                                                Size: <span class="size">${o.variants[0].size.name}</span>
                                            </div>

                                        </c:if>

                                        <div class="product-rating">
                                            <i class="bi bi-star-fill"></i>
                                            <i class="bi bi-star-fill"></i>
                                            <i class="bi bi-star-fill"></i>
                                            <i class="bi bi-star-fill"></i>
                                            <i class="bi bi-star-half"></i>
                                            <span>(24)</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>

                <!-- ✅ Đưa nút ra ngoài isotope-layout -->

            </section>
            <div class="text-center mt-5 mb-5" data-aos="fade-up">
                <a href="#" class="view-all-btn">
                    View All Products <i class="bi bi-arrow-right"></i>
                </a>
            </div>


            <!-- /Product List Section -->

        </main>

        <footer id="footer" class="footer">
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
                                <a href="index.html" class="logo">
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

        <!-- Scroll Top -->
        <a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

        <!-- Preloader -->
        <div id="preloader"></div>

        <!-- Bootstrap Toast -->
        <div class="toast-container position-fixed bottom-0 end-0 p-3">
            <div id="cartToast" class="toast" role="alert" aria-live="assertive" aria-atomic="true">
                <div class="toast-header">
                    <strong class="me-auto">Notification</strong>
                    <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                </div>
                <div class="toast-body">
                    Add to Cart Success!
                </div>
            </div>
        </div>

        <!-- Vendor JS Files -->
        <script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/vendor/php-email-form/validate.js"></script>
        <script src="${pageContext.request.contextPath}/assets/vendor/swiper/swiper-bundle.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/vendor/aos/aos.js"></script>
        <script src="${pageContext.request.contextPath}/assets/vendor/imagesloaded/imagesloaded.pkgd.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/vendor/glightbox/js/glightbox.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/vendor/drift-zoom/Drift.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/vendor/purecounter/purecounter_vanilla.js"></script>

        <!-- Main JS File -->
        <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>


        <!-- Hộp hiển thị thông báo -->
        <%
            String message = (String) session.getAttribute("message");
            if (message != null) {
        %>
        <div id="login-message" style="
             position: fixed;
             top: 50px;
             left: 50%;
             transform: translateX(-50%);
             background-color: #4CAF50;
             color: white;
             padding: 16px 24px;
             border-radius: 8px;
             font-size: 16px;
             font-family: sans-serif;
             box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
             z-index: 9999;
             opacity: 1;
             transition: opacity 0.5s ease;
             ">
            <%= message%>
        </div>

        <script>
                                                    setTimeout(function () {
                                                        const msg = document.getElementById('login-message');
                                                        if (msg) {
                                                            msg.style.opacity = '0';
                                                            setTimeout(() => msg.remove(), 500); // xoá hoàn toàn sau khi ẩn
                                                        }
                                                    }, 3000);
        </script>
        <%
                session.removeAttribute("message");
            }
        %>
        <script>
            function addToCart(variantId) {
                fetch('/MarketingPlace/addToCart?variantId=' + variantId + '&quantity=1')
                        .then(response => response.json())
                        .then(data => {
                            if (data.success) {
                                const toast = new bootstrap.Toast(document.getElementById('cartToast'));
                                toast.show();
                                document.getElementById('quantityCart').innerText = data.quantityCart;
                            } else {
                                alert('Failed to add to cart: ' + data.message);
                            }
                        })
                        .catch(error => {
                            console.error('Error:', error);
                            alert('An error occurred!');
                        });
            }
        </script>


    </body>

</html>
