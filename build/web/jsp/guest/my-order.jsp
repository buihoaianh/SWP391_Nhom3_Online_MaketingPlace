<%-- 
    Document   : Profile
    Created on : Jun 1, 2025, 9:33:25 PM
    Author     : chinhnv11
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <title>Account - eStore Bootstrap Template</title>
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
        <style>
            .settings-section {
                max-width: 600px;
                margin: 0 auto;
                padding: 2rem;
                background: #fff;
                border-radius: 8px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            }

            .settings-section h3 {
                font-size: 1.5rem;
                font-weight: 600;
                color: #333;
                margin-bottom: 1.5rem;
            }

            .settings-form {
                display: flex;
                flex-direction: column;
                gap: 1rem;
            }

            .form-group {
                display: flex;
                flex-direction: column;
            }

            .form-group label {
                font-size: 0.875rem;
                font-weight: 500;
                color: #555;
                margin-bottom: 0.5rem;
            }

            .form-group input {
                padding: 0.75rem;
                border: 1px solid #ddd;
                border-radius: 4px;
                font-size: 1rem;
                color: #333;
                transition: border-color 0.2s;
            }

            .form-group input:focus {
                outline: none;
                border-color: #007bff;
                box-shadow: 0 0 0 3px rgba(0, 123, 255, 0.1);
            }

            .form-row {
                display: flex;
                gap: 1rem;
                flex-wrap: wrap;
            }

            .form-group.half-width {
                flex: 1;
                min-width: 200px;
            }

            .form-buttons {
                display: flex;
                justify-content: flex-end;
                margin-top: 1rem;
            }

            .btn-save {
                background: #007bff;
                color: #fff;
                padding: 0.75rem 1.5rem;
                border: none;
                border-radius: 4px;
                font-weight: 500;
                cursor: pointer;
                transition: background 0.2s;
            }

            .btn-save:hover {
                background: #0056b3;
            }

            .form-message {
                padding: 0.75rem;
                border-radius: 4px;
                font-size: 0.875rem;
                margin-top: 1rem;
                display: none;
            }

            .form-message:empty {
                display: none;
            }

            .form-message:not(:empty) {
                display: block;
            }

            .form-message.error {
                background: #ffe6e6;
                color: #cc0000;
            }

            .form-message.success {
                background: #e6ffeb;
                color: #006622;
            }
        </style>
        <!-- =======================================================
        * Template Name: eStore
        * Template URL: https://bootstrapmade.com/estore-bootstrap-ecommerce-template/
        * Updated: Apr 26 2025 with Bootstrap v5.3.5
        * Author: BootstrapMade.com
        * License: https://bootstrapmade.com/license/
        ======================================================== -->
    </head>

    <body class="account-page">

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

                                    <%
                                        if (session.getAttribute("user") != null) {
                                    %>
                                    <div class="dropdown-body">
                                        <a class="dropdown-item d-flex align-items-center" href="jsp/Profile.jsp">
                                            <i class="bi bi-person-circle me-2"></i>
                                            <span>My Profile</span>
                                        </a>
                                        <a class="dropdown-item d-flex align-items-center" href="my-orders">
                                            <i class="bi bi-bag-check me-2"></i>
                                            <span>My Orders</span>
                                        </a>
                                    </div>
                                    <%
                                        }
                                    %>

                                    <div class="dropdown-footer">
                                        <%
                                            if (session.getAttribute("user") != null) {
                                        %>
                                        <a href="<%= request.getContextPath()%>/LogoutAccount" class="btn btn-primary w-100 mb-2">Logout</a>
                                        <%
                                            } else {
                                        %>
                                        <a href="jsp/guest/loginRegister.jsp?tab=login" class="btn btn-primary w-100 mb-2">Sign In</a>
                                        <a href="jsp/guest/loginRegister.jsp?tab=register" class="btn btn-outline-primary w-100">Register</a>
                                        <%
                                            }
                                        %>
                                    </div>
                                </div>
                            </div>



                            <!-- Wishlist -->


                            <!-- Cart -->
                            <a href="cart.html" class="header-action-btn">
                                <i class="bi bi-cart3"></i>
                                <span class="badge">3</span>
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
                                <li><a href="Contact">Contact</a></li>

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

            <!-- Page Title -->
            <div class="page-title light-background">
                <div class="container d-lg-flex justify-content-between align-items-center">
                    <h1 class="mb-2 mb-lg-0">Account</h1>
                    <nav class="breadcrumbs">
                        <ol>
                            <li><a href="index.html">Home</a></li>
                            <li class="current">Account</li>
                        </ol>
                    </nav>
                </div>
            </div><!-- End Page Title -->

            <!-- Account Section -->
            <section id="account" class="account section">

                <div class="container" data-aos="fade-up" data-aos-delay="100">

                    <!-- Mobile Menu Toggle -->
                    <div class="mobile-menu d-lg-none mb-4">
                        <button class="mobile-menu-toggle" type="button" data-bs-toggle="collapse" data-bs-target="#profileMenu">
                            <i class="bi bi-grid"></i>
                            <span>Menu</span>
                        </button>
                    </div>

                    <div class="row g-4">
                        <!-- Profile Menu -->
                        <div class="col-lg-3">
                            <div class="profile-menu collapse d-lg-block" id="profileMenu">
                                <!-- User Info -->
                                <div class="user-info" data-aos="fade-right">
                                    <div class="user-avatar">
                                        <img src="${pageContext.request.contextPath}/assets/img/person/person-f-1.webp" alt="Profile" loading="lazy">
                                        <span class="status-badge"><i class="bi bi-shield-check"></i></span>
                                    </div>
                                    <h4></h4>
                                    <div class="user-status">
                                        <i class="bi bi-award"></i>
                                        <span>Premium Member</span>
                                    </div>
                                </div>

                                <!-- Navigation Menu -->
                                <nav class="menu-nav">
                                    <ul class="nav flex-column" role="tablist">
                                        <li class="nav-item">
                                            <a class="nav-link active" data-bs-toggle="tab" href="#orders">
                                                <i class="bi bi-box-seam"></i>
                                                <span>My Orders</span>
                                                <span class="badge">3</span>
                                            </a>
                                        </li>
                                    </ul>

                                    <div class="menu-footer">
                                        <a href="#" class="help-link">
                                            <i class="bi bi-question-circle"></i>
                                            <span>Help Center</span>
                                        </a>
                                        <a href="#" class="logout-link">
                                            <i class="bi bi-box-arrow-right"></i>
                                            <span>Log Out</span>
                                        </a>
                                    </div>
                                </nav>
                            </div>
                        </div>

                        <!-- Content Area -->
                        <div class="col-lg-9">
                            <div class="content-area">
                                <div class="tab-content">
                                    <!-- Orders Tab -->
                                    <div class="tab-pane fade show active" id="orders">
                                        <div class="section-header" data-aos="fade-up">
                                            <h2>My Orders</h2>
                                            <div class="header-actions">
                                                <div class="search-box">
                                                    <i class="bi bi-search"></i>
                                                    <input type="text" placeholder="Search orders...">
                                                </div>
                                                <div class="dropdown">
                                                    <button class="filter-btn" data-bs-toggle="dropdown">
                                                        <i class="bi bi-funnel"></i>
                                                        <span>Filter</span>
                                                    </button>
                                                    <ul class="dropdown-menu">
                                                        <li><a class="dropdown-item" href="#">All Orders</a></li>
                                                        <li><a class="dropdown-item" href="#">Processing</a></li>
                                                        <li><a class="dropdown-item" href="#">Shipped</a></li>
                                                        <li><a class="dropdown-item" href="#">Delivered</a></li>
                                                        <li><a class="dropdown-item" href="#">Cancelled</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="orders-grid">
                                            <c:forEach var="order" items="${orders}" varStatus="loop">
                                                <div class="order-card" data-aos="fade-up" data-aos-delay="100">
                                                    <div class="order-header">
                                                        <div class="order-id">
                                                            <span class="label">Order ID:</span>
                                                            <span class="value">#ORD-${order.orderId}</span>
                                                        </div>
                                                        <div class="order-date">${order.orderDate}</div>
                                                    </div>

                                                    <div class="order-content">
                                                        <div class="product-grid">
                                                            <c:forEach var="item" items="${order.items}" varStatus="i" begin="0" end="2">
                                                                <c:if test="${not empty item.product.images}">
                                                                    <img src="${item.product.images[0].imageUrl}" alt="Product" loading="lazy">
                                                                </c:if>
                                                            </c:forEach>
                                                        </div>

                                                        <div class="order-info">
                                                            <div class="info-row">
                                                                <span>Status</span>
                                                                <span class="status processing">${order.orderStatusName}</span>
                                                            </div>
                                                            <div class="info-row">
                                                                <span>Items</span>
                                                                <span>${fn:length(order.items)} items</span>
                                                            </div>
                                                            <div class="info-row">
                                                                <span>Total</span>
                                                                <span class="price">$${order.totalAmount}</span>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="order-footer">
                                                        <button type="button" class="btn-track" data-bs-toggle="collapse" data-bs-target="#tracking${loop.index}" aria-expanded="false">Track Order</button>
                                                        <button type="button" class="btn-details" data-bs-toggle="collapse" data-bs-target="#details${loop.index}" aria-expanded="false">View Details</button>
                                                    </div>

                                                    <!-- Order Tracking -->
                                                    <div class="collapse tracking-info" id="tracking${loop.index}">
                                                        <div class="tracking-timeline">

                                                            <!-- COD: 4 → 6 → 7 → 2 -->
                                                            <c:if test="${order.paymentMethodId == 1}">
                                                                <c:set var="s" value="${order.orderStatusId}" />

                                                                <c:if test="${s == 4}">
                                                                    <div class="timeline-item active">
                                                                        <div class="timeline-icon"><i class="bi bi-hourglass"></i></div>
                                                                        <div class="timeline-content">
                                                                            <h5>Waiting for Confirmation</h5>
                                                                            <p>We are reviewing your order.</p>
                                                                            <span class="timeline-date">${order.orderDate}</span>
                                                                        </div>
                                                                    </div>
                                                                </c:if>

                                                                <c:if test="${s == 6}">
                                                                    <div class="timeline-item completed">
                                                                        <div class="timeline-icon"><i class="bi bi-hourglass"></i></div>
                                                                        <div class="timeline-content">
                                                                            <h5>Waiting for Confirmation</h5>
                                                                            <p>We are reviewing your order.</p>
                                                                            <span class="timeline-date">${order.orderDate}</span>
                                                                        </div>
                                                                    </div>
                                                                    <div class="timeline-item active">
                                                                        <div class="timeline-icon"><i class="bi bi-box-seam"></i></div>
                                                                        <div class="timeline-content">
                                                                            <h5>Delivered (COD Pending)</h5>
                                                                            <p>Your order has been delivered. Waiting for cash payment.</p>
                                                                        </div>
                                                                    </div>
                                                                    <!-- Confirm Received & Paid button -->
                                                                    <div class="text-end mt-2">
                                                                        <form action="confirm-received-cod" method="post">
                                                                            <input type="hidden" name="orderId" value="${order.orderId}" />
                                                                            <button type="submit" class="btn btn-success btn-sm">
                                                                                Confirm Received & Paid
                                                                            </button>
                                                                        </form>
                                                                    </div>
                                                                </c:if>

                                                                <c:if test="${s == 7}">
                                                                    <div class="timeline-item completed">
                                                                        <div class="timeline-icon"><i class="bi bi-hourglass"></i></div>
                                                                        <div class="timeline-content">
                                                                            <h5>Waiting for Confirmation</h5>
                                                                            <p>We are reviewing your order.</p>
                                                                        </div>
                                                                    </div>
                                                                    <div class="timeline-item completed">
                                                                        <div class="timeline-icon"><i class="bi bi-box-seam"></i></div>
                                                                        <div class="timeline-content">
                                                                            <h5>Delivered (COD Pending)</h5>
                                                                            <p>Your order has been delivered. Waiting for cash payment.</p>
                                                                        </div>
                                                                    </div>
                                                                    <div class="timeline-item active">
                                                                        <div class="timeline-icon"><i class="bi bi-cash-coin"></i></div>
                                                                        <div class="timeline-content">
                                                                            <h5>Payment Received</h5>
                                                                            <p>Cash payment has been collected.</p>
                                                                        </div>
                                                                    </div>
                                                                </c:if>

                                                                <c:if test="${s == 2}">
                                                                    <div class="timeline-item completed">
                                                                        <div class="timeline-icon"><i class="bi bi-hourglass"></i></div>
                                                                        <div class="timeline-content">
                                                                            <h5>Waiting for Confirmation</h5>
                                                                            <p>We are reviewing your order.</p>
                                                                        </div>
                                                                    </div>
                                                                    <div class="timeline-item completed">
                                                                        <div class="timeline-icon"><i class="bi bi-box-seam"></i></div>
                                                                        <div class="timeline-content">
                                                                            <h5>Delivered (COD Pending)</h5>
                                                                            <p>Your order has been delivered. Waiting for cash payment.</p>
                                                                        </div>
                                                                    </div>
                                                                    <div class="timeline-item completed">
                                                                        <div class="timeline-icon"><i class="bi bi-cash-coin"></i></div>
                                                                        <div class="timeline-content">
                                                                            <h5>Payment Received</h5>
                                                                            <p>Cash payment has been collected.</p>
                                                                        </div>
                                                                    </div>
                                                                    <div class="timeline-item completed">
                                                                        <div class="timeline-icon"><i class="bi bi-check-circle-fill"></i></div>
                                                                        <div class="timeline-content">
                                                                            <h5>Order Completed</h5>
                                                                            <p>Your order is completed successfully.</p>
                                                                        </div>
                                                                    </div>
                                                                </c:if>
                                                            </c:if>

                                                            <!-- VNPAY: 1 → 8 → 2 -->
                                                            <c:if test="${order.paymentMethodId == 2}">
                                                                <c:set var="s" value="${order.orderStatusId}" />

                                                                <c:if test="${s == 1}">
                                                                    <div class="timeline-item active">
                                                                        <div class="timeline-icon"><i class="bi bi-box"></i></div>
                                                                        <div class="timeline-content">
                                                                            <h5>Waiting for Delivery</h5>
                                                                            <p>Your order is being packed.</p>
                                                                            <span class="timeline-date">${order.orderDate}</span>
                                                                        </div>
                                                                    </div>
                                                                </c:if>

                                                                <c:if test="${s == 8}">
                                                                    <div class="timeline-item completed">
                                                                        <div class="timeline-icon"><i class="bi bi-box"></i></div>
                                                                        <div class="timeline-content">
                                                                            <h5>Waiting for Delivery</h5>
                                                                            <p>Your order is being packed.</p>
                                                                        </div>
                                                                    </div>
                                                                    <div class="timeline-item active">
                                                                        <div class="timeline-icon"><i class="bi bi-truck"></i></div>
                                                                        <div class="timeline-content">
                                                                            <h5>Out For Delivery</h5>
                                                                            <p>Your order is on the way.</p>
                                                                        </div>
                                                                    </div>
                                                                    <!-- Confirm Received button -->
                                                                    <div class="text-end mt-2">
                                                                        <form action="confirm-received" method="post">
                                                                            <input type="hidden" name="orderId" value="${order.orderId}" />
                                                                            <button type="submit" class="btn btn-success btn-sm">
                                                                                Confirm Received
                                                                            </button>
                                                                        </form>
                                                                    </div>
                                                                </c:if>

                                                                <c:if test="${s == 2}">
                                                                    <div class="timeline-item completed">
                                                                        <div class="timeline-icon"><i class="bi bi-box"></i></div>
                                                                        <div class="timeline-content">
                                                                            <h5>Waiting for Delivery</h5>
                                                                            <p>Your order is being packed.</p>
                                                                        </div>
                                                                    </div>
                                                                    <div class="timeline-item completed">
                                                                        <div class="timeline-icon"><i class="bi bi-truck"></i></div>
                                                                        <div class="timeline-content">
                                                                            <h5>Out For Delivery</h5>
                                                                            <p>Your order is on the way.</p>
                                                                        </div>
                                                                    </div>
                                                                    <div class="timeline-item completed">
                                                                        <div class="timeline-icon"><i class="bi bi-house-door"></i></div>
                                                                        <div class="timeline-content">
                                                                            <h5>Delivered</h5>
                                                                            <p>Order has been delivered successfully.</p>
                                                                        </div>
                                                                    </div>
                                                                </c:if>
                                                            </c:if>

                                                            <!-- CANCELLED -->
                                                            <c:if test="${order.orderStatusId == 3}">
                                                                <div class="timeline-item active">
                                                                    <div class="timeline-icon"><i class="bi bi-x-circle-fill text-danger"></i></div>
                                                                    <div class="timeline-content">
                                                                        <h5>Order Cancelled</h5>
                                                                        <p>This order was cancelled.</p>
                                                                    </div>
                                                                </div>
                                                            </c:if>

                                                        </div>
                                                    </div>

                                                    <!-- Order Details -->
                                                    <div class="collapse order-details" id="details${loop.index}">
                                                        <div class="details-content">
                                                            <div class="detail-section">
                                                                <h5>Items (${fn:length(order.items)})</h5>
                                                                <div class="order-items">
                                                                    <c:forEach var="item" items="${order.items}">
                                                                        <div class="item">
                                                                            <img src="${item.product.images[0].imageUrl}" alt="Product" loading="lazy">
                                                                            <div class="item-info">
                                                                                <h6>${item.product.productName}</h6>
                                                                                <div class="item-meta">
                                                                                    <span class="qty">Qty: ${item.quantity}</span>
                                                                                </div>
                                                                            </div>
                                                                            <div class="item-price">$${item.unitPrice}</div>
                                                                        </div>
                                                                    </c:forEach>
                                                                </div>
                                                            </div>

                                                            <div class="detail-section">
                                                                <h5>Shipping Address</h5>
                                                                <div class="address-info">
                                                                    <p>${order.wardName}, ${order.districtName}, ${order.provinceName}</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>

                                        <!-- Pagination -->
                                        <div class="pagination-wrapper" data-aos="fade-up">
                                            <button type="button" class="btn-prev" disabled="">
                                                <i class="bi bi-chevron-left"></i>
                                            </button>
                                            <div class="page-numbers">
                                                <button type="button" class="active">1</button>
                                                <button type="button">2</button>
                                                <button type="button">3</button>
                                                <span>...</span>
                                                <button type="button">12</button>
                                            </div>
                                            <button type="button" class="btn-next">
                                                <i class="bi bi-chevron-right"></i>
                                            </button>
                                        </div>
                                    </div>

                                    <!-- Wishlist Tab -->
                                    <div class="tab-pane fade" id="wishlist">
                                        <div class="section-header" data-aos="fade-up">
                                            <h2>My Wishlist</h2>
                                            <div class="header-actions">
                                                <button type="button" class="btn-add-all">Add All to Cart</button>
                                            </div>
                                        </div>

                                        <div class="wishlist-grid">
                                            <!-- Wishlist Item 1 -->
                                            <div class="wishlist-card" data-aos="fade-up" data-aos-delay="100">
                                                <div class="wishlist-image">
                                                    <img src="${pageContext.request.contextPath}/assets/img/product/product-1.webp" alt="Product" loading="lazy">
                                                    <button class="btn-remove" type="button" aria-label="Remove from wishlist">
                                                        <i class="bi bi-trash"></i>
                                                    </button>
                                                    <div class="sale-badge">-20%</div>
                                                </div>
                                                <div class="wishlist-content">
                                                    <h4>Lorem ipsum dolor sit amet</h4>
                                                    <div class="product-meta">
                                                        <div class="rating">
                                                            <i class="bi bi-star-fill"></i>
                                                            <i class="bi bi-star-fill"></i>
                                                            <i class="bi bi-star-fill"></i>
                                                            <i class="bi bi-star-fill"></i>
                                                            <i class="bi bi-star-half"></i>
                                                            <span>(4.5)</span>
                                                        </div>
                                                        <div class="price">
                                                            <span class="current">$79.99</span>
                                                            <span class="original">$99.99</span>
                                                        </div>
                                                    </div>
                                                    <button type="button" class="btn-add-cart">Add to Cart</button>
                                                </div>
                                            </div>

                                            <!-- Wishlist Item 2 -->
                                            <div class="wishlist-card" data-aos="fade-up" data-aos-delay="200">
                                                <div class="wishlist-image">
                                                    <img src="${pageContext.request.contextPath}/assets/img/product/product-2.webp" alt="Product" loading="lazy">
                                                    <button class="btn-remove" type="button" aria-label="Remove from wishlist">
                                                        <i class="bi bi-trash"></i>
                                                    </button>
                                                </div>
                                                <div class="wishlist-content">
                                                    <h4>Consectetur adipiscing elit</h4>
                                                    <div class="product-meta">
                                                        <div class="rating">
                                                            <i class="bi bi-star-fill"></i>
                                                            <i class="bi bi-star-fill"></i>
                                                            <i class="bi bi-star-fill"></i>
                                                            <i class="bi bi-star-fill"></i>
                                                            <i class="bi bi-star"></i>
                                                            <span>(4.0)</span>
                                                        </div>
                                                        <div class="price">
                                                            <span class="current">$149.99</span>
                                                        </div>
                                                    </div>
                                                    <button type="button" class="btn-add-cart">Add to Cart</button>
                                                </div>
                                            </div>

                                            <!-- Wishlist Item 3 -->
                                            <div class="wishlist-card" data-aos="fade-up" data-aos-delay="300">
                                                <div class="wishlist-image">
                                                    <img src="${pageContext.request.contextPath}/assets/img/product/product-3.webp" alt="Product" loading="lazy">
                                                    <button class="btn-remove" type="button" aria-label="Remove from wishlist">
                                                        <i class="bi bi-trash"></i>
                                                    </button>
                                                    <div class="out-of-stock-badge">Out of Stock</div>
                                                </div>
                                                <div class="wishlist-content">
                                                    <h4>Sed do eiusmod tempor</h4>
                                                    <div class="product-meta">
                                                        <div class="rating">
                                                            <i class="bi bi-star-fill"></i>
                                                            <i class="bi bi-star-fill"></i>
                                                            <i class="bi bi-star-fill"></i>
                                                            <i class="bi bi-star-fill"></i>
                                                            <i class="bi bi-star-fill"></i>
                                                            <span>(5.0)</span>
                                                        </div>
                                                        <div class="price">
                                                            <span class="current">$199.99</span>
                                                        </div>
                                                    </div>
                                                    <button type="button" class="btn-notify">Notify When Available</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Payment Methods Tab -->
                                    <div class="tab-pane fade" id="wallet">
                                        <div class="section-header" data-aos="fade-up">
                                            <h2>Payment Methods</h2>
                                            <div class="header-actions">
                                                <button type="button" class="btn-add-new">
                                                    <i class="bi bi-plus-lg"></i>
                                                    Add New Card
                                                </button>
                                            </div>
                                        </div>

                                        <div class="payment-cards-grid">
                                            <!-- Payment Card 1 -->
                                            <div class="payment-card default" data-aos="fade-up" data-aos-delay="100">
                                                <div class="card-header">
                                                    <i class="bi bi-credit-card"></i>
                                                    <div class="card-badges">
                                                        <span class="default-badge">Default</span>
                                                        <span class="card-type">Visa</span>
                                                    </div>
                                                </div>
                                                <div class="card-body">
                                                    <div class="card-number">•••• •••• •••• 4589</div>
                                                    <div class="card-info">
                                                        <span>Expires 09/2026</span>
                                                    </div>
                                                </div>
                                                <div class="card-actions">
                                                    <button type="button" class="btn-edit">
                                                        <i class="bi bi-pencil"></i>
                                                        Edit
                                                    </button>
                                                    <button type="button" class="btn-remove">
                                                        <i class="bi bi-trash"></i>
                                                        Remove
                                                    </button>
                                                </div>
                                            </div>

                                            <!-- Payment Card 2 -->
                                            <div class="payment-card" data-aos="fade-up" data-aos-delay="200">
                                                <div class="card-header">
                                                    <i class="bi bi-credit-card"></i>
                                                    <div class="card-badges">
                                                        <span class="card-type">Mastercard</span>
                                                    </div>
                                                </div>
                                                <div class="card-body">
                                                    <div class="card-number">•••• •••• •••• 7821</div>
                                                    <div class="card-info">
                                                        <span>Expires 05/2025</span>
                                                    </div>
                                                </div>
                                                <div class="card-actions">
                                                    <button type="button" class="btn-edit">
                                                        <i class="bi bi-pencil"></i>
                                                        Edit
                                                    </button>
                                                    <button type="button" class="btn-remove">
                                                        <i class="bi bi-trash"></i>
                                                        Remove
                                                    </button>
                                                    <button type="button" class="btn-make-default">Make Default</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Reviews Tab -->
                                    <div class="tab-pane fade" id="reviews">
                                        <div class="section-header" data-aos="fade-up">
                                            <h2>My Reviews</h2>
                                            <div class="header-actions">
                                                <div class="dropdown">
                                                    <button class="filter-btn" data-bs-toggle="dropdown">
                                                        <i class="bi bi-funnel"></i>
                                                        <span>Sort by: Recent</span>
                                                    </button>
                                                    <ul class="dropdown-menu">
                                                        <li><a class="dropdown-item" href="#">Recent</a></li>
                                                        <li><a class="dropdown-item" href="#">Highest Rating</a></li>
                                                        <li><a class="dropdown-item" href="#">Lowest Rating</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="reviews-grid">
                                            <!-- Review Card 1 -->
                                            <div class="review-card" data-aos="fade-up" data-aos-delay="100">
                                                <div class="review-header">
                                                    <img src="${pageContext.request.contextPath}/assets/img/product/product-1.webp" alt="Product" class="product-image" loading="lazy">
                                                    <div class="review-meta">
                                                        <h4>Lorem ipsum dolor sit amet</h4>
                                                        <div class="rating">
                                                            <i class="bi bi-star-fill"></i>
                                                            <i class="bi bi-star-fill"></i>
                                                            <i class="bi bi-star-fill"></i>
                                                            <i class="bi bi-star-fill"></i>
                                                            <i class="bi bi-star-fill"></i>
                                                            <span>(5.0)</span>
                                                        </div>
                                                        <div class="review-date">Reviewed on Feb 15, 2025</div>
                                                    </div>
                                                </div>
                                                <div class="review-content">
                                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                                                </div>
                                                <div class="review-footer">
                                                    <button type="button" class="btn-edit">Edit Review</button>
                                                    <button type="button" class="btn-delete">Delete</button>
                                                </div>
                                            </div>

                                            <!-- Review Card 2 -->
                                            <div class="review-card" data-aos="fade-up" data-aos-delay="200">
                                                <div class="review-header">
                                                    <img src="${pageContext.request.contextPath}/assets/img/product/product-2.webp" alt="Product" class="product-image" loading="lazy">
                                                    <div class="review-meta">
                                                        <h4>Consectetur adipiscing elit</h4>
                                                        <div class="rating">
                                                            <i class="bi bi-star-fill"></i>
                                                            <i class="bi bi-star-fill"></i>
                                                            <i class="bi bi-star-fill"></i>
                                                            <i class="bi bi-star-fill"></i>
                                                            <i class="bi bi-star"></i>
                                                            <span>(4.0)</span>
                                                        </div>
                                                        <div class="review-date">Reviewed on Feb 10, 2025</div>
                                                    </div>
                                                </div>
                                                <div class="review-content">
                                                    <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                                                </div>
                                                <div class="review-footer">
                                                    <button type="button" class="btn-edit">Edit Review</button>
                                                    <button type="button" class="btn-delete">Delete</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Addresses Tab -->


                                    <!-- Address Card 2 -->


                                    <!-- Settings Tab -->


                                    <!-- Email Preferences -->


                                    <!-- Security Settings -->

                                    <!-- Delete Account -->

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </div>

                </div>

            </section><!-- /Account Section -->

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

    </body>

</html>
