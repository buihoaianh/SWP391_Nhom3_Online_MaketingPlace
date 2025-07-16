<%-- 
    Document   : Header
    Created on : Jul 15, 2025, 9:56:56 AM
    Author     : tulok
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Cart" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                                <a class="dropdown-item d-flex align-items-center" href="my-orders">
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
                                            <button class="nav-link" id="new-tab" data-bs-toggle="tab" data-bs-target="#new-content-1862" type="button" aria-selected="false" tabindex="-1" role="tab">New Arrivals</button>
                                        </li>

                                        <li class="nav-item" role="presentation">
                                            <button class="nav-link" id="category-tab" data-bs-toggle="tab" data-bs-target="#category-content-1862" type="button" aria-selected="false" tabindex="-1" role="tab">Categories</button>
                                        </li>
                                    </ul>
                                </div>

                                <!-- Tabs Content -->
                                <div class="megamenu-content tab-content">

                                    <!-- Featured Tab -->


                                    <!-- New Arrivals Tab -->
                                    <div class="tab-pane fade" id="new-content-1862" role="tabpanel" aria-labelledby="new-tab">
                                        <div class="product-grid">
                                            <c:forEach items="${newarrivals}" var="a">
                                            <div class="product-card">
                                                <div class="product-image">
                                                    <img src="${a.thumbnailURL}" alt="New Arrival" loading="lazy">
                                                    <span class="badge-new">New</span>
                                                </div>
                                                <div class="product-info">
                                                    <h5>${a.productName}</h5>
                                                    <p class="price">${a.price}</p>
                                                    <a href="DetailProduct?pid=${a.productId}" class="btn-view">View Product</a>
                                                </div>
                                            </div>
                                            </c:forEach>
                                            </div>
                                        </div>
                                



                                    <!-- Categories Tab -->
                                    <div class="tab-pane fade" id="category-content-1862" role="tabpanel" aria-labelledby="category-tab">
                                        <div class="category-grid">
                                            <c:forEach items="${categories}" var="c">
                                                <div class="category-column">
                                                    <h4>${c.categoryName}</h4>
                                                    <ul>
                                                        <li><a href="#">Men's Wear</a></li>
                                                        <li><a href="#">Women's Wear</a></li>
                                                        <li><a href="#">Kids Collection</a></li>
                                                        <li><a href="#">Sportswear</a></li>
                                                        <li><a href="#">Accessories</a></li>
                                                    </ul>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>

                                </div>

                            </div><!-- End Products Mega Menu 1 Desktop View -->

                        </li><!-- End Products Mega Menu 1 -->
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
