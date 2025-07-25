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
                <a style="text-decoration: none" href="Home" class="logo d-flex align-items-center">
                    <!-- Uncomment the line below if you also wish to use an image logo -->
                    <!-- <img src="${pageContext.request.contextPath}/assets/img/logo.webp" alt=""> -->
                    <h1 style="text-decoration: none"  class="sitename">eStore</h1>
                </a>

                <!-- Search -->
                <form class="search-form desktop-search-form" method="get" action="Search">
                    <div class="input-group">
                        <input type="text" name="query" class="form-control" placeholder="Search for products">
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
                        <li><a style="text-decoration: none" href="Home" class="active">Home</a></li>
                        <li><a style="text-decoration: none" href="about.html">About</a></li>
                        <li><a style="text-decoration: none" href="/MarketingPlace/Blog">Blogs</a></li>
                        <li><a style="text-decoration: none" href="Contact">Contact</a></li>

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
