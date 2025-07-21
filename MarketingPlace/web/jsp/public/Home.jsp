<%-- 
    Document   : Home
    Created on : Jun 1, 2025, 7:16:34 PM
    Author     : chinhnv
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
            .swiper-wrapper {
                display: flex;
                justify-content: center;
                flex-wrap: wrap;
                gap: 20px;
            }
        </style>
    </head>

    <body class="index-page">

        <jsp:include page="Header.jsp"></jsp:include>
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
                            <c:forEach items="${categories}" var="c">
                                <div class="swiper-slide">
                                    <div class="category-card" data-aos="fade-up" data-aos-delay="100">
                                        <div class="category-image">
                                            <img src="${c.imageURL}" alt="Category" class="img-fluid">
                                        </div>
                                        <h3 class="category-title">${c.categoryName}</h3>

                                        <a href="ProductByCategory?cid=${c.categoryID}" class="stretched-link"></a>
                                    </div>
                                </div>
                            </c:forEach>      
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
                    <h2>New Arrivals</h2>
                    
                </div><!-- End Section Title -->

                <div class="container" data-aos="fade-up" data-aos-delay="100">

                    <div class="row gy-4">
                        <c:forEach items="${newarrivals}" var="i">
                            <div class="col-md-6 col-lg-3" data-aos="fade-up" data-aos-delay="100">
                                <div class="product-card">
                                    <div class="product-image">
                                        <img src="${i.thumbnailURL} class="img-fluid default-image" alt="Product" loading="lazy">
                                  
                                        <div class="product-tags">
                                            <span class="badge bg-accent">New</span>
                                        </div>
                             

                                    </div>
                                    <div class="product-info">
                                        <h3 class="product-title"><a href="DetailProduct?pid=${i.productId}">${i.productName}</a></h3>
                                        <div class="product-price">
                                            <span class="current-price">$${i.price}</span>
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
                        </c:forEach>
                        <!-- Product 1 -->


 

                       
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

        <jsp:include page="Footer.jsp"></jsp:include>  

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
        <script>
            document.querySelector(".desktop-megamenu").addEventListener("mouseenter", function () {
                document.getElementById("new-tab").click();
            });
        </script>

    </body>

</html>
