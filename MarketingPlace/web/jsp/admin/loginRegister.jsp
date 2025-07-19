<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String tab = request.getParameter("tab");
    if (tab == null) tab = "login";
    String pageTitle = "login".equals(tab) ? "Login" : "Register";
%>



<!DOCTYPE html>
<html lang="en">

<head>
    
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>Login Register - eStore Bootstrap Template</title>
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
</head>

<body class="login-register-page">

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
                  <a class="dropdown-item d-flex align-items-center" href="account.html">
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
                  <a href="loginRegister.jsp?tab=login"
                        class="btn w-100 mb-2 <%= "login".equals(tab) ? "btn-primary" : "btn-outline-primary" %>">
                        Sign In
                     </a>
                     <a href="loginRegister.jsp?tab=register"
                        class="btn w-100 <%= "register".equals(tab) ? "btn-primary" : "btn-outline-primary" %>">
                        Register
                     </a>
                </div>
              </div>
            </div>

            <!-- Wishlist -->
            <a href="account.html" class="header-action-btn d-none d-md-block">
              <i class="bi bi-heart"></i>
              <span class="badge">0</span>
            </a>

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
              <li><a href="index.html">Home</a></li>
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

    <!-- Page Title -->
    <div class="page-title light-background">
      <div class="container d-lg-flex justify-content-between align-items-center">
        <h1 class="mb-2 mb-lg-0">Login</h1>
        <nav class="breadcrumbs">
          <ol>
            <li><a href="jsp/public/home.jsp">Home</a></li>
            <li class="current">Login</li>
          </ol>
        </nav>
      </div>
    </div><!-- End Page Title -->


    <!-- Login Register Section -->
    <section id="login-register" class="login-register section">

      <div class="container" data-aos="fade-up" data-aos-delay="100">

        <div class="row justify-content-center">
          <div class="col-lg-5">
            <div class="login-register-wraper">

              <!-- Tab Navigation -->
              <ul class="nav nav-tabs nav-tabs-bordered justify-content-center mb-4" role="tablist">
                <li class="nav-item" role="presentation">
                    <button class="nav-link <%= "login".equals(tab) ? "active" : "" %>" 
                            data-bs-toggle="tab" 
                            data-bs-target="#login-register-login-form" 
                            type="button" role="tab" 
                            aria-selected="<%= "login".equals(tab) %>">
                        <i class="bi bi-box-arrow-in-right me-1"></i>Login
                    </button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link <%= "register".equals(tab) ? "active" : "" %>" 
                            data-bs-toggle="tab" 
                            data-bs-target="#login-register-registration-form" 
                            type="button" role="tab" 
                            aria-selected="<%= "register".equals(tab) %>">
                        <i class="bi bi-person-plus me-1"></i>Register
                    </button>
                </li>
            </ul>
              
              <!-- Tab Content -->
              <div class="tab-content">
                <!-- Login Form -->
                <div class="tab-pane fade <%= "login".equals(tab) ? "show active" : "" %>" id="login-register-login-form" role="tabpanel">
                  <form action="${pageContext.request.contextPath}/loginAccount" method="post">
                    <div class="mb-4">
                      <label for="login-register-login-email" class="form-label">Email address</label>
                      <input type="email" name="email" class="form-control" id="login-register-login-email" required="">
                    </div>

                    <div class="mb-4">
                      <label for="login-register-login-password" class="form-label">Password</label>
                      <input type="password" name="password" class="form-control" id="login-register-login-password" required="">
                    </div>

                    <div class="d-flex justify-content-between align-items-center mb-4">
                      <div class="form-check">
                        <input type="checkbox" class="form-check-input" id="login-register-remember-me" name="remember">
                        <label class="form-check-label" for="login-register-remember-me">Remember me</label>
                      </div>
                      <a href="${pageContext.request.contextPath}/forgotpassword" class="forgot-password">Forgot Password?</a>
                    </div>

                    <% String mess = (String) request.getAttribute("mess"); %>
                    <% if (mess != null) { %>
                      <div style="color: red; font-weight: bold;">
                          <%= mess %>
                      </div>
                    <% } %>

                    <div class="d-grid">
                      <button type="submit" class="btn btn-primary btn-lg">Login</button>
                    </div>
                  </form>
                </div>

                <!-- Registration Form -->
        <!-- Registration Form -->
<div class="tab-pane fade <%= "register".equals(tab) ? "show active" : "" %>" id="login-register-registration-form" role="tabpanel">
  <form action="${pageContext.request.contextPath}/registerAccount" method="POST">
    <div class="row g-3">
      
      <!-- Full name -->
      <div class="col-sm-6">
        <div class="mb-4">
          <label for="login-register-reg-firstname" class="form-label">Full name</label>
          <input type="text" class="form-control" id="login-register-reg-firstname" name="fullName" required>
          <% 
            String errorf = (String) request.getAttribute("errorf");
            if (errorf != null) {
          %>
            <small class="text-danger"><%= errorf %></small>
          <% 
            }
          %>
        </div>
      </div>

      <!-- Phone -->
      <div class="col-sm-6">
        <div class="mb-4">
          <label for="login-register-reg-lastname" class="form-label">Phone</label>
          <input type="text" class="form-control" id="login-register-reg-lastname" name="phone" required>
          <% 
            String error = (String) request.getAttribute("error");
            if (error != null) {
          %>
            <small class="text-danger"><%= error %></small>
          <% 
            }
          %>
        </div>
      </div>

      <!-- Email -->
      <div class="col-12">
        <div class="mb-4">
          <label for="login-register-reg-email" class="form-label">Email address</label>
          <input type="email" class="form-control" id="login-register-reg-email" name="email" required>
          <% 
            String msg = (String) request.getAttribute("msg");
            if (msg != null) {
          %>
            <small class="text-danger"><%= msg %></small>
          <% 
            }
          %>
        </div>
      </div>

      <!-- Password -->
      <div class="col-12">
        <div class="mb-4">
          <label for="login-register-reg-password" class="form-label">Password</label>
          <input type="password" class="form-control" id="login-register-reg-password" name="password" required>
          <% 
            String errorp = (String) request.getAttribute("errorp");
            if (errorp != null) {
          %>
            <small class="text-danger"><%= errorp %></small>
          <% 
            }
          %>
        </div>
      </div>

      <!-- Địa chỉ: Tỉnh, Huyện, Xã, Số nhà -->
      <div class="col-md-6">
        <div class="mb-4">
          <label for="province" class="form-label">Tỉnh/Thành phố</label>
          <select id="province" name="province" class="form-control select2-searchable" required>
            <option value="">-- Chọn tỉnh --</option>
          </select>
        </div>
      </div>

      <div class="col-md-6">
        <div class="mb-4">
          <label for="district" class="form-label">Quận/Huyện</label>
          <select id="district" name="district" class="form-control select2-searchable" disabled required>
            <option value="">-- Chọn quận/huyện --</option>
          </select>
        </div>
      </div>

      <div class="col-md-6">
        <div class="mb-4">
          <label for="ward" class="form-label">Phường/Xã</label>
          <select id="ward" name="ward" class="form-control select2-searchable" disabled required>
            <option value="">-- Chọn phường/xã --</option>
          </select>
        </div>
      </div>

      <div class="col-md-6">
        <div class="mb-4">
          <label for="street" class="form-label">Số nhà/Đường</label>
          <input type="text" id="street" name="street" class="form-control" placeholder="Nhập số nhà, đường..." required>
        </div>
      </div>
      
     <input type="hidden" id="fullAddress" name="fullAddress">

      
        <div class="mb-4">
        <label for="user-type" class="form-label">You are: <span style="color: red;">*</span></label>
        <select class="form-control" id="user-type" name="userType" required>
          <option value="" selected hidden>-- select --</option>
          <option value="buyer">Customer</option>
          <option value="seller">Seller</option>
        </select>
      </div>


      <!-- Terms -->
      <div class="col-12">
        <div class="form-check">
          <input type="checkbox" class="form-check-input" id="login-register-terms" required>
          <label class="form-check-label" for="login-register-terms">
            I agree to the <a href="#">Terms of Service</a> and <a href="#">Privacy Policy</a>
          </label>
        </div>
      </div>
      

      <!-- Submit -->
      <div class="col-12">
        <div class="d-grid">
          <button type="submit" class="btn btn-primary btn-lg">Create Account</button>
        </div>
      </div>
    </div>
  </form>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
  let locationData = [];

  $(document).ready(function () {
    const provinceSelect = $('#province');
    const districtSelect = $('#district');
    const wardSelect = $('#ward');

    // Load JSON từ file
    $.getJSON('<%= request.getContextPath() %>/assets/locations.json', function (data) {
      locationData = data.data;

      locationData.forEach(function (province) {
        provinceSelect.append(
          $('<option>', {
            value: province.level1_id,
            text: province.name
          })
        );
      });
    });

    // Chọn tỉnh
    provinceSelect.on('change', function () {
      const provinceId = $(this).val();
      const selectedProvince = locationData.find(p => p.level1_id === provinceId);

      districtSelect.empty().append('<option value="">-- Chọn quận/huyện --</option>').prop('disabled', !selectedProvince);
      wardSelect.empty().append('<option value="">-- Chọn phường/xã --</option>').prop('disabled', true);

      if (selectedProvince) {
        selectedProvince.level2s.forEach(function (district) {
          districtSelect.append(
            $('<option>', {
              value: district.level2_id,
              text: district.name
            })
          );
        });
      }
    });

    // Chọn huyện
    districtSelect.on('change', function () {
      const provinceId = provinceSelect.val();
      const districtId = $(this).val();

      const selectedProvince = locationData.find(p => p.level1_id === provinceId);
      const selectedDistrict = selectedProvince?.level2s.find(d => d.level2_id === districtId);

      wardSelect.empty().append('<option value="">-- Chọn phường/xã --</option>').prop('disabled', !selectedDistrict);

      if (selectedDistrict) {
        selectedDistrict.level3s.forEach(function (ward) {
          wardSelect.append(
            $('<option>', {
              value: ward.level3_id,
              text: ward.name
            })
          );
        });
      }
    });
  });
</script>

<!-- Đoạn scrip lưu full thông tin địa chỉ -->
        <script>
            document.addEventListener('DOMContentLoaded', function() {
              const provinceEl = document.getElementById('province');
              const districtEl = document.getElementById('district');
              const wardEl = document.getElementById('ward');
              const streetEl = document.getElementById('street');
              const fullAddressEl = document.getElementById('fullAddress');

              let locationData = [];

              fetch('${pageContext.request.contextPath}/assets/locations.json')
                .then(resp => resp.json())
                .then(obj => {
                  locationData = obj.data || [];
                  locationData.forEach(prov => {
                    const opt = document.createElement('option');
                    opt.value = prov.level1_id;
                    opt.textContent = prov.name;
                    provinceEl.appendChild(opt);
                  });
                })
                .catch(err => console.error('Lỗi load locations.json:', err));

              provinceEl.addEventListener('change', function() {
                const provId = this.value;
                districtEl.innerHTML = '<option value="">-- Chọn quận/huyện --</option>';
                districtEl.disabled = true;
                wardEl.innerHTML = '<option value="">-- Chọn phường/xã --</option>';
                wardEl.disabled = true;
                if (!provId) {
                  updateFullAddress();
                  return;
                }
                const provObj = locationData.find(p => p.level1_id === provId);
                if (provObj?.level2s) {
                  provObj.level2s.forEach(dist => {
                    const opt = document.createElement('option');
                    opt.value = dist.level2_id;
                    opt.textContent = dist.name;
                    districtEl.appendChild(opt);
                  });
                  districtEl.disabled = false;
                }
                updateFullAddress();
              });

              districtEl.addEventListener('change', function() {
                const provId = provinceEl.value;
                const distId = this.value;
                wardEl.innerHTML = '<option value="">-- Chọn phường/xã --</option>';
                wardEl.disabled = true;
                if (!distId) {
                  updateFullAddress();
                  return;
                }
                const provObj = locationData.find(p => p.level1_id === provId);
                const distObj = provObj?.level2s?.find(d => d.level2_id === distId);
                if (distObj?.level3s) {
                  distObj.level3s.forEach(w => {
                    const opt = document.createElement('option');
                    opt.value = w.level3_id;
                    opt.textContent = w.name;
                    wardEl.appendChild(opt);
                  });
                  wardEl.disabled = false;
                }
                updateFullAddress();
              });

              [wardEl, streetEl].forEach(el => el.addEventListener('input', updateFullAddress));
              wardEl.addEventListener('change', updateFullAddress);

              function updateFullAddress() {
                const parts = [];
                const street = streetEl.value.trim();
                if (street) parts.push(street);
                if (wardEl.value) parts.push(wardEl.options[wardEl.selectedIndex].text);
                if (districtEl.value) parts.push(districtEl.options[districtEl.selectedIndex].text);
                if (provinceEl.value) parts.push(provinceEl.options[provinceEl.selectedIndex].text);
                fullAddressEl.value = parts.join(', ');
              }
            });
            </script>

            </div>
          </div>
        </div>

      </div>
     <!-- const addressData = [{ "data": [ { "level1_id": "01", "name": "Thành phố Hà Nội", "type": "Thành phố Trung ương", "level2s": [ { "level2_id": "001", "name": "Quận Ba Đình", "type": "Quận", "level3s": [ { "level3_id": "00001", "name": "Phường Phúc Xá", "type": "Phường" }, { "level3_id": "00004", "name": "Phường Trúc Bạch", "type": "Phường" }, { "level3_id": "00006", "name": "Phường Vĩnh Phúc", "type": "Phường" }, { "level3_id": "00007", "name": "Phường Cống Vị", "type": "Phường" }, { "level3_id": "00008", "name": "Phường Liễu Giai", "type": "Phường" }, { "level3_id": "00013", "name": "Phường Quán Thánh", "type": "Phường" }, { "level3_id": "00016", "name": "Phường Ngọc Hà", "type": "Phường" }, { "level3_id": "00019", "name": "Phường Điện Biên", "type": "Phường" }, { "level3_id": "00022", "name": "Phường Đội Cấn", "type": "Phường" }, { "level3_id": "00025", "name": "Phường Ngọc Khánh", "type": "Phường" }, { "level3_id": "00028", "name": "Phường Kim Mã", "type": "Phường" }, { "level3_id": "00031", "name": "Phường Giảng Võ", "type": "Phường" }, { "level3_id": "00034", "name": "Phường Thành Công", "type": "Phường" } ] }, { "level2_id": "002", "name": "Quận Hoàn Kiếm", "type": "Quận", "level3s": [ { "level3_id": "00037", "name": "Phường Phúc Tân", "type": "Phường" }, { "level3_id": "00040", "name": "Phường Đồng Xuân", "type": "Phường" }, { "level3_id": "00043", "name": "Phường Hàng Mã", "type": "Phường" }, { "level3_id": "00046", "name": "Phường Hàng Buồm", "type": "Phường" }, { "level3_id": "00049", "name": "Phường Hàng Đào", "type": "Phường" }, { "level3_id": "00052", "name": "Phường Hàng Bồ", "type": "Phường" }, { "level3_id": "00055", "name": "Phường Cửa Đông", "type": "Phường" }, { "level3_id": "00058", "name": "Phường Lý Thái Tổ", "type": "Phường" }, { "level3_id": "00061", "name": "Phường Hàng Bạc", "type": "Phường" }, { "level3_id": "00064", "name": "Phường Hàng Gai", "type": "Phường" }, { "level3_id": "00067", "name": "Phường Chương Dương", "type": "Phường" }, { "level3_id": "00070", "name": "Phường Hàng Trống", "type": "Phường" }, { "level3_id": "00073", "name": "Phường Cửa Nam", "type": "Phường" }, { "level3_id": "00076", "name": "Phường Hàng Bông", "type": "Phường" }, { "level3_id": "00079", "name": "Phường Tràng Tiền", "type": "Phường" }, { "level3_id": "00082", "name": "Phường Trần Hưng Đạo", "type": "Phường" }, { "level3_id": "00085", "name": "Phường Phan Chu Trinh", "type": "Phường" }, { "level3_id": "00088", "name": "Phường Hàng Bài", "type": "Phường" } ] }, { "level2_id": "003", "name": "Quận Tây Hồ", "type": "Quận", "level3s": [ { "level3_id": "00091", "name": "Phường Phú Thượng", "type": "Phường" }, { "level3_id": "00094", "name": "Phường Nhật Tân", "type": "Phường" }, { "level3_id": "00097", "name": "Phường Tứ Liên", "type": "Phường" }, { "level3_id": "00100", "name": "Phường Quảng An", "type": "Phường" }, { "level3_id": "00103", "name": "Phường Xuân La", "type": "Phường" }, { "level3_id": "00106", "name": "Phường Yên Phụ", "type": "Phường" }, { "level3_id": "00109", "name": "Phường Bưởi", "type": "Phường" }, { "level3_id": "00112", "name": "Phường Thụy Khuê", "type": "Phường" } ] }, { "level2_id": "004", "name": "Quận Long Biên", "type": "Quận", "level3s": [ { "level3_id": "00115", "name": "Phường Thượng Thanh", "type": "Phường" }, { "level3_id": "00118", "name": "Phường Ngọc Thụy", "type": "Phường" }, { "level3_id": "00121", "name": "Phường Giang Biên", "type": "Phường" }, { "level3_id": "00124", "name": "Phường Đức Giang", "type": "Phường" }, { "level3_id": "00127", "name": "Phường Việt Hưng", "type": "Phường" }, { "level3_id": "00130", "name": "Phường Gia Thụy", "type": "Phường" }, { "level3_id": "00133", "name": "Phường Ngọc Lâm", "type": "Phường" }, { "level3_id": "00136", "name": "Phường Phúc Lợi", "type": "Phường" }, { "level3_id": "00139", "name": "Phường Bồ Đề", "type": "Phường" }, { "level3_id": "00145", "name": "Phường Long Biên", "type": "Phường" }, { "level3_id": "00148", "name": "Phường Thạch Bàn", "type": "Phường" }, { "level3_id": "00151", "name": "Phường Phúc Đồng", "type": "Phường" }, { "level3_id": "00154", "name": "Phường Cự Khối", "type": "Phường" } ] }, { "level2_id": "005", "name": "Quận Cầu Giấy", "type": "Quận", "level3s": [ { "level3_id": "00157", "name": "Phường Nghĩa Đô", "type": "Phường" }, { "level3_id": "00160", "name": "Phường Nghĩa Tân", "type": "Phường" }, { "level3_id": "00163", "name": "Phường Mai Dịch", "type": "Phường" }, { "level3_id": "00166", "name": "Phường Dịch Vọng", "type": "Phường" }, { "level3_id": "00167", "name": "Phường Dịch Vọng Hậu", "type": "Phường" }, { "level3_id": "00169", "name": "Phường Quan Hoa", "type": "Phường" }, { "level3_id": "00172", "name": "Phường Yên Hoà", "type": "Phường" }, { "level3_id": "00175", "name": "Phường Trung Hoà", "type": "Phường" } ] }, { "level2_id": "006", "name": "Quận Đống Đa", "type": "Quận", "level3s": [ { "level3_id": "00178", "name": "Phường Cát Linh", "type": "Phường" }, { "level3_id": "00181", "name": "Phường Văn Miếu - Quốc Tử Giám", "type": "Phường" }, { "level3_id": "00187", "name": "Phường Láng Thượng", "type": "Phường" }, { "level3_id": "00190", "name": "Phường Ô Chợ Dừa", "type": "Phường" }, { "level3_id": "00193", "name": "Phường Văn Chương", "type": "Phường" }, { "level3_id": "00196", "name": "Phường Hàng Bột", "type": "Phường" }, { "level3_id": "00199", "name": "Phường Láng Hạ", "type": "Phường" }, { "level3_id": "00202", "name": "Phường Khâm Thiên", "type": "Phường" }, { "level3_id": "00205", "name": "Phường Thổ Quan", "type": "Phường" }, { "level3_id": "00208", "name": "Phường Nam Đồng", "type": "Phường" }, { "level3_id": "00214", "name": "Phường Quang Trung", "type": "Phường" }, { "level3_id": "00217", "name": "Phường Trung Liệt", "type": "Phường" }, { "level3_id": "00226", "name": "Phường Phương Liên - Trung Tự", "type": "Phường" }, { "level3_id": "00229", "name": "Phường Kim Liên", "type": "Phường" }, { "level3_id": "00232", "name": "Phường Phương Mai", "type": "Phường" }, { "level3_id": "00235", "name": "Phường Thịnh Quang", "type": "Phường" }, { "level3_id": "00238", "name": "Phường Khương Thượng", "type": "Phường" } ] }, { "level2_id": "007", "name": "Quận Hai Bà Trưng", "type": "Quận", "level3s": [ { "level3_id": "00241", "name": "Phường Nguyễn Du", "type": "Phường" }, { "level3_id": "00244", "name": "Phường Bạch Đằng", "type": "Phường" }, { "level3_id": "00247", "name": "Phường Phạm Đình Hổ", "type": "Phường" }, { "level3_id": "00256", "name": "Phường Lê Đại Hành", "type": "Phường" }, { "level3_id": "00259", "name": "Phường Đồng Nhân", "type": "Phường" }, { "level3_id": "00262", "name": "Phường Phố Huế", "type": "Phường" }, { "level3_id": "00268", "name": "Phường Thanh Lương", "type": "Phường" }, { "level3_id": "00271", "name": "Phường Thanh Nhàn", "type": "Phường" }, { "level3_id": "00277", "name": "Phường Bách Khoa", "type": "Phường" }, { "level3_id": "00280", "name": "Phường Đồng Tâm", "type": "Phường" }, { "level3_id": "00283", "name": "Phường Vĩnh Tuy", "type": "Phường" }, { "level3_id": "00289", "name": "Phường Quỳnh Mai", "type": "Phường" }, { "level3_id": "00292", "name": "Phường Bạch Mai", "type": "Phường" }, { "level3_id": "00295", "name": "Phường Minh Khai", "type": "Phường" }, { "level3_id": "00298", "name": "Phường Trương Định", "type": "Phường" } ] }, { "level2_id": "008", "name": "Quận Hoàng Mai", "type": "Quận", "level3s": [ { "level3_id": "00301", "name": "Phường Thanh Trì", "type": "Phường" }, { "level3_id": "00304", "name": "Phường Vĩnh Hưng", "type": "Phường" }, { "level3_id": "00307", "name": "Phường Định Công", "type": "Phường" }, { "level3_id": "00310", "name": "Phường Mai Động", "type": "Phường" }, { "level3_id": "00313", "name": "Phường Tương Mai", "type": "Phường" }, { "level3_id": "00316", "name": "Phường Đại Kim", "type": "Phường" }, { "level3_id": "00319", "name": "Phường Tân Mai", "type": "Phường" }, { "level3_id": "00322", "name": "Phường Hoàng Văn Thụ", "type": "Phường" }, { "level3_id": "00325", "name": "Phường Giáp Bát", "type": "Phường" }, { "level3_id": "00328", "name": "Phường Lĩnh Nam", "type": "Phường" }, { "level3_id": "00331", "name": "Phường Thịnh Liệt", "type": "Phường" }, { "level3_id": "00334", "name": "Phường Trần Phú", "type": "Phường" }, { "level3_id": "00337", "name": "Phường Hoàng Liệt", "type": "Phường" }, { "level3_id": "00340", "name": "Phường Yên Sở", "type": "Phường" } ] }, { "level2_id": "009", "name": "Quận Thanh Xuân", "type": "Quận", "level3s": [ { "level3_id": "00343", "name": "Phường Nhân Chính", "type": "Phường" }, { "level3_id": "00346", "name": "Phường Thượng Đình", "type": "Phường" }, { "level3_id": "00349", "name": "Phường Khương Trung", "type": "Phường" }, { "level3_id": "00352", "name": "Phường Khương Mai", "type": "Phường" }, { "level3_id": "00355", "name": "Phường Thanh Xuân Trung", "type": "Phường" }, { "level3_id": "00358", "name": "Phường Phương Liệt", "type": "Phường" }, { "level3_id": "00364", "name": "Phường Khương Đình", "type": "Phường" }, { "level3_id": "00367", "name": "Phường Thanh Xuân Bắc", "type": "Phường" }, { "level3_id": "00373", "name": "Phường Hạ Đình", "type": "Phường" } ] }, { "level2_id": "016", "name": "Huyện Sóc Sơn", "type": "Huyện", "level3s": [ { "level3_id": "00376", "name": "Thị trấn Sóc Sơn", "type": "Thị trấn" }, { "level3_id": "00379", "name": "Xã Bắc Sơn", "type": "Xã" }, { "level3_id": "00382", "name": "Xã Minh Trí", "type": "Xã" }, { "level3_id": "00385", "name": "Xã Hồng Kỳ", "type": "Xã" }, { "level3_id": "00388", "name": "Xã Nam Sơn", "type": "Xã" }, { "level3_id": "00391", "name": "Xã Trung Giã", "type": "Xã" }, { "level3_id": "00394", "name": "Xã Tân Hưng", "type": "Xã" }, { "level3_id": "00397", "name": "Xã Minh Phú", "type": "Xã" }, { "level3_id": "00400", "name": "Xã Phù Linh", "type": "Xã" }, { "level3_id": "00403", "name": "Xã Bắc Phú", "type": "Xã" }, { "level3_id": "00406", "name": "Xã Tân Minh", "type": "Xã" }, { "level3_id": "00409", "name": "Xã Quang Tiến", "type": "Xã" }, { "level3_id": "00412", "name": "Xã Hiền Ninh", "type": "Xã" }, { "level3_id": "00415", "name": "Xã Tân Dân", "type": "Xã" }, { "level3_id": "00418", "name": "Xã Tiên Dược", "type": "Xã" }, { "level3_id": "00421", "name": "Xã Việt Long", "type": "Xã" }, { "level3_id": "00424", "name": "Xã Xuân Giang", "type": "Xã" }, { "level3_id": "00427", "name": "Xã Mai Đình", "type": "Xã" }, { "level3_id": "00430", "name": "Xã Đức Hoà", "type": "Xã" }, { "level3_id": "00433", "name": "Xã Thanh Xuân", "type": "Xã" }, { "level3_id": "00436", "name": "Xã Đông Xuân", "type": "Xã" }, { "level3_id": "00439", "name": "Xã Kim Lũ", "type": "Xã" }, { "level3_id": "00442", "name": "Xã Phú Cường", "type": "Xã" }, { "level3_id": "00445", "name": "Xã Phú Minh", "type": "Xã" }, { "level3_id": "00448", "name": "Xã Phù Lỗ", "type": "Xã" }, { "level3_id": "00451", "name": "Xã Xuân Thu", "type": "Xã" } ] }, { "level2_id": "017", "name": "Huyện Đông Anh", "type": "Huyện", "level3s": [ { "level3_id": "00454", "name": "Thị trấn Đông Anh", "type": "Thị trấn" }, { "level3_id": "00457", "name": "Xã Xuân Nộn", "type": "Xã" }, { "level3_id": "00460", "name": "Xã Thuỵ Lâm", "type": "Xã" }, { "level3_id": "00463", "name": "Xã Bắc Hồng", "type": "Xã" }, { "level3_id": "00466", "name": "Xã Nguyên Khê", "type": "Xã" }, { "level3_id": "00469", "name": "Xã Nam Hồng", "type": "Xã" }, { "level3_id": "00472", "name": "Xã Tiên Dương", "type": "Xã" }, { "level3_id": "00475", "name": "Xã Vân Hà", "type": "Xã" }, { "level3_id": "00478", "name": "Xã Uy Nỗ", "type": "Xã" }, { "level3_id": "00481", "name": "Xã Vân Nội", "type": "Xã" }, { "level3_id": "00484", "name": "Xã Liên Hà", "type": "Xã" }, { "level3_id": "00487", "name": "Xã Việt Hùng", "type": "Xã" }, { "level3_id": "00490", "name": "Xã Kim Nỗ", "type": "Xã" }, { "level3_id": "00493", "name": "Xã Kim Chung", "type": "Xã" }, { "level3_id": "00496", "name": "Xã Dục Tú", "type": "Xã" }, { "level3_id": "00499", "name": "Xã Đại Mạch", "type": "Xã" }, { "level3_id": "00502", "name": "Xã Vĩnh Ngọc", "type": "Xã" }, { "level3_id": "00505", "name": "Xã Cổ Loa", "type": "Xã" }, { "level3_id": "00508", "name": "Xã Hải Bối", "type": "Xã" }, { "level3_id": "00511", "name": "Xã Xuân Canh", "type": "Xã" }, { "level3_id": "00514", "name": "Xã Võng La", "type": "Xã" }, { "level3_id": "00517", "name": "Xã Tàm Xá", "type": "Xã" }, { "level3_id": "00520", "name": "Xã Mai Lâm", "type": "Xã" }, { "level3_id": "00523", "name": "Xã Đông Hội", "type": "Xã" } ] }, { "level2_id": "018", "name": "Huyện Gia Lâm", "type": "Huyện", "level3s": [ { "level3_id": "00526", "name": "Thị trấn Yên Viên", "type": "Thị trấn" }, { "level3_id": "00529", "name": "Xã Yên Thường", "type": "Xã" }, { "level3_id": "00532", "name": "Xã Yên Viên", "type": "Xã" }, { "level3_id": "00535", "name": "Xã Ninh Hiệp", "type": "Xã" }, { "level3_id": "00541", "name": "Xã Thiên Đức", "type": "Xã" }, { "level3_id": "00544", "name": "Xã Phù Đổng", "type": "Xã" }, { "level3_id": "00550", "name": "Xã Lệ Chi", "type": "Xã" }, { "level3_id": "00553", "name": "Xã Cổ Bi", "type": "Xã" }, { "level3_id": "00556", "name": "Xã Đặng Xá", "type": "Xã" }, { "level3_id": "00562", "name": "Xã Phú Sơn", "type": "Xã" }, { "level3_id": "00565", "name": "Thị trấn Trâu Quỳ", "type": "Thị trấn" }, { "level3_id": "00568", "name": "Xã Dương Quang", "type": "Xã" }, { "level3_id": "00571", "name": "Xã Dương Xá", "type": "Xã" }, { "level3_id": "00577", "name": "Xã Đa Tốn", "type": "Xã" }, { "level3_id": "00580", "name": "Xã Kiêu Kỵ", "type": "Xã" }, { "level3_id": "00583", "name": "Xã Bát Tràng", "type": "Xã" }, { "level3_id": "00589", "name": "Xã Kim Đức", "type": "Xã" } ] }, { "level2_id": "019", "name": "Quận Nam Từ Liêm", "type": "Quận", "level3s": [ { "level3_id": "00592", "name": "Phường Cầu Diễn", "type": "Phường" }, { "level3_id": "00622", "name": "Phường Xuân Phương", "type": "Phường" }, { "level3_id": "00623", "name": "Phường Phương Canh", "type": "Phường" }, { "level3_id": "00625", "name": "Phường Mỹ Đình 1", "type": "Phường" }, { "level3_id": "00626", "name": "Phường Mỹ Đình 2", "type": "Phường" }, { "level3_id": "00628", "name": "Phường Tây Mỗ", "type": "Phường" }, { "level3_id": "00631", "name": "Phường Mễ Trì", "type": "Phường" }, { "level3_id": "00632", "name": "Phường Phú Đô", "type": "Phường" }, { "level3_id": "00634", "name": "Phường Đại Mỗ", "type": "Phường" }, { "level3_id": "00637", "name": "Phường Trung Văn", "type": "Phường" } ] }, { "level2_id": "020", "name": "Huyện Thanh Trì", "type": "Huyện", "level3s": [ { "level3_id": "00640", "name": "Thị trấn Văn Điển", "type": "Thị trấn" }, { "level3_id": "00643", "name": "Xã Tân Triều", "type": "Xã" }, { "level3_id": "00646", "name": "Xã Thanh Liệt", "type": "Xã" }, { "level3_id": "00649", "name": "Xã Tả Thanh Oai", "type": "Xã" }, { "level3_id": "00652", "name": "Xã Hữu Hoà", "type": "Xã" }, { "level3_id": "00655", "name": "Xã Tam Hiệp", "type": "Xã" }, { "level3_id": "00658", "name": "Xã Tứ Hiệp", "type": "Xã" }, { "level3_id": "00661", "name": "Xã Yên Mỹ", "type": "Xã" }, { "level3_id": "00664", "name": "Xã Vĩnh Quỳnh", "type": "Xã" }, { "level3_id": "00667", "name": "Xã Ngũ Hiệp", "type": "Xã" }, { "level3_id": "00670", "name": "Xã Duyên Hà", "type": "Xã" }, { "level3_id": "00673", "name": "Xã Ngọc Hồi", "type": "Xã" }, { "level3_id": "00676", "name": "Xã Vạn Phúc", "type": "Xã" }, { "level3_id": "00679", "name": "Xã Đại áng", "type": "Xã" }, { "level3_id": "00682", "name": "Xã Liên Ninh", "type": "Xã" }, { "level3_id": "00685", "name": "Xã Đông Mỹ", "type": "Xã" } ] }, { "level2_id": "021", "name": "Quận Bắc Từ Liêm", "type": "Quận", "level3s": [ { "level3_id": "00595", "name": "Phường Thượng Cát", "type": "Phường" }, { "level3_id": "00598", "name": "Phường Liên Mạc", "type": "Phường" }, { "level3_id": "00601", "name": "Phường Đông Ngạc", "type": "Phường" }, { "level3_id": "00602", "name": "Phường Đức Thắng", "type": "Phường" }, { "level3_id": "00604", "name": "Phường Thụy Phương", "type": "Phường" }, { "level3_id": "00607", "name": "Phường Tây Tựu", "type": "Phường" }, { "level3_id": "00610", "name": "Phường Xuân Đỉnh", "type": "Phường" }, { "level3_id": "00611", "name": "Phường Xuân Tảo", "type": "Phường" }, { "level3_id": "00613", "name": "Phường Minh Khai", "type": "Phường" }, { "level3_id": "00616", "name": "Phường Cổ Nhuế 1", "type": "Phường" }, { "level3_id": "00617", "name": "Phường Cổ Nhuế 2", "type": "Phường" }, { "level3_id": "00619", "name": "Phường Phú Diễn", "type": "Phường" }, { "level3_id": "00620", "name": "Phường Phúc Diễn", "type": "Phường" } ] }, { "level2_id": "250", "name": "Huyện Mê Linh", "type": "Huyện", "level3s": [ { "level3_id": "08973", "name": "Thị trấn Chi Đông", "type": "Thị trấn" }, { "level3_id": "08974", "name": "Xã Đại Thịnh", "type": "Xã" }, { "level3_id": "08977", "name": "Xã Kim Hoa", "type": "Xã" }, { "level3_id": "08980", "name": "Xã Thạch Đà", "type": "Xã" }, { "level3_id": "08983", "name": "Xã Tiến Thắng", "type": "Xã" }, { "level3_id": "08986", "name": "Xã Tự Lập", "type": "Xã" }, { "level3_id": "08989", "name": "Thị trấn Quang Minh", "type": "Thị trấn" }, { "level3_id": "08992", "name": "Xã Thanh Lâm", "type": "Xã" }, { "level3_id": "08995", "name": "Xã Tam Đồng", "type": "Xã" }, { "level3_id": "08998", "name": "Xã Liên Mạc", "type": "Xã" }, { "level3_id": "09004", "name": "Xã Chu Phan", "type": "Xã" }, { "level3_id": "09007", "name": "Xã Tiến Thịnh", "type": "Xã" }, { "level3_id": "09010", "name": "Xã Mê Linh", "type": "Xã" }, { "level3_id": "09013", "name": "Xã Văn Khê", "type": "Xã" }, { "level3_id": "09016", "name": "Xã Hoàng Kim", "type": "Xã" }, { "level3_id": "09019", "name": "Xã Tiền Phong", "type": "Xã" }, { "level3_id": "09022", "name": "Xã Tráng Việt", "type": "Xã" } ] }, { "level2_id": "268", "name": "Quận Hà Đông", "type": "Quận", "level3s": [ { "level3_id": "09538", "name": "Phường Quang Trung", "type": "Phường" }, { "level3_id": "09541", "name": "Phường Mộ Lao", "type": "Phường" }, { "level3_id": "09542", "name": "Phường Văn Quán", "type": "Phường" }, { "level3_id": "09544", "name": "Phường Vạn Phúc", "type": "Phường" }, { "level3_id": "09551", "name": "Phường La Khê", "type": "Phường" }, { "level3_id": "09552", "name": "Phường Phú La", "type": "Phường" }, { "level3_id": "09553", "name": "Phường Phúc La", "type": "Phường" }, { "level3_id": "09556", "name": "Phường Hà Cầu", "type": "Phường" }, { "level3_id": "09562", "name": "Phường Yên Nghĩa", "type": "Phường" }, { "level3_id": "09565", "name": "Phường Kiến Hưng", "type": "Phường" }, { "level3_id": "09568", "name": "Phường Phú Lãm", "type": "Phường" }, { "level3_id": "09571", "name": "Phường Phú Lương", "type": "Phường" }, { "level3_id": "09886", "name": "Phường Dương Nội", "type": "Phường" }, { "level3_id": "10117", "name": "Phường Đồng Mai", "type": "Phường" }, { "level3_id": "10123", "name": "Phường Biên Giang", "type": "Phường" } ] }, { "level2_id": "269", "name": "Thị xã Sơn Tây", "type": "Thị xã", "level3s": [ { "level3_id": "09574", "name": "Phường Ngô Quyền", "type": "Phường" }, { "level3_id": "09577", "name": "Phường Phú Thịnh", "type": "Phường" }, { "level3_id": "09586", "name": "Phường Sơn Lộc", "type": "Phường" }, { "level3_id": "09589", "name": "Phường Xuân Khanh", "type": "Phường" }, { "level3_id": "09592", "name": "Xã Đường Lâm", "type": "Xã" }, { "level3_id": "09595", "name": "Phường Viên Sơn", "type": "Phường" }, { "level3_id": "09598", "name": "Xã Xuân Sơn", "type": "Xã" }, { "level3_id": "09601", "name": "Phường Trung Hưng", "type": "Phường" }, { "level3_id": "09604", "name": "Xã Thanh Mỹ", "type": "Xã" }, { "level3_id": "09607", "name": "Phường Trung Sơn Trầm", "type": "Phường" }, { "level3_id": "09610", "name": "Xã Kim Sơn", "type": "Xã" }, { "level3_id": "09613", "name": "Xã Sơn Đông", "type": "Xã" }, { "level3_id": "09616", "name": "Xã Cổ Đông", "type": "Xã" } ] }, { "level2_id": "271", "name": "Huyện Ba Vì", "type": "Huyện", "level3s": [ { "level3_id": "09619", "name": "Thị trấn Tây Đằng", "type": "Thị trấn" }, { "level3_id": "09625", "name": "Xã Phú Cường", "type": "Xã" }, { "level3_id": "09628", "name": "Xã Cổ Đô", "type": "Xã" }, { "level3_id": "09634", "name": "Xã Vạn Thắng", "type": "Xã" }, { "level3_id": "09640", "name": "Xã Phong Vân", "type": "Xã" }, { "level3_id": "09643", "name": "Xã Phú Đông", "type": "Xã" }, { "level3_id": "09646", "name": "Xã Phú Hồng", "type": "Xã" }, { "level3_id": "09649", "name": "Xã Phú Châu", "type": "Xã" }, { "level3_id": "09652", "name": "Xã Thái Hòa", "type": "Xã" }, { "level3_id": "09655", "name": "Xã Đồng Thái", "type": "Xã" }, { "level3_id": "09658", "name": "Xã Phú Sơn", "type": "Xã" }, { "level3_id": "09661", "name": "Xã Minh Châu", "type": "Xã" }, { "level3_id": "09664", "name": "Xã Vật Lại", "type": "Xã" }, { "level3_id": "09667", "name": "Xã Chu Minh", "type": "Xã" }, { "level3_id": "09670", "name": "Xã Tòng Bạt", "type": "Xã" }, { "level3_id": "09673", "name": "Xã Cẩm Lĩnh", "type": "Xã" }, { "level3_id": "09676", "name": "Xã Sơn Đà", "type": "Xã" }, { "level3_id": "09679", "name": "Xã Đông Quang", "type": "Xã" }, { "level3_id": "09682", "name": "Xã Tiên Phong", "type": "Xã" }, { "level3_id": "09685", "name": "Xã Thụy An", "type": "Xã" }, { "level3_id": "09688", "name": "Xã Cam Thượng", "type": "Xã" }, { "level3_id": "09691", "name": "Xã Thuần Mỹ", "type": "Xã" }, { "level3_id": "09694", "name": "Xã Tản Lĩnh", "type": "Xã" }, { "level3_id": "09697", "name": "Xã Ba Trại", "type": "Xã" }, { "level3_id": "09700", "name": "Xã Minh Quang", "type": "Xã" }, { "level3_id": "09703", "name": "Xã Ba Vì", "type": "Xã" }, { "level3_id": "09706", "name": "Xã Vân Hòa", "type": "Xã" }, { "level3_id": "09709", "name": "Xã Yên Bài", "type": "Xã" }, { "level3_id": "09712", "name": "Xã Khánh Thượng", "type": "Xã" } ] }, { "level2_id": "272", "name": "Huyện Phúc Thọ", "type": "Huyện", "level3s": [ { "level3_id": "09715", "name": "Thị trấn Phúc Thọ", "type": "Thị trấn" }, { "level3_id": "09721", "name": "Xã Vân Phúc", "type": "Xã" }, { "level3_id": "09724", "name": "Xã Nam Hà", "type": "Xã" }, { "level3_id": "09727", "name": "Xã Xuân Đình", "type": "Xã" }, { "level3_id": "09733", "name": "Xã Sen Phương", "type": "Xã" }, { "level3_id": "09739", "name": "Xã Võng Xuyên", "type": "Xã" }, { "level3_id": "09742", "name": "Xã Tích Lộc", "type": "Xã" }, { "level3_id": "09745", "name": "Xã Long Thượng", "type": "Xã" }, { "level3_id": "09751", "name": "Xã Hát Môn", "type": "Xã" }, { "level3_id": "09757", "name": "Xã Thanh Đa", "type": "Xã" }, { "level3_id": "09760", "name": "Xã Trạch Mỹ Lộc", "type": "Xã" }, { "level3_id": "09763", "name": "Xã Phúc Hòa", "type": "Xã" }, { "level3_id": "09766", "name": "Xã Ngọc Tảo", "type": "Xã" }, { "level3_id": "09769", "name": "Xã Phụng Thượng", "type": "Xã" }, { "level3_id": "09772", "name": "Xã Tam Thuấn", "type": "Xã" }, { "level3_id": "09775", "name": "Xã Tam Hiệp", "type": "Xã" }, { "level3_id": "09778", "name": "Xã Hiệp Thuận", "type": "Xã" }, { "level3_id": "09781", "name": "Xã Liên Hiệp", "type": "Xã" } ] }, { "level2_id": "273", "name": "Huyện Đan Phượng", "type": "Huyện", "level3s": [ { "level3_id": "09784", "name": "Thị trấn Phùng", "type": "Thị trấn" }, { "level3_id": "09787", "name": "Xã Trung Châu", "type": "Xã" }, { "level3_id": "09790", "name": "Xã Thọ An", "type": "Xã" }, { "level3_id": "09793", "name": "Xã Thọ Xuân", "type": "Xã" }, { "level3_id": "09796", "name": "Xã Hồng Hà", "type": "Xã" }, { "level3_id": "09799", "name": "Xã Liên Hồng", "type": "Xã" }, { "level3_id": "09802", "name": "Xã Liên Hà", "type": "Xã" }, { "level3_id": "09805", "name": "Xã Hạ Mỗ", "type": "Xã" }, { "level3_id": "09808", "name": "Xã Liên Trung", "type": "Xã" }, { "level3_id": "09811", "name": "Xã Phương Đình", "type": "Xã" }, { "level3_id": "09814", "name": "Xã Thượng Mỗ", "type": "Xã" }, { "level3_id": "09817", "name": "Xã Tân Hội", "type": "Xã" }, { "level3_id": "09820", "name": "Xã Tân Lập", "type": "Xã" }, { "level3_id": "09823", "name": "Xã Đan Phượng", "type": "Xã" }, { "level3_id": "09826", "name": "Xã Đồng Tháp", "type": "Xã" }, { "level3_id": "09829", "name": "Xã Song Phượng", "type": "Xã" } ] }, { "level2_id": "274", "name": "Huyện Hoài Đức", "type": "Huyện", "level3s": [ { "level3_id": "09832", "name": "Thị trấn Trạm Trôi", "type": "Thị trấn" }, { "level3_id": "09835", "name": "Xã Đức Thượng", "type": "Xã" }, { "level3_id": "09838", "name": "Xã Minh Khai", "type": "Xã" }, { "level3_id": "09841", "name": "Xã Dương Liễu", "type": "Xã" }, { "level3_id": "09844", "name": "Xã Di Trạch", "type": "Xã" }, { "level3_id": "09847", "name": "Xã Đức Giang", "type": "Xã" }, { "level3_id": "09850", "name": "Xã Cát Quế", "type": "Xã" }, { "level3_id": "09853", "name": "Xã Kim Chung", "type": "Xã" }, { "level3_id": "09856", "name": "Xã Yên Sở", "type": "Xã" }, { "level3_id": "09859", "name": "Xã Sơn Đồng", "type": "Xã" }, { "level3_id": "09862", "name": "Xã Vân Canh", "type": "Xã" }, { "level3_id": "09865", "name": "Xã Đắc Sở", "type": "Xã" }, { "level3_id": "09868", "name": "Xã Lại Yên", "type": "Xã" }, { "level3_id": "09871", "name": "Xã Tiền Yên", "type": "Xã" }, { "level3_id": "09874", "name": "Xã Song Phương", "type": "Xã" }, { "level3_id": "09877", "name": "Xã An Khánh", "type": "Xã" }, { "level3_id": "09880", "name": "Xã An Thượng", "type": "Xã" }, { "level3_id": "09883", "name": "Xã Vân Côn", "type": "Xã" }, { "level3_id": "09889", "name": "Xã La Phù", "type": "Xã" }, { "level3_id": "09892", "name": "Xã Đông La", "type": "Xã" } ] }, { "level2_id": "275", "name": "Huyện Quốc Oai", "type": "Huyện", "level3s": [ { "level3_id": "04939", "name": "Xã Đông Xuân", "type": "Xã" }, { "level3_id": "09895", "name": "Thị trấn Quốc Oai", "type": "Thị trấn" }, { "level3_id": "09898", "name": "Xã Sài Sơn", "type": "Xã" }, { "level3_id": "09904", "name": "Xã Phượng Sơn", "type": "Xã" }, { "level3_id": "09907", "name": "Xã Ngọc Liệp", "type": "Xã" }, { "level3_id": "09910", "name": "Xã Ngọc Mỹ", "type": "Xã" }, { "level3_id": "09916", "name": "Xã Thạch Thán", "type": "Xã" }, { "level3_id": "09919", "name": "Xã Đồng Quang", "type": "Xã" }, { "level3_id": "09922", "name": "Xã Phú Cát", "type": "Xã" }, { "level3_id": "09925", "name": "Xã Tuyết Nghĩa", "type": "Xã" }, { "level3_id": "09928", "name": "Xã Liệp Nghĩa", "type": "Xã" }, { "level3_id": "09931", "name": "Xã Cộng Hòa", "type": "Xã" }, { "level3_id": "09934", "name": "Xã Hưng Đạo", "type": "Xã" }, { "level3_id": "09940", "name": "Xã Phú Mãn", "type": "Xã" }, { "level3_id": "09943", "name": "Xã Cấn Hữu", "type": "Xã" }, { "level3_id": "09949", "name": "Xã Hòa Thạch", "type": "Xã" }, { "level3_id": "09952", "name": "Xã Đông Yên", "type": "Xã" } ] }, { "level2_id": "276", "name": "Huyện Thạch Thất", "type": "Huyện", "level3s": [ { "level3_id": "04927", "name": "Xã Yên Trung", "type": "Xã" }, { "level3_id": "04930", "name": "Xã Yên Bình", "type": "Xã" }, { "level3_id": "04936", "name": "Xã Tiến Xuân", "type": "Xã" }, { "level3_id": "09955", "name": "Thị trấn Liên Quan", "type": "Thị trấn" }, { "level3_id": "09958", "name": "Xã Đại Đồng", "type": "Xã" }, { "level3_id": "09961", "name": "Xã Cẩm Yên", "type": "Xã" }, { "level3_id": "09964", "name": "Xã Lại Thượng", "type": "Xã" }, { "level3_id": "09967", "name": "Xã Phú Kim", "type": "Xã" }, { "level3_id": "09970", "name": "Xã Hương Ngải", "type": "Xã" }, { "level3_id": "09973", "name": "Xã Lam Sơn", "type": "Xã" }, { "level3_id": "09976", "name": "Xã Kim Quan", "type": "Xã" }, { "level3_id": "09982", "name": "Xã Bình Yên", "type": "Xã" }, { "level3_id": "09988", "name": "Xã Thạch Hoà", "type": "Xã" }, { "level3_id": "09991", "name": "Xã Cần Kiệm", "type": "Xã" }, { "level3_id": "09997", "name": "Xã Phùng Xá", "type": "Xã" }, { "level3_id": "10000", "name": "Xã Tân Xã", "type": "Xã" }, { "level3_id": "10003", "name": "Xã Thạch Xá", "type": "Xã" }, { "level3_id": "10006", "name": "Xã Quang Trung", "type": "Xã" }, { "level3_id": "10009", "name": "Xã Hạ Bằng", "type": "Xã" }, { "level3_id": "10012", "name": "Xã Đồng Trúc", "type": "Xã" } ] }, { "level2_id": "277", "name": "Huyện Chương Mỹ", "type": "Huyện", "level3s": [ { "level3_id": "10015", "name": "Thị trấn Chúc Sơn", "type": "Thị trấn" }, { "level3_id": "10018", "name": "Thị trấn Xuân Mai", "type": "Thị trấn" }, { "level3_id": "10021", "name": "Xã Phụng Châu", "type": "Xã" }, { "level3_id": "10024", "name": "Xã Tiên Phương", "type": "Xã" }, { "level3_id": "10027", "name": "Xã Đông Sơn", "type": "Xã" }, { "level3_id": "10030", "name": "Xã Đông Phương Yên", "type": "Xã" }, { "level3_id": "10033", "name": "Xã Phú Nghĩa", "type": "Xã" }, { "level3_id": "10039", "name": "Xã Trường Yên", "type": "Xã" }, { "level3_id": "10042", "name": "Xã Ngọc Hòa", "type": "Xã" }, { "level3_id": "10045", "name": "Xã Thủy Xuân Tiên", "type": "Xã" }, { "level3_id": "10048", "name": "Xã Thanh Bình", "type": "Xã" }, { "level3_id": "10051", "name": "Xã Trung Hòa", "type": "Xã" }, { "level3_id": "10054", "name": "Xã Đại Yên", "type": "Xã" }, { "level3_id": "10057", "name": "Xã Thụy Hương", "type": "Xã" }, { "level3_id": "10060", "name": "Xã Tốt Động", "type": "Xã" }, { "level3_id": "10063", "name": "Xã Lam Điền", "type": "Xã" }, { "level3_id": "10066", "name": "Xã Tân Tiến", "type": "Xã" }, { "level3_id": "10069", "name": "Xã Nam Phương Tiến", "type": "Xã" }, { "level3_id": "10072", "name": "Xã Hợp Đồng", "type": "Xã" }, { "level3_id": "10075", "name": "Xã Hoàng Văn Thụ", "type": "Xã" }, { "level3_id": "10078", "name": "Xã Hoàng Diệu", "type": "Xã" }, { "level3_id": "10081", "name": "Xã Hữu Văn", "type": "Xã" }, { "level3_id": "10084", "name": "Xã Quảng Bị", "type": "Xã" }, { "level3_id": "10087", "name": "Xã Mỹ Lương", "type": "Xã" }, { "level3_id": "10090", "name": "Xã Thượng Vực", "type": "Xã" }, { "level3_id": "10096", "name": "Xã Hồng Phú", "type": "Xã" }, { "level3_id": "10099", "name": "Xã Trần Phú", "type": "Xã" }, { "level3_id": "10102", "name": "Xã Văn Võ", "type": "Xã" }, { "level3_id": "10105", "name": "Xã Đồng Lạc", "type": "Xã" }, { "level3_id": "10108", "name": "Xã Hòa Phú", "type": "Xã" } ] }, { "level2_id": "278", "name": "Huyện Thanh Oai", "type": "Huyện", "level3s": [ { "level3_id": "10114", "name": "Thị trấn Kim Bài", "type": "Thị trấn" }, { "level3_id": "10120", "name": "Xã Cự Khê", "type": "Xã" }, { "level3_id": "10126", "name": "Xã Bích Hòa", "type": "Xã" }, { "level3_id": "10129", "name": "Xã Mỹ Hưng", "type": "Xã" }, { "level3_id": "10132", "name": "Xã Cao Viên", "type": "Xã" }, { "level3_id": "10135", "name": "Xã Bình Minh", "type": "Xã" }, { "level3_id": "10138", "name": "Xã Tam Hưng", "type": "Xã" }, { "level3_id": "10141", "name": "Xã Thanh Cao", "type": "Xã" }, { "level3_id": "10144", "name": "Xã Thanh Thùy", "type": "Xã" }, { "level3_id": "10147", "name": "Xã Thanh Mai", "type": "Xã" }, { "level3_id": "10150", "name": "Xã Thanh Văn", "type": "Xã" }, { "level3_id": "10153", "name": "Xã Đỗ Động", "type": "Xã" }, { "level3_id": "10156", "name": "Xã Kim An", "type": "Xã" }, { "level3_id": "10159", "name": "Xã Kim Thư", "type": "Xã" }, { "level3_id": "10162", "name": "Xã Phương Trung", "type": "Xã" }, { "level3_id": "10165", "name": "Xã Tân Ước", "type": "Xã" }, { "level3_id": "10168", "name": "Xã Dân Hòa", "type": "Xã" }, { "level3_id": "10171", "name": "Xã Liên Châu", "type": "Xã" }, { "level3_id": "10174", "name": "Xã Cao Xuân Dương", "type": "Xã" }, { "level3_id": "10180", "name": "Xã Hồng Dương", "type": "Xã" } ] }, { "level2_id": "279", "name": "Huyện Thường Tín", "type": "Huyện", "level3s": [ { "level3_id": "10183", "name": "Thị trấn Thường Tín", "type": "Thị trấn" }, { "level3_id": "10186", "name": "Xã Ninh Sở", "type": "Xã" }, { "level3_id": "10189", "name": "Xã Nhị Khê", "type": "Xã" }, { "level3_id": "10192", "name": "Xã Duyên Thái", "type": "Xã" }, { "level3_id": "10195", "name": "Xã Khánh Hà", "type": "Xã" }, { "level3_id": "10198", "name": "Xã Hòa Bình", "type": "Xã" }, { "level3_id": "10201", "name": "Xã Văn Bình", "type": "Xã" }, { "level3_id": "10204", "name": "Xã Hiền Giang", "type": "Xã" }, { "level3_id": "10207", "name": "Xã Hồng Vân", "type": "Xã" }, { "level3_id": "10210", "name": "Xã Vân Tảo", "type": "Xã" }, { "level3_id": "10213", "name": "Xã Liên Phương", "type": "Xã" }, { "level3_id": "10216", "name": "Xã Văn Phú", "type": "Xã" }, { "level3_id": "10219", "name": "Xã Tự Nhiên", "type": "Xã" }, { "level3_id": "10222", "name": "Xã Tiền Phong", "type": "Xã" }, { "level3_id": "10225", "name": "Xã Hà Hồi", "type": "Xã" }, { "level3_id": "10231", "name": "Xã Nguyễn Trãi", "type": "Xã" }, { "level3_id": "10234", "name": "Xã Quất Động", "type": "Xã" }, { "level3_id": "10237", "name": "Xã Chương Dương", "type": "Xã" }, { "level3_id": "10240", "name": "Xã Tân Minh", "type": "Xã" }, { "level3_id": "10243", "name": "Xã Lê Lợi", "type": "Xã" }, { "level3_id": "10246", "name": "Xã Thắng Lợi", "type": "Xã" }, { "level3_id": "10249", "name": "Xã Dũng Tiến", "type": "Xã" }, { "level3_id": "10255", "name": "Xã Nghiêm Xuyên", "type": "Xã" }, { "level3_id": "10258", "name": "Xã Tô Hiệu", "type": "Xã" }, { "level3_id": "10261", "name": "Xã Văn Tự", "type": "Xã" }, { "level3_id": "10264", "name": "Xã Vạn Nhất", "type": "Xã" }, { "level3_id": "10267", "name": "Xã Minh Cường", "type": "Xã" } ] }, { "level2_id": "280", "name": "Huyện Phú Xuyên", "type": "Huyện", "level3s": [ { "level3_id": "10270", "name": "Thị trấn Phú Minh", "type": "Thị trấn" }, { "level3_id": "10273", "name": "Thị trấn Phú Xuyên", "type": "Thị trấn" }, { "level3_id": "10276", "name": "Xã Hồng Minh", "type": "Xã" }, { "level3_id": "10279", "name": "Xã Phượng Dực", "type": "Xã" }, { "level3_id": "10282", "name": "Xã Nam Tiến", "type": "Xã" }, { "level3_id": "10291", "name": "Xã Văn Hoàng", "type": "Xã" }, { "level3_id": "10294", "name": "Xã Phú Túc", "type": "Xã" }, { "level3_id": "10300", "name": "Xã Hồng Thái", "type": "Xã" }, { "level3_id": "10303", "name": "Xã Hoàng Long", "type": "Xã" }, { "level3_id": "10312", "name": "Xã Nam Phong", "type": "Xã" }, { "level3_id": "10315", "name": "Xã Tân Dân", "type": "Xã" }, { "level3_id": "10318", "name": "Xã Quang Hà", "type": "Xã" }, { "level3_id": "10321", "name": "Xã Chuyên Mỹ", "type": "Xã" }, { "level3_id": "10324", "name": "Xã Khai Thái", "type": "Xã" }, { "level3_id": "10327", "name": "Xã Phúc Tiến", "type": "Xã" }, { "level3_id": "10330", "name": "Xã Vân Từ", "type": "Xã" }, { "level3_id": "10333", "name": "Xã Tri Thủy", "type": "Xã" }, { "level3_id": "10336", "name": "Xã Đại Xuyên", "type": "Xã" }, { "level3_id": "10339", "name": "Xã Phú Yên", "type": "Xã" }, { "level3_id": "10342", "name": "Xã Bạch Hạ", "type": "Xã" }, { "level3_id": "10345", "name": "Xã Quang Lãng", "type": "Xã" }, { "level3_id": "10348", "name": "Xã Châu Can", "type": "Xã" }, { "level3_id": "10351", "name": "Xã Minh Tân", "type": "Xã" } ] }, { "level2_id": "281", "name": "Huyện Ứng Hòa", "type": "Huyện", "level3s": [ { "level3_id": "10354", "name": "Thị trấn Vân Đình", "type": "Thị trấn" }, { "level3_id": "10363", "name": "Xã Hoa Viên", "type": "Xã" }, { "level3_id": "10366", "name": "Xã Quảng Phú Cầu", "type": "Xã" }, { "level3_id": "10369", "name": "Xã Trường Thịnh", "type": "Xã" }, { "level3_id": "10375", "name": "Xã Liên Bạt", "type": "Xã" }, { "level3_id": "10378", "name": "Xã Cao Sơn Tiến", "type": "Xã" }, { "level3_id": "10384", "name": "Xã Phương Tú", "type": "Xã" }, { "level3_id": "10387", "name": "Xã Trung Tú", "type": "Xã" }, { "level3_id": "10390", "name": "Xã Đồng Tân", "type": "Xã" }, { "level3_id": "10393", "name": "Xã Tảo Dương Văn", "type": "Xã" }, { "level3_id": "10396", "name": "Xã Thái Hòa", "type": "Xã" }, { "level3_id": "10399", "name": "Xã Minh Đức", "type": "Xã" }, { "level3_id": "10402", "name": "Xã Trầm Lộng", "type": "Xã" }, { "level3_id": "10411", "name": "Xã Kim Đường", "type": "Xã" }, { "level3_id": "10417", "name": "Xã Hòa Phú", "type": "Xã" }, { "level3_id": "10423", "name": "Xã Đại Hùng", "type": "Xã" }, { "level3_id": "10426", "name": "Xã Đông Lỗ", "type": "Xã" }, { "level3_id": "10429", "name": "Xã Phù Lưu", "type": "Xã" }, { "level3_id": "10432", "name": "Xã Đại Cường", "type": "Xã" }, { "level3_id": "10435", "name": "Xã Bình Lưu Quang", "type": "Xã" } ] }, { "level2_id": "282", "name": "Huyện Mỹ Đức", "type": "Huyện", "level3s": [ { "level3_id": "10441", "name": "Thị trấn Đại Nghĩa", "type": "Thị trấn" }, { "level3_id": "10444", "name": "Xã Đồng Tâm", "type": "Xã" }, { "level3_id": "10447", "name": "Xã Thượng Lâm", "type": "Xã" }, { "level3_id": "10450", "name": "Xã Tuy Lai", "type": "Xã" }, { "level3_id": "10453", "name": "Xã Phúc Lâm", "type": "Xã" }, { "level3_id": "10459", "name": "Xã Mỹ Xuyên", "type": "Xã" }, { "level3_id": "10462", "name": "Xã An Mỹ", "type": "Xã" }, { "level3_id": "10465", "name": "Xã Hồng Sơn", "type": "Xã" }, { "level3_id": "10468", "name": "Xã Lê Thanh", "type": "Xã" }, { "level3_id": "10471", "name": "Xã Xuy Xá", "type": "Xã" }, { "level3_id": "10474", "name": "Xã Phùng Xá", "type": "Xã" }, { "level3_id": "10477", "name": "Xã Phù Lưu Tế", "type": "Xã" }, { "level3_id": "10480", "name": "Xã Đại Hưng", "type": "Xã" }, { "level3_id": "10483", "name": "Xã Vạn Tín", "type": "Xã" }, { "level3_id": "10489", "name": "Xã Hương Sơn", "type": "Xã" }, { "level3_id": "10492", "name": "Xã Hùng Tiến", "type": "Xã" }, { "level3_id": "10495", "name": "Xã An Tiến", "type": "Xã" }, { "level3_id": "10498", "name": "Xã Hợp Tiến", "type": "Xã" }, { "level3_id": "10501", "name": "Xã Hợp Thanh", "type": "Xã" }, { "level3_id": "10504", "name": "Xã An Phú", "type": "Xã" } ] } ] }, { "level1_id": "02", "name": "Tỉnh Hà Giang", "type": "Tỉnh", "level2s": [ { "level2_id": "024", "name": "Thành phố Hà Giang", "type": "Thành phố", "level3s": [ { "level3_id": "00688", "name": "Phường Quang Trung", "type": "Phường" }, { "level3_id": "00691", "name": "Phường Trần Phú", "type": "Phường" }, { "level3_id": "00692", "name": "Phường Ngọc Hà", "type": "Phường" }, { "level3_id": "00694", "name": "Phường Nguyễn Trãi", "type": "Phường" }, { "level3_id": "00697", "name": "Phường Minh Khai", "type": "Phường" }, { "level3_id": "00700", "name": "Xã Ngọc Đường", "type": "Xã" }, { "level3_id": "00946", "name": "Xã Phương Độ", "type": "Xã" }, { "level3_id": "00949", "name": "Xã Phương Thiện", "type": "Xã" } ] }, { "level2_id": "026", "name": "Huyện Đồng Văn", "type": "Huyện", "level3s": [ { "level3_id": "00712", "name": "Thị trấn Phó Bảng", "type": "Thị trấn" }, { "level3_id": "00715", "name": "Xã Lũng Cú", "type": "Xã" }, { "level3_id": "00718", "name": "Xã Má Lé", "type": "Xã" }, { "level3_id": "00721", "name": "Thị trấn Đồng Văn", "type": "Thị trấn" }, { "level3_id": "00724", "name": "Xã Lũng Táo", "type": "Xã" }, { "level3_id": "00727", "name": "Xã Phố Là", "type": "Xã" }, { "level3_id": "00730", "name": "Xã Thài Phìn Tủng", "type": "Xã" }, { "level3_id": "00733", "name": "Xã Sủng Là", "type": "Xã" }, { "level3_id": "00736", "name": "Xã Xà Phìn", "type": "Xã" }, { "level3_id": "00739", "name": "Xã Tả Phìn", "type": "Xã" }, { "level3_id": "00742", "name": "Xã Tả Lủng", "type": "Xã" }, { "level3_id": "00745", "name": "Xã Phố Cáo", "type": "Xã" }, { "level3_id": "00748", "name": "Xã Sính Lủng", "type": "Xã" }, { "level3_id": "00751", "name": "Xã Sảng Tủng", "type": "Xã" }, { "level3_id": "00754", "name": "Xã Lũng Thầu", "type": "Xã" }, { "level3_id": "00757", "name": "Xã Hố Quáng Phìn", "type": "Xã" }, { "level3_id": "00760", "name": "Xã Vần Chải", "type": "Xã" }, { "level3_id": "00763", "name": "Xã Lũng Phìn", "type": "Xã" }, { "level3_id": "00766", "name": "Xã Sủng Trái", "type": "Xã" } ] }, { "level2_id": "027", "name": "Huyện Mèo Vạc", "type": "Huyện", "level3s": [ { "level3_id": "00769", "name": "Thị trấn Mèo Vạc", "type": "Thị trấn" }, { "level3_id": "00772", "name": "Xã Thượng Phùng", "type": "Xã" }, { "level3_id": "00775", "name": "Xã Pải Lủng", "type": "Xã" }, { "level3_id": "00778", "name": "Xã Xín Cái", "type": "Xã" }, { "level3_id": "00781", "name": "Xã Pả Vi", "type": "Xã" }, { "level3_id": "00784", "name": "Xã Giàng Chu Phìn", "type": "Xã" }, { "level3_id": "00787", "name": "Xã Sủng Trà", "type": "Xã" }, { "level3_id": "00790", "name": "Xã Sủng Máng", "type": "Xã" }, { "level3_id": "00793", "name": "Xã Sơn Vĩ", "type": "Xã" }, { "level3_id": "00796", "name": "Xã Tả Lủng", "type": "Xã" }, { "level3_id": "00799", "name": "Xã Cán Chu Phìn", "type": "Xã" }, { "level3_id": "00802", "name": "Xã Lũng Pù", "type": "Xã" }, { "level3_id": "00805", "name": "Xã Lũng Chinh", "type": "Xã" }, { "level3_id": "00808", "name": "Xã Tát Ngà", "type": "Xã" }, { "level3_id": "00811", "name": "Xã Nậm Ban", "type": "Xã" }, { "level3_id": "00814", "name": "Xã Khâu Vai", "type": "Xã" }, { "level3_id": "00815", "name": "Xã Niêm Tòng", "type": "Xã" }, { "level3_id": "00817", "name": "Xã Niêm Sơn", "type": "Xã" } ] }, { "level2_id": "028", "name": "Huyện Yên Minh", "type": "Huyện", "level3s": [ { "level3_id": "00820", "name": "Thị trấn Yên Minh", "type": "Thị trấn" }, { "level3_id": "00823", "name": "Xã Thắng Mố", "type": "Xã" }, { "level3_id": "00826", "name": "Xã Phú Lũng", "type": "Xã" }, { "level3_id": "00829", "name": "Xã Sủng Tráng", "type": "Xã" }, { "level3_id": "00832", "name": "Xã Bạch Đích", "type": "Xã" }, { "level3_id": "00835", "name": "Xã Na Khê", "type": "Xã" }, { "level3_id": "00838", "name": "Xã Sủng Thài", "type": "Xã" }, { "level3_id": "00841", "name": "Xã Hữu Vinh", "type": "Xã" }, { "level3_id": "00844", "name": "Xã Lao Và Chải", "type": "Xã" }, { "level3_id": "00847", "name": "Xã Mậu Duệ", "type": "Xã" }, { "level3_id": "00850", "name": "Xã Đông Minh", "type": "Xã" }, { "level3_id": "00853", "name": "Xã Mậu Long", "type": "Xã" }, { "level3_id": "00856", "name": "Xã Ngam La", "type": "Xã" }, { "level3_id": "00859", "name": "Xã Ngọc Long", "type": "Xã" }, { "level3_id": "00862", "name": "Xã Đường Thượng", "type": "Xã" }, { "level3_id": "00865", "name": "Xã Lũng Hồ", "type": "Xã" }, { "level3_id": "00868", "name": "Xã Du Tiến", "type": "Xã" }, { "level3_id": "00871", "name": "Xã Du Già", "type": "Xã" } ] }, { "level2_id": "029", "name": "Huyện Quản Bạ", "type": "Huyện", "level3s": [ { "level3_id": "00874", "name": "Thị trấn Tam Sơn", "type": "Thị trấn" }, { "level3_id": "00877", "name": "Xã Bát Đại Sơn", "type": "Xã" }, { "level3_id": "00880", "name": "Xã Nghĩa Thuận", "type": "Xã" }, { "level3_id": "00883", "name": "Xã Cán Tỷ", "type": "Xã" }, { "level3_id": "00886", "name": "Xã Cao Mã Pờ", "type": "Xã" }, { "level3_id": "00889", "name": "Xã Thanh Vân", "type": "Xã" }, { "level3_id": "00892", "name": "Xã Tùng Vài", "type": "Xã" }, { "level3_id": "00895", "name": "Xã Đông Hà", "type": "Xã" }, { "level3_id": "00898", "name": "Xã Quản Bạ", "type": "Xã" }, { "level3_id": "00901", "name": "Xã Lùng Tám", "type": "Xã" }, { "level3_id": "00904", "name": "Xã Quyết Tiến", "type": "Xã" }, { "level3_id": "00907", "name": "Xã Tả Ván", "type": "Xã" }, { "level3_id": "00910", "name": "Xã Thái An", "type": "Xã" } ] }, { "level2_id": "030", "name": "Huyện Vị Xuyên", "type": "Huyện", "level3s": [ { "level3_id": "00703", "name": "Xã Kim Thạch", "type": "Xã" }, { "level3_id": "00706", "name": "Xã Phú Linh", "type": "Xã" }, { "level3_id": "00709", "name": "Xã Kim Linh", "type": "Xã" }, { "level3_id": "00913", "name": "Thị trấn Vị Xuyên", "type": "Thị trấn" }, { "level3_id": "00916", "name": "Thị trấn Nông Trường Việt Lâm", "type": "Thị trấn" }, { "level3_id": "00919", "name": "Xã Minh Tân", "type": "Xã" }, { "level3_id": "00922", "name": "Xã Thuận Hoà", "type": "Xã" }, { "level3_id": "00925", "name": "Xã Tùng Bá", "type": "Xã" }, { "level3_id": "00928", "name": "Xã Thanh Thủy", "type": "Xã" }, { "level3_id": "00931", "name": "Xã Thanh Đức", "type": "Xã" }, { "level3_id": "00934", "name": "Xã Phong Quang", "type": "Xã" }, { "level3_id": "00937", "name": "Xã Xín Chải", "type": "Xã" }, { "level3_id": "00940", "name": "Xã Phương Tiến", "type": "Xã" }, { "level3_id": "00943", "name": "Xã Lao Chải", "type": "Xã" }, { "level3_id": "00952", "name": "Xã Cao Bồ", "type": "Xã" }, { "level3_id": "00955", "name": "Xã Đạo Đức", "type": "Xã" }, { "level3_id": "00958", "name": "Xã Thượng Sơn", "type": "Xã" }, { "level3_id": "00961", "name": "Xã Linh Hồ", "type": "Xã" }, { "level3_id": "00964", "name": "Xã Quảng Ngần", "type": "Xã" }, { "level3_id": "00967", "name": "Xã Việt Lâm", "type": "Xã" }, { "level3_id": "00970", "name": "Xã Ngọc Linh", "type": "Xã" }, { "level3_id": "00973", "name": "Xã Ngọc Minh", "type": "Xã" }, { "level3_id": "00976", "name": "Xã Bạch Ngọc", "type": "Xã" }, { "level3_id": "00979", "name": "Xã Trung Thành", "type": "Xã" } ] }, { "level2_id": "031", "name": "Huyện Bắc Mê", "type": "Huyện", "level3s": [ { "level3_id": "00982", "name": "Xã Minh Sơn", "type": "Xã" }, { "level3_id": "00985", "name": "Xã Giáp Trung", "type": "Xã" }, { "level3_id": "00988", "name": "Xã Yên Định", "type": "Xã" }, { "level3_id": "00991", "name": "Thị trấn Yên Phú", "type": "Thị trấn" }, { "level3_id": "00994", "name": "Xã Minh Ngọc", "type": "Xã" }, { "level3_id": "00997", "name": "Xã Yên Phong", "type": "Xã" }, { "level3_id": "01000", "name": "Xã Lạc Nông", "type": "Xã" }, { "level3_id": "01003", "name": "Xã Phú Nam", "type": "Xã" }, { "level3_id": "01006", "name": "Xã Yên Cường", "type": "Xã" }, { "level3_id": "01009", "name": "Xã Thượng Tân", "type": "Xã" }, { "level3_id": "01012", "name": "Xã Đường Âm", "type": "Xã" }, { "level3_id": "01015", "name": "Xã Đường Hồng", "type": "Xã" }, { "level3_id": "01018", "name": "Xã Phiêng Luông", "type": "Xã" } ] }, { "level2_id": "032", "name": "Huyện Hoàng Su Phì", "type": "Huyện", "level3s": [ { "level3_id": "01021", "name": "Thị trấn Vinh Quang", "type": "Thị trấn" }, { "level3_id": "01024", "name": "Xã Bản Máy", "type": "Xã" }, { "level3_id": "01027", "name": "Xã Thàng Tín", "type": "Xã" }, { "level3_id": "01030", "name": "Xã Thèn Chu Phìn", "type": "Xã" }, { "level3_id": "01033", "name": "Xã Pố Lồ", "type": "Xã" }, { "level3_id": "01036", "name": "Xã Bản Phùng", "type": "Xã" }, { "level3_id": "01039", "name": "Xã Túng Sán", "type": "Xã" }, { "level3_id": "01042", "name": "Xã Chiến Phố", "type": "Xã" }, { "level3_id": "01045", "name": "Xã Đản Ván", "type": "Xã" }, { "level3_id": "01048", "name": "Xã Tụ Nhân", "type": "Xã" }, { "level3_id": "01051", "name": "Xã Tân Tiến", "type": "Xã" }, { "level3_id": "01054", "name": "Xã Nàng Đôn", "type": "Xã" }, { "level3_id": "01057", "name": "Xã Pờ Ly Ngài", "type": "Xã" }, { "level3_id": "01060", "name": "Xã Sán Xả Hồ", "type": "Xã" }, { "level3_id": "01063", "name": "Xã Bản Luốc", "type": "Xã" }, { "level3_id": "01066", "name": "Xã Ngàm Đăng Vài", "type": "Xã" }, { "level3_id": "01069", "name": "Xã Bản Nhùng", "type": "Xã" }, { "level3_id": "01072", "name": "Xã Tả Sử Choóng", "type": "Xã" }, { "level3_id": "01075", "name": "Xã Nậm Dịch", "type": "Xã" }, { "level3_id": "01081", "name": "Xã Hồ Thầu", "type": "Xã" }, { "level3_id": "01084", "name": "Xã Nam Sơn", "type": "Xã" }, { "level3_id": "01087", "name": "Xã Nậm Tỵ", "type": "Xã" }, { "level3_id": "01090", "name": "Xã Thông Nguyên", "type": "Xã" }, { "level3_id": "01093", "name": "Xã Nậm Khòa", "type": "Xã" } ] }, { "level2_id": "033", "name": "Huyện Xín Mần", "type": "Huyện", "level3s": [ { "level3_id": "01096", "name": "Thị trấn Cốc Pài", "type": "Thị trấn" }, { "level3_id": "01099", "name": "Xã Nàn Xỉn", "type": "Xã" }, { "level3_id": "01102", "name": "Xã Bản Díu", "type": "Xã" }, { "level3_id": "01105", "name": "Xã Chí Cà", "type": "Xã" }, { "level3_id": "01108", "name": "Xã Xín Mần", "type": "Xã" }, { "level3_id": "01114", "name": "Xã Thèn Phàng", "type": "Xã" }, { "level3_id": "01117", "name": "Xã Trung Thịnh", "type": "Xã" }, { "level3_id": "01120", "name": "Xã Pà Vầy Sủ", "type": "Xã" }, { "level3_id": "01123", "name": "Xã Cốc Rế", "type": "Xã" }, { "level3_id": "01126", "name": "Xã Thu Tà", "type": "Xã" }, { "level3_id": "01129", "name": "Xã Nàn Ma", "type": "Xã" }, { "level3_id": "01132", "name": "Xã Tả Nhìu", "type": "Xã" }, { "level3_id": "01135", "name": "Xã Bản Ngò", "type": "Xã" }, { "level3_id": "01138", "name": "Xã Chế Là", "type": "Xã" }, { "level3_id": "01141", "name": "Xã Nấm Dẩn", "type": "Xã" }, { "level3_id": "01144", "name": "Xã Quảng Nguyên", "type": "Xã" }, { "level3_id": "01147", "name": "Xã Nà Chì", "type": "Xã" }, { "level3_id": "01150", "name": "Xã Khuôn Lùng", "type": "Xã" } ] }, { "level2_id": "034", "name": "Huyện Bắc Quang", "type": "Huyện", "level3s": [ { "level3_id": "01153", "name": "Thị trấn Việt Quang", "type": "Thị trấn" }, { "level3_id": "01156", "name": "Thị trấn Vĩnh Tuy", "type": "Thị trấn" }, { "level3_id": "01159", "name": "Xã Tân Lập", "type": "Xã" }, { "level3_id": "01162", "name": "Xã Tân Thành", "type": "Xã" }, { "level3_id": "01165", "name": "Xã Đồng Tiến", "type": "Xã" }, { "level3_id": "01168", "name": "Xã Đồng Tâm", "type": "Xã" }, { "level3_id": "01171", "name": "Xã Tân Quang", "type": "Xã" }, { "level3_id": "01174", "name": "Xã Thượng Bình", "type": "Xã" }, { "level3_id": "01177", "name": "Xã Hữu Sản", "type": "Xã" }, { "level3_id": "01180", "name": "Xã Kim Ngọc", "type": "Xã" }, { "level3_id": "01183", "name": "Xã Việt Vinh", "type": "Xã" }, { "level3_id": "01186", "name": "Xã Bằng Hành", "type": "Xã" }, { "level3_id": "01189", "name": "Xã Quang Minh", "type": "Xã" }, { "level3_id": "01192", "name": "Xã Liên Hiệp", "type": "Xã" }, { "level3_id": "01195", "name": "Xã Vô Điếm", "type": "Xã" }, { "level3_id": "01198", "name": "Xã Việt Hồng", "type": "Xã" }, { "level3_id": "01201", "name": "Xã Hùng An", "type": "Xã" }, { "level3_id": "01204", "name": "Xã Đức Xuân", "type": "Xã" }, { "level3_id": "01207", "name": "Xã Tiên Kiều", "type": "Xã" }, { "level3_id": "01210", "name": "Xã Vĩnh Hảo", "type": "Xã" }, { "level3_id": "01213", "name": "Xã Vĩnh Phúc", "type": "Xã" }, { "level3_id": "01216", "name": "Xã Đồng Yên", "type": "Xã" }, { "level3_id": "01219", "name": "Xã Đông Thành", "type": "Xã" } ] }, { "level2_id": "035", "name": "Huyện Quang Bình", "type": "Huyện", "level3s": [ { "level3_id": "01222", "name": "Xã Xuân Minh", "type": "Xã" }, { "level3_id": "01225", "name": "Xã Tiên Nguyên", "type": "Xã" }, { "level3_id": "01228", "name": "Xã Tân Nam", "type": "Xã" }, { "level3_id": "01231", "name": "Xã Bản Rịa", "type": "Xã" }, { "level3_id": "01234", "name": "Xã Yên Thành", "type": "Xã" }, { "level3_id": "01237", "name": "Thị trấn Yên Bình", "type": "Thị trấn" }, { "level3_id": "01240", "name": "Xã Tân Trịnh", "type": "Xã" }, { "level3_id": "01243", "name": "Xã Tân Bắc", "type": "Xã" }, { "level3_id": "01246", "name": "Xã Bằng Lang", "type": "Xã" }, { "level3_id": "01249", "name": "Xã Yên Hà", "type": "Xã" }, { "level3_id": "01252", "name": "Xã Hương Sơn", "type": "Xã" }, { "level3_id": "01255", "name": "Xã Xuân Giang", "type": "Xã" }, { "level3_id": "01258", "name": "Xã Nà Khương", "type": "Xã" }, { "level3_id": "01261", "name": "Xã Tiên Yên", "type": "Xã" }, { "level3_id": "01264", "name": "Xã Vĩ Thượng", "type": "Xã" } ] } ] }, { "level1_id": "04", "name": "Tỉnh Cao Bằng", "type": "Tỉnh", "level2s": [ { "level2_id": "040", "name": "Thành phố Cao Bằng", "type": "Thành phố", "level3s": [ { "level3_id": "01267", "name": "Phường Sông Hiến", "type": "Phường" }, { "level3_id": "01270", "name": "Phường Sông Bằng", "type": "Phường" }, { "level3_id": "01273", "name": "Phường Hợp Giang", "type": "Phường" }, { "level3_id": "01276", "name": "Phường Tân Giang", "type": "Phường" }, { "level3_id": "01279", "name": "Phường Ngọc Xuân", "type": "Phường" }, { "level3_id": "01282", "name": "Phường Đề Thám", "type": "Phường" }, { "level3_id": "01285", "name": "Phường Hoà Chung", "type": "Phường" }, { "level3_id": "01288", "name": "Phường Duyệt Trung", "type": "Phường" }, { "level3_id": "01693", "name": "Xã Vĩnh Quang", "type": "Xã" }, { "level3_id": "01705", "name": "Xã Hưng Đạo", "type": "Xã" }, { "level3_id": "01720", "name": "Xã Chu Trinh", "type": "Xã" } ] }, { "level2_id": "042", "name": "Huyện Bảo Lâm", "type": "Huyện", "level3s": [ { "level3_id": "01290", "name": "Thị trấn Pác Miầu", "type": "Thị trấn" }, { "level3_id": "01291", "name": "Xã Đức Hạnh", "type": "Xã" }, { "level3_id": "01294", "name": "Xã Lý Bôn", "type": "Xã" }, { "level3_id": "01296", "name": "Xã Nam Cao", "type": "Xã" }, { "level3_id": "01297", "name": "Xã Nam Quang", "type": "Xã" }, { "level3_id": "01300", "name": "Xã Vĩnh Quang", "type": "Xã" }, { "level3_id": "01303", "name": "Xã Quảng Lâm", "type": "Xã" }, { "level3_id": "01304", "name": "Xã Thạch Lâm", "type": "Xã" }, { "level3_id": "01309", "name": "Xã Vĩnh Phong", "type": "Xã" }, { "level3_id": "01312", "name": "Xã Mông Ân", "type": "Xã" }, { "level3_id": "01315", "name": "Xã Thái Học", "type": "Xã" }, { "level3_id": "01316", "name": "Xã Thái Sơn", "type": "Xã" }, { "level3_id": "01318", "name": "Xã Yên Thổ", "type": "Xã" } ] }, { "level2_id": "043", "name": "Huyện Bảo Lạc", "type": "Huyện", "level3s": [ { "level3_id": "01321", "name": "Thị trấn Bảo Lạc", "type": "Thị trấn" }, { "level3_id": "01324", "name": "Xã Cốc Pàng", "type": "Xã" }, { "level3_id": "01327", "name": "Xã Thượng Hà", "type": "Xã" }, { "level3_id": "01330", "name": "Xã Cô Ba", "type": "Xã" }, { "level3_id": "01333", "name": "Xã Bảo Toàn", "type": "Xã" }, { "level3_id": "01336", "name": "Xã Khánh Xuân", "type": "Xã" }, { "level3_id": "01339", "name": "Xã Xuân Trường", "type": "Xã" }, { "level3_id": "01342", "name": "Xã Hồng Trị", "type": "Xã" }, { "level3_id": "01343", "name": "Xã Kim Cúc", "type": "Xã" }, { "level3_id": "01345", "name": "Xã Phan Thanh", "type": "Xã" }, { "level3_id": "01348", "name": "Xã Hồng An", "type": "Xã" }, { "level3_id": "01351", "name": "Xã Hưng Đạo", "type": "Xã" }, { "level3_id": "01352", "name": "Xã Hưng Thịnh", "type": "Xã" }, { "level3_id": "01354", "name": "Xã Huy Giáp", "type": "Xã" }, { "level3_id": "01357", "name": "Xã Đình Phùng", "type": "Xã" }, { "level3_id": "01359", "name": "Xã Sơn Lập", "type": "Xã" }, { "level3_id": "01360", "name": "Xã Sơn Lộ", "type": "Xã" } ] }, { "level2_id": "045", "name": "Huyện Hà Quảng", "type": "Huyện", "level3s": [ { "level3_id": "01363", "name": "Thị trấn Thông Nông", "type": "Thị trấn" }, { "level3_id": "01366", "name": "Xã Cần Yên", "type": "Xã" }, { "level3_id": "01367", "name": "Xã Cần Nông", "type": "Xã" }, { "level3_id": "01372", "name": "Xã Lương Thông", "type": "Xã" }, { "level3_id": "01375", "name": "Xã Đa Thông", "type": "Xã" }, { "level3_id": "01378", "name": "Xã Ngọc Động", "type": "Xã" }, { "level3_id": "01381", "name": "Xã Yên Sơn", "type": "Xã" }, { "level3_id": "01384", "name": "Xã Lương Can", "type": "Xã" }, { "level3_id": "01387", "name": "Xã Thanh Long", "type": "Xã" }, { "level3_id": "01392", "name": "Thị trấn Xuân Hòa", "type": "Thị trấn" }, { "level3_id": "01393", "name": "Xã Lũng Nặm", "type": "Xã" }, { "level3_id": "01399", "name": "Xã Trường Hà", "type": "Xã" }, { "level3_id": "01402", "name": "Xã Cải Viên", "type": "Xã" }, { "level3_id": "01411", "name": "Xã Nội Thôn", "type": "Xã" }, { "level3_id": "01414", "name": "Xã Tổng Cọt", "type": "Xã" }, { "level3_id": "01417", "name": "Xã Sóc Hà", "type": "Xã" }, { "level3_id": "01420", "name": "Xã Thượng Thôn", "type": "Xã" }, { "level3_id": "01429", "name": "Xã Hồng Sỹ", "type": "Xã" }, { "level3_id": "01432", "name": "Xã Quý Quân", "type": "Xã" }, { "level3_id": "01435", "name": "Xã Mã Ba", "type": "Xã" }, { "level3_id": "01438", "name": "Xã Ngọc Đào", "type": "Xã" } ] }, { "level2_id": "047", "name": "Huyện Trùng Khánh", "type": "Huyện", "level3s": [ { "level3_id": "01447", "name": "Thị trấn Trà Lĩnh", "type": "Thị trấn" }, { "level3_id": "01453", "name": "Xã Tri Phương", "type": "Xã" }, { "level3_id": "01456", "name": "Xã Quang Hán", "type": "Xã" }, { "level3_id": "01462", "name": "Xã Xuân Nội", "type": "Xã" }, { "level3_id": "01465", "name": "Xã Quang Trung", "type": "Xã" }, { "level3_id": "01468", "name": "Xã Quang Vinh", "type": "Xã" }, { "level3_id": "01471", "name": "Xã Cao Chương", "type": "Xã" }, { "level3_id": "01477", "name": "Thị trấn Trùng Khánh", "type": "Thị trấn" }, { "level3_id": "01480", "name": "Xã Ngọc Khê", "type": "Xã" }, { "level3_id": "01481", "name": "Xã Ngọc Côn", "type": "Xã" }, { "level3_id": "01483", "name": "Xã Phong Nậm", "type": "Xã" }, { "level3_id": "01489", "name": "Xã Đình Phong", "type": "Xã" }, { "level3_id": "01495", "name": "Xã Đàm Thuỷ", "type": "Xã" }, { "level3_id": "01498", "name": "Xã Khâm Thành", "type": "Xã" }, { "level3_id": "01501", "name": "Xã Chí Viễn", "type": "Xã" }, { "level3_id": "01504", "name": "Xã Lăng Hiếu", "type": "Xã" }, { "level3_id": "01507", "name": "Xã Phong Châu", "type": "Xã" }, { "level3_id": "01516", "name": "Xã Trung Phúc", "type": "Xã" }, { "level3_id": "01519", "name": "Xã Cao Thăng", "type": "Xã" }, { "level3_id": "01522", "name": "Xã Đức Hồng", "type": "Xã" }, { "level3_id": "01525", "name": "Xã Đoài Dương", "type": "Xã" } ] }, { "level2_id": "048", "name": "Huyện Hạ Lang", "type": "Huyện", "level3s": [ { "level3_id": "01534", "name": "Xã Minh Long", "type": "Xã" }, { "level3_id": "01537", "name": "Xã Lý Quốc", "type": "Xã" }, { "level3_id": "01540", "name": "Xã Thắng Lợi", "type": "Xã" }, { "level3_id": "01543", "name": "Xã Đồng Loan", "type": "Xã" }, { "level3_id": "01546", "name": "Xã Đức Quang", "type": "Xã" }, { "level3_id": "01549", "name": "Xã Kim Loan", "type": "Xã" }, { "level3_id": "01552", "name": "Xã Quang Long", "type": "Xã" }, { "level3_id": "01555", "name": "Xã An Lạc", "type": "Xã" }, { "level3_id": "01558", "name": "Thị trấn Thanh Nhật", "type": "Thị trấn" }, { "level3_id": "01561", "name": "Xã Vinh Quý", "type": "Xã" }, { "level3_id": "01564", "name": "Xã Thống Nhất", "type": "Xã" }, { "level3_id": "01567", "name": "Xã Cô Ngân", "type": "Xã" }, { "level3_id": "01573", "name": "Xã Thị Hoa", "type": "Xã" } ] }, { "level2_id": "049", "name": "Huyện Quảng Hòa", "type": "Huyện", "level3s": [ { "level3_id": "01474", "name": "Xã Quốc Toản", "type": "Xã" }, { "level3_id": "01576", "name": "Thị trấn Quảng Uyên", "type": "Thị trấn" }, { "level3_id": "01579", "name": "Xã Phi Hải", "type": "Xã" }, { "level3_id": "01582", "name": "Xã Quảng Hưng", "type": "Xã" }, { "level3_id": "01594", "name": "Xã Độc Lập", "type": "Xã" }, { "level3_id": "01597", "name": "Xã Cai Bộ", "type": "Xã" }, { "level3_id": "01603", "name": "Xã Phúc Sen", "type": "Xã" }, { "level3_id": "01606", "name": "Xã Chí Thảo", "type": "Xã" }, { "level3_id": "01609", "name": "Xã Tự Do", "type": "Xã" }, { "level3_id": "01615", "name": "Xã Hồng Quang", "type": "Xã" }, { "level3_id": "01618", "name": "Xã Ngọc Động", "type": "Xã" }, { "level3_id": "01624", "name": "Xã Hạnh Phúc", "type": "Xã" }, { "level3_id": "01627", "name": "Thị trấn Tà Lùng", "type": "Thị trấn" }, { "level3_id": "01630", "name": "Xã Bế Văn Đàn", "type": "Xã" }, { "level3_id": "01636", "name": "Xã Cách Linh", "type": "Xã" }, { "level3_id": "01639", "name": "Xã Đại Sơn", "type": "Xã" }, { "level3_id": "01645", "name": "Xã Tiên Thành", "type": "Xã" }, { "level3_id": "01648", "name": "Thị trấn Hoà Thuận", "type": "Thị trấn" }, { "level3_id": "01651", "name": "Xã Mỹ Hưng", "type": "Xã" } ] }, { "level2_id": "051", "name": "Huyện Hoà An", "type": "Huyện", "level3s": [ { "level3_id": "01654", "name": "Thị trấn Nước Hai", "type": "Thị trấn" }, { "level3_id": "01657", "name": "Xã Dân Chủ", "type": "Xã" }, { "level3_id": "01660", "name": "Xã Nam Tuấn", "type": "Xã" }, { "level3_id": "01666", "name": "Xã Đại Tiến", "type": "Xã" }, { "level3_id": "01669", "name": "Xã Đức Long", "type": "Xã" }, { "level3_id": "01672", "name": "Xã Ngũ Lão", "type": "Xã" }, { "level3_id": "01675", "name": "Xã Trương Lương", "type": "Xã" }, { "level3_id": "01687", "name": "Xã Hồng Việt", "type": "Xã" }, { "level3_id": "01696", "name": "Xã Hoàng Tung", "type": "Xã" }, { "level3_id": "01699", "name": "Xã Nguyễn Huệ", "type": "Xã" }, { "level3_id": "01702", "name": "Xã Quang Trung", "type": "Xã" }, { "level3_id": "01708", "name": "Xã Bạch Đằng", "type": "Xã" }, { "level3_id": "01711", "name": "Xã Bình Dương", "type": "Xã" }, { "level3_id": "01714", "name": "Xã Lê Chung", "type": "Xã" }, { "level3_id": "01723", "name": "Xã Hồng Nam", "type": "Xã" } ] }, { "level2_id": "052", "name": "Huyện Nguyên Bình", "type": "Huyện", "level3s": [ { "level3_id": "01726", "name": "Thị trấn Nguyên Bình", "type": "Thị trấn" }, { "level3_id": "01729", "name": "Thị trấn Tĩnh Túc", "type": "Thị trấn" }, { "level3_id": "01732", "name": "Xã Yên Lạc", "type": "Xã" }, { "level3_id": "01735", "name": "Xã Triệu Nguyên", "type": "Xã" }, { "level3_id": "01738", "name": "Xã Ca Thành", "type": "Xã" }, { "level3_id": "01744", "name": "Xã Vũ Nông", "type": "Xã" }, { "level3_id": "01747", "name": "Xã Minh Tâm", "type": "Xã" }, { "level3_id": "01750", "name": "Xã Thể Dục", "type": "Xã" }, { "level3_id": "01756", "name": "Xã Mai Long", "type": "Xã" }, { "level3_id": "01762", "name": "Xã Vũ Minh", "type": "Xã" }, { "level3_id": "01765", "name": "Xã Hoa Thám", "type": "Xã" }, { "level3_id": "01768", "name": "Xã Phan Thanh", "type": "Xã" }, { "level3_id": "01771", "name": "Xã Quang Thành", "type": "Xã" }, { "level3_id": "01774", "name": "Xã Tam Kim", "type": "Xã" }, { "level3_id": "01777", "name": "Xã Thành Công", "type": "Xã" }, { "level3_id": "01780", "name": "Xã Thịnh Vượng", "type": "Xã" }, { "level3_id": "01783", "name": "Xã Hưng Đạo", "type": "Xã" } ] }, { "level2_id": "053", "name": "Huyện Thạch An", "type": "Huyện", "level3s": [ { "level3_id": "01786", "name": "Thị trấn Đông Khê", "type": "Thị trấn" }, { "level3_id": "01789", "name": "Xã Canh Tân", "type": "Xã" }, { "level3_id": "01792", "name": "Xã Kim Đồng", "type": "Xã" }, { "level3_id": "01795", "name": "Xã Minh Khai", "type": "Xã" }, { "level3_id": "01801", "name": "Xã Đức Thông", "type": "Xã" }, { "level3_id": "01804", "name": "Xã Thái Cường", "type": "Xã" }, { "level3_id": "01807", "name": "Xã Vân Trình", "type": "Xã" }, { "level3_id": "01810", "name": "Xã Thụy Hùng", "type": "Xã" }, { "level3_id": "01813", "name": "Xã Quang Trọng", "type": "Xã" }, { "level3_id": "01816", "name": "Xã Trọng Con", "type": "Xã" }, { "level3_id": "01819", "name": "Xã Lê Lai", "type": "Xã" }, { "level3_id": "01822", "name": "Xã Đức Long", "type": "Xã" }, { "level3_id": "01828", "name": "Xã Lê Lợi", "type": "Xã" }, { "level3_id": "01831", "name": "Xã Đức Xuân", "type": "Xã" } ] } ] }, { "level1_id": "06", "name": "Tỉnh Bắc Kạn", "type": "Tỉnh", "level2s": [ { "level2_id": "058", "name": "Thành Phố Bắc Kạn", "type": "Thành phố", "level3s": [ { "level3_id": "01834", "name": "Phường Nguyễn Thị Minh Khai", "type": "Phường" }, { "level3_id": "01837", "name": "Phường Sông Cầu", "type": "Phường" }, { "level3_id": "01840", "name": "Phường Đức Xuân", "type": "Phường" }, { "level3_id": "01843", "name": "Phường Phùng Chí Kiên", "type": "Phường" }, { "level3_id": "01846", "name": "Phường Huyền Tụng", "type": "Phường" }, { "level3_id": "01849", "name": "Xã Dương Quang", "type": "Xã" }, { "level3_id": "01852", "name": "Xã Nông Thượng", "type": "Xã" }, { "level3_id": "01855", "name": "Phường Xuất Hóa", "type": "Phường" } ] }, { "level2_id": "060", "name": "Huyện Pác Nặm", "type": "Huyện", "level3s": [ { "level3_id": "01858", "name": "Xã Bằng Thành", "type": "Xã" }, { "level3_id": "01861", "name": "Xã Nhạn Môn", "type": "Xã" }, { "level3_id": "01864", "name": "Xã Bộc Bố", "type": "Xã" }, { "level3_id": "01867", "name": "Xã Công Bằng", "type": "Xã" }, { "level3_id": "01870", "name": "Xã Giáo Hiệu", "type": "Xã" }, { "level3_id": "01873", "name": "Xã Xuân La", "type": "Xã" }, { "level3_id": "01876", "name": "Xã An Thắng", "type": "Xã" }, { "level3_id": "01879", "name": "Xã Cổ Linh", "type": "Xã" }, { "level3_id": "01882", "name": "Xã Nghiên Loan", "type": "Xã" }, { "level3_id": "01885", "name": "Xã Cao Tân", "type": "Xã" } ] }, { "level2_id": "061", "name": "Huyện Ba Bể", "type": "Huyện", "level3s": [ { "level3_id": "01888", "name": "Thị trấn Chợ Rã", "type": "Thị trấn" }, { "level3_id": "01891", "name": "Xã Bành Trạch", "type": "Xã" }, { "level3_id": "01894", "name": "Xã Phúc Lộc", "type": "Xã" }, { "level3_id": "01897", "name": "Xã Hà Hiệu", "type": "Xã" }, { "level3_id": "01900", "name": "Xã Cao Thượng", "type": "Xã" }, { "level3_id": "01906", "name": "Xã Khang Ninh", "type": "Xã" }, { "level3_id": "01909", "name": "Xã Nam Mẫu", "type": "Xã" }, { "level3_id": "01912", "name": "Xã Thượng Giáo", "type": "Xã" }, { "level3_id": "01915", "name": "Xã Địa Linh", "type": "Xã" }, { "level3_id": "01918", "name": "Xã Yến Dương", "type": "Xã" }, { "level3_id": "01921", "name": "Xã Chu Hương", "type": "Xã" }, { "level3_id": "01924", "name": "Xã Quảng Khê", "type": "Xã" }, { "level3_id": "01927", "name": "Xã Mỹ Phương", "type": "Xã" }, { "level3_id": "01930", "name": "Xã Hoàng Trĩ", "type": "Xã" }, { "level3_id": "01933", "name": "Xã Đồng Phúc", "type": "Xã" } ] }, { "level2_id": "062", "name": "Huyện Ngân Sơn", "type": "Huyện", "level3s": [ { "level3_id": "01936", "name": "Thị trấn Nà Phặc", "type": "Thị trấn" }, { "level3_id": "01939", "name": "Xã Thượng Ân", "type": "Xã" }, { "level3_id": "01942", "name": "Xã Bằng Vân", "type": "Xã" }, { "level3_id": "01945", "name": "Xã Cốc Đán", "type": "Xã" }, { "level3_id": "01948", "name": "Xã Trung Hoà", "type": "Xã" }, { "level3_id": "01951", "name": "Xã Đức Vân", "type": "Xã" }, { "level3_id": "01954", "name": "Thị trấn Vân Tùng", "type": "Thị trấn" }, { "level3_id": "01957", "name": "Xã Thượng Quan", "type": "Xã" }, { "level3_id": "01960", "name": "Xã Hiệp Lực", "type": "Xã" }, { "level3_id": "01963", "name": "Xã Thuần Mang", "type": "Xã" } ] }, { "level2_id": "063", "name": "Huyện Bạch Thông", "type": "Huyện", "level3s": [ { "level3_id": "01969", "name": "Thị trấn Phủ Thông", "type": "Thị trấn" }, { "level3_id": "01975", "name": "Xã Vi Hương", "type": "Xã" }, { "level3_id": "01978", "name": "Xã Sĩ Bình", "type": "Xã" }, { "level3_id": "01981", "name": "Xã Vũ Muộn", "type": "Xã" }, { "level3_id": "01984", "name": "Xã Đôn Phong", "type": "Xã" }, { "level3_id": "01990", "name": "Xã Lục Bình", "type": "Xã" }, { "level3_id": "01993", "name": "Xã Tân Tú", "type": "Xã" }, { "level3_id": "01999", "name": "Xã Nguyên Phúc", "type": "Xã" }, { "level3_id": "02002", "name": "Xã Cao Sơn", "type": "Xã" }, { "level3_id": "02005", "name": "Xã Quân Hà", "type": "Xã" }, { "level3_id": "02008", "name": "Xã Cẩm Giàng", "type": "Xã" }, { "level3_id": "02011", "name": "Xã Mỹ Thanh", "type": "Xã" }, { "level3_id": "02014", "name": "Xã Dương Phong", "type": "Xã" }, { "level3_id": "02017", "name": "Xã Quang Thuận", "type": "Xã" } ] }, { "level2_id": "064", "name": "Huyện Chợ Đồn", "type": "Huyện", "level3s": [ { "level3_id": "02020", "name": "Thị trấn Bằng Lũng", "type": "Thị trấn" }, { "level3_id": "02023", "name": "Xã Xuân Lạc", "type": "Xã" }, { "level3_id": "02026", "name": "Xã Nam Cường", "type": "Xã" }, { "level3_id": "02029", "name": "Xã Đồng Lạc", "type": "Xã" }, { "level3_id": "02032", "name": "Xã Tân Lập", "type": "Xã" }, { "level3_id": "02035", "name": "Xã Bản Thi", "type": "Xã" }, { "level3_id": "02038", "name": "Xã Quảng Bạch", "type": "Xã" }, { "level3_id": "02041", "name": "Xã Bằng Phúc", "type": "Xã" }, { "level3_id": "02044", "name": "Xã Yên Thịnh", "type": "Xã" }, { "level3_id": "02047", "name": "Xã Yên Thượng", "type": "Xã" }, { "level3_id": "02050", "name": "Xã Phương Viên", "type": "Xã" }, { "level3_id": "02053", "name": "Xã Ngọc Phái", "type": "Xã" }, { "level3_id": "02059", "name": "Xã Đồng Thắng", "type": "Xã" }, { "level3_id": "02062", "name": "Xã Lương Bằng", "type": "Xã" }, { "level3_id": "02065", "name": "Xã Bằng Lãng", "type": "Xã" }, { "level3_id": "02068", "name": "Xã Đại Sảo", "type": "Xã" }, { "level3_id": "02071", "name": "Xã Nghĩa Tá", "type": "Xã" }, { "level3_id": "02077", "name": "Xã Yên Mỹ", "type": "Xã" }, { "level3_id": "02080", "name": "Xã Bình Trung", "type": "Xã" }, { "level3_id": "02083", "name": "Xã Yên Phong", "type": "Xã" } ] }, { "level2_id": "065", "name": "Huyện Chợ Mới", "type": "Huyện", "level3s": [ { "level3_id": "02086", "name": "Thị trấn Đồng Tâm", "type": "Thị trấn" }, { "level3_id": "02089", "name": "Xã Tân Sơn", "type": "Xã" }, { "level3_id": "02092", "name": "Xã Thanh Vận", "type": "Xã" }, { "level3_id": "02095", "name": "Xã Mai Lạp", "type": "Xã" }, { "level3_id": "02098", "name": "Xã Hoà Mục", "type": "Xã" }, { "level3_id": "02101", "name": "Xã Thanh Mai", "type": "Xã" }, { "level3_id": "02104", "name": "Xã Cao Kỳ", "type": "Xã" }, { "level3_id": "02107", "name": "Xã Nông Hạ", "type": "Xã" }, { "level3_id": "02110", "name": "Xã Yên Cư", "type": "Xã" }, { "level3_id": "02113", "name": "Xã Thanh Thịnh", "type": "Xã" }, { "level3_id": "02116", "name": "Xã Yên Hân", "type": "Xã" }, { "level3_id": "02122", "name": "Xã Như Cố", "type": "Xã" }, { "level3_id": "02125", "name": "Xã Bình Văn", "type": "Xã" }, { "level3_id": "02131", "name": "Xã Quảng Chu", "type": "Xã" } ] }, { "level2_id": "066", "name": "Huyện Na Rì", "type": "Huyện", "level3s": [ { "level3_id": "02137", "name": "Xã Văn Vũ", "type": "Xã" }, { "level3_id": "02140", "name": "Xã Văn Lang", "type": "Xã" }, { "level3_id": "02143", "name": "Xã Lương Thượng", "type": "Xã" }, { "level3_id": "02146", "name": "Xã Kim Hỷ", "type": "Xã" }, { "level3_id": "02152", "name": "Xã Cường Lợi", "type": "Xã" }, { "level3_id": "02155", "name": "Thị trấn Yến Lạc", "type": "Thị trấn" }, { "level3_id": "02158", "name": "Xã Kim Lư", "type": "Xã" }, { "level3_id": "02161", "name": "Xã Sơn Thành", "type": "Xã" }, { "level3_id": "02170", "name": "Xã Văn Minh", "type": "Xã" }, { "level3_id": "02173", "name": "Xã Côn Minh", "type": "Xã" }, { "level3_id": "02176", "name": "Xã Cư Lễ", "type": "Xã" }, { "level3_id": "02179", "name": "Xã Trần Phú", "type": "Xã" }, { "level3_id": "02185", "name": "Xã Quang Phong", "type": "Xã" }, { "level3_id": "02188", "name": "Xã Dương Sơn", "type": "Xã" }, { "level3_id": "02191", "name": "Xã Xuân Dương", "type": "Xã" }, { "level3_id": "02194", "name": "Xã Đổng Xá", "type": "Xã" }, { "level3_id": "02197", "name": "Xã Liêm Thuỷ", "type": "Xã" } ] } ] }, { "level1_id": "08", "name": "Tỉnh Tuyên Quang", "type": "Tỉnh", "level2s": [ { "level2_id": "070", "name": "Thành phố Tuyên Quang", "type": "Thành phố", "level3s": [ { "level3_id": "02200", "name": "Phường Phan Thiết", "type": "Phường" }, { "level3_id": "02203", "name": "Phường Minh Xuân", "type": "Phường" }, { "level3_id": "02206", "name": "Phường Tân Quang", "type": "Phường" }, { "level3_id": "02209", "name": "Xã Tràng Đà", "type": "Xã" }, { "level3_id": "02212", "name": "Phường Nông Tiến", "type": "Phường" }, { "level3_id": "02215", "name": "Phường Ỷ La", "type": "Phường" }, { "level3_id": "02216", "name": "Phường Tân Hà", "type": "Phường" }, { "level3_id": "02218", "name": "Phường Hưng Thành", "type": "Phường" }, { "level3_id": "02497", "name": "Xã Kim Phú", "type": "Xã" }, { "level3_id": "02503", "name": "Xã An Khang", "type": "Xã" }, { "level3_id": "02509", "name": "Phường Mỹ Lâm", "type": "Phường" }, { "level3_id": "02512", "name": "Phường An Tường", "type": "Phường" }, { "level3_id": "02515", "name": "Xã Lưỡng Vượng", "type": "Xã" }, { "level3_id": "02521", "name": "Xã Thái Long", "type": "Xã" }, { "level3_id": "02524", "name": "Phường Đội Cấn", "type": "Phường" } ] }, { "level2_id": "071", "name": "Huyện Lâm Bình", "type": "Huyện", "level3s": [ { "level3_id": "02233", "name": "Xã Phúc Yên", "type": "Xã" }, { "level3_id": "02242", "name": "Xã Xuân Lập", "type": "Xã" }, { "level3_id": "02251", "name": "Xã Khuôn Hà", "type": "Xã" }, { "level3_id": "02266", "name": "Thị trấn Lăng Can", "type": "Thị trấn" }, { "level3_id": "02269", "name": "Xã Thượng Lâm", "type": "Xã" }, { "level3_id": "02290", "name": "Xã Bình An", "type": "Xã" }, { "level3_id": "02293", "name": "Xã Hồng Quang", "type": "Xã" }, { "level3_id": "02296", "name": "Xã Thổ Bình", "type": "Xã" }, { "level3_id": "02299", "name": "Xã Phúc Sơn", "type": "Xã" }, { "level3_id": "02302", "name": "Xã Minh Quang", "type": "Xã" } ] }, { "level2_id": "072", "name": "Huyện Na Hang", "type": "Huyện", "level3s": [ { "level3_id": "02221", "name": "Thị trấn Na Hang", "type": "Thị trấn" }, { "level3_id": "02227", "name": "Xã Sinh Long", "type": "Xã" }, { "level3_id": "02230", "name": "Xã Thượng Giáp", "type": "Xã" }, { "level3_id": "02239", "name": "Xã Thượng Nông", "type": "Xã" }, { "level3_id": "02245", "name": "Xã Côn Lôn", "type": "Xã" }, { "level3_id": "02248", "name": "Xã Yên Hoa", "type": "Xã" }, { "level3_id": "02254", "name": "Xã Hồng Thái", "type": "Xã" }, { "level3_id": "02260", "name": "Xã Đà Vị", "type": "Xã" }, { "level3_id": "02263", "name": "Xã Khau Tinh", "type": "Xã" }, { "level3_id": "02275", "name": "Xã Sơn Phú", "type": "Xã" }, { "level3_id": "02281", "name": "Xã Năng Khả", "type": "Xã" }, { "level3_id": "02284", "name": "Xã Thanh Tương", "type": "Xã" } ] }, { "level2_id": "073", "name": "Huyện Chiêm Hóa", "type": "Huyện", "level3s": [ { "level3_id": "02287", "name": "Thị trấn Vĩnh Lộc", "type": "Thị trấn" }, { "level3_id": "02305", "name": "Xã Trung Hà", "type": "Xã" }, { "level3_id": "02308", "name": "Xã Tân Mỹ", "type": "Xã" }, { "level3_id": "02311", "name": "Xã Hà Lang", "type": "Xã" }, { "level3_id": "02314", "name": "Xã Hùng Mỹ", "type": "Xã" }, { "level3_id": "02317", "name": "Xã Yên Lập", "type": "Xã" }, { "level3_id": "02320", "name": "Xã Tân An", "type": "Xã" }, { "level3_id": "02323", "name": "Xã Bình Phú", "type": "Xã" }, { "level3_id": "02326", "name": "Xã Xuân Quang", "type": "Xã" }, { "level3_id": "02329", "name": "Xã Ngọc Hội", "type": "Xã" }, { "level3_id": "02332", "name": "Xã Phú Bình", "type": "Xã" }, { "level3_id": "02335", "name": "Xã Hòa Phú", "type": "Xã" }, { "level3_id": "02338", "name": "Xã Phúc Thịnh", "type": "Xã" }, { "level3_id": "02341", "name": "Xã Kiên Đài", "type": "Xã" }, { "level3_id": "02344", "name": "Xã Tân Thịnh", "type": "Xã" }, { "level3_id": "02347", "name": "Xã Trung Hòa", "type": "Xã" }, { "level3_id": "02350", "name": "Xã Kim Bình", "type": "Xã" }, { "level3_id": "02353", "name": "Xã Hòa An", "type": "Xã" }, { "level3_id": "02356", "name": "Xã Vinh Quang", "type": "Xã" }, { "level3_id": "02359", "name": "Xã Tri Phú", "type": "Xã" }, { "level3_id": "02362", "name": "Xã Nhân Lý", "type": "Xã" }, { "level3_id": "02365", "name": "Xã Yên Nguyên", "type": "Xã" }, { "level3_id": "02368", "name": "Xã Linh Phú", "type": "Xã" }, { "level3_id": "02371", "name": "Xã Bình Nhân", "type": "Xã" } ] }, { "level2_id": "074", "name": "Huyện Hàm Yên", "type": "Huyện", "level3s": [ { "level3_id": "02374", "name": "Thị trấn Tân Yên", "type": "Thị trấn" }, { "level3_id": "02377", "name": "Xã Yên Thuận", "type": "Xã" }, { "level3_id": "02380", "name": "Xã Bạch Xa", "type": "Xã" }, { "level3_id": "02383", "name": "Xã Minh Khương", "type": "Xã" }, { "level3_id": "02386", "name": "Xã Yên Lâm", "type": "Xã" }, { "level3_id": "02389", "name": "Xã Minh Dân", "type": "Xã" }, { "level3_id": "02392", "name": "Xã Phù Lưu", "type": "Xã" }, { "level3_id": "02395", "name": "Xã Minh Hương", "type": "Xã" }, { "level3_id": "02398", "name": "Xã Yên Phú", "type": "Xã" }, { "level3_id": "02401", "name": "Xã Tân Thành", "type": "Xã" }, { "level3_id": "02404", "name": "Xã Bình Xa", "type": "Xã" }, { "level3_id": "02407", "name": "Xã Thái Sơn", "type": "Xã" }, { "level3_id": "02410", "name": "Xã Nhân Mục", "type": "Xã" }, { "level3_id": "02413", "name": "Xã Thành Long", "type": "Xã" }, { "level3_id": "02416", "name": "Xã Bằng Cốc", "type": "Xã" }, { "level3_id": "02419", "name": "Xã Thái Hòa", "type": "Xã" }, { "level3_id": "02422", "name": "Xã Đức Ninh", "type": "Xã" }, { "level3_id": "02425", "name": "Xã Hùng Đức", "type": "Xã" } ] }, { "level2_id": "075", "name": "Huyện Yên Sơn", "type": "Huyện", "level3s": [ { "level3_id": "02431", "name": "Xã Quí Quân", "type": "Xã" }, { "level3_id": "02434", "name": "Xã Lực Hành", "type": "Xã" }, { "level3_id": "02437", "name": "Xã Kiến Thiết", "type": "Xã" }, { "level3_id": "02440", "name": "Xã Trung Minh", "type": "Xã" }, { "level3_id": "02443", "name": "Xã Chiêu Yên", "type": "Xã" }, { "level3_id": "02446", "name": "Xã Trung Trực", "type": "Xã" }, { "level3_id": "02449", "name": "Xã Xuân Vân", "type": "Xã" }, { "level3_id": "02452", "name": "Xã Phúc Ninh", "type": "Xã" }, { "level3_id": "02455", "name": "Xã Hùng Lợi", "type": "Xã" }, { "level3_id": "02458", "name": "Xã Trung Sơn", "type": "Xã" }, { "level3_id": "02461", "name": "Xã Tân Tiến", "type": "Xã" }, { "level3_id": "02464", "name": "Xã Tứ Quận", "type": "Xã" }, { "level3_id": "02467", "name": "Xã Đạo Viện", "type": "Xã" }, { "level3_id": "02470", "name": "Xã Tân Long", "type": "Xã" }, { "level3_id": "02473", "name": "Thị trấn Yên Sơn", "type": "Thị trấn" }, { "level3_id": "02476", "name": "Xã Kim Quan", "type": "Xã" }, { "level3_id": "02479", "name": "Xã Lang Quán", "type": "Xã" }, { "level3_id": "02482", "name": "Xã Phú Thịnh", "type": "Xã" }, { "level3_id": "02485", "name": "Xã Công Đa", "type": "Xã" }, { "level3_id": "02488", "name": "Xã Trung Môn", "type": "Xã" }, { "level3_id": "02491", "name": "Xã Chân Sơn", "type": "Xã" }, { "level3_id": "02494", "name": "Xã Thái Bình", "type": "Xã" }, { "level3_id": "02500", "name": "Xã Tiến Bộ", "type": "Xã" }, { "level3_id": "02506", "name": "Xã Mỹ Bằng", "type": "Xã" }, { "level3_id": "02518", "name": "Xã Hoàng Khai", "type": "Xã" }, { "level3_id": "02527", "name": "Xã Nhữ Hán", "type": "Xã" }, { "level3_id": "02530", "name": "Xã Nhữ Khê", "type": "Xã" }, { "level3_id": "02533", "name": "Xã Đội Bình", "type": "Xã" } ] }, { "level2_id": "076", "name": "Huyện Sơn Dương", "type": "Huyện", "level3s": [ { "level3_id": "02536", "name": "Thị trấn Sơn Dương", "type": "Thị trấn" }, { "level3_id": "02539", "name": "Xã Trung Yên", "type": "Xã" }, { "level3_id": "02542", "name": "Xã Minh Thanh", "type": "Xã" }, { "level3_id": "02545", "name": "Xã Tân Trào", "type": "Xã" }, { "level3_id": "02548", "name": "Xã Vĩnh Lợi", "type": "Xã" }, { "level3_id": "02551", "name": "Xã Thượng Ấm", "type": "Xã" }, { "level3_id": "02554", "name": "Xã Bình Yên", "type": "Xã" }, { "level3_id": "02557", "name": "Xã Lương Thiện", "type": "Xã" }, { "level3_id": "02560", "name": "Xã Tú Thịnh", "type": "Xã" }, { "level3_id": "02563", "name": "Xã Cấp Tiến", "type": "Xã" }, { "level3_id": "02566", "name": "Xã Hợp Thành", "type": "Xã" }, { "level3_id": "02569", "name": "Xã Phúc Ứng", "type": "Xã" }, { "level3_id": "02572", "name": "Xã Đông Thọ", "type": "Xã" }, { "level3_id": "02575", "name": "Xã Kháng Nhật", "type": "Xã" }, { "level3_id": "02578", "name": "Xã Hợp Hòa", "type": "Xã" }, { "level3_id": "02584", "name": "Xã Quyết Thắng", "type": "Xã" }, { "level3_id": "02587", "name": "Xã Đồng Quý", "type": "Xã" }, { "level3_id": "02590", "name": "Xã Tân Thanh", "type": "Xã" }, { "level3_id": "02596", "name": "Xã Văn Phú", "type": "Xã" }, { "level3_id": "02599", "name": "Xã Chi Thiết", "type": "Xã" }, { "level3_id": "02602", "name": "Xã Đông Lợi", "type": "Xã" }, { "level3_id": "02605", "name": "Xã Thiện Kế", "type": "Xã" }, { "level3_id": "02608", "name": "Xã Hồng Sơn", "type": "Xã" }, { "level3_id": "02611", "name": "Xã Phú Lương", "type": "Xã" }, { "level3_id": "02614", "name": "Xã Ninh Lai", "type": "Xã" }, { "level3_id": "02617", "name": "Xã Đại Phú", "type": "Xã" }, { "level3_id": "02620", "name": "Xã Sơn Nam", "type": "Xã" }, { "level3_id": "02623", "name": "Xã Hào Phú", "type": "Xã" }, { "level3_id": "02626", "name": "Xã Tam Đa", "type": "Xã" }, { "level3_id": "02632", "name": "Xã Trường Sinh", "type": "Xã" } ] } ] }, { "level1_id": "10", "name": "Tỉnh Lào Cai", "type": "Tỉnh", "level2s": [ { "level2_id": "080", "name": "Thành phố Lào Cai", "type": "Thành phố", "level3s": [ { "level3_id": "02635", "name": "Phường Duyên Hải", "type": "Phường" }, { "level3_id": "02641", "name": "Phường Lào Cai", "type": "Phường" }, { "level3_id": "02644", "name": "Phường Cốc Lếu", "type": "Phường" }, { "level3_id": "02647", "name": "Phường Kim Tân", "type": "Phường" }, { "level3_id": "02650", "name": "Phường Bắc Lệnh", "type": "Phường" }, { "level3_id": "02653", "name": "Phường Pom Hán", "type": "Phường" }, { "level3_id": "02656", "name": "Phường Xuân Tăng", "type": "Phường" }, { "level3_id": "02658", "name": "Phường Bình Minh", "type": "Phường" }, { "level3_id": "02659", "name": "Xã Thống Nhất", "type": "Xã" }, { "level3_id": "02662", "name": "Xã Đồng Tuyển", "type": "Xã" }, { "level3_id": "02665", "name": "Xã Vạn Hoà", "type": "Xã" }, { "level3_id": "02668", "name": "Phường Bắc Cường", "type": "Phường" }, { "level3_id": "02671", "name": "Phường Nam Cường", "type": "Phường" }, { "level3_id": "02674", "name": "Xã Cam Đường", "type": "Xã" }, { "level3_id": "02677", "name": "Xã Tả Phời", "type": "Xã" }, { "level3_id": "02680", "name": "Xã Hợp Thành", "type": "Xã" }, { "level3_id": "02746", "name": "Xã Cốc San", "type": "Xã" } ] }, { "level2_id": "082", "name": "Huyện Bát Xát", "type": "Huyện", "level3s": [ { "level3_id": "02683", "name": "Thị trấn Bát Xát", "type": "Thị trấn" }, { "level3_id": "02686", "name": "Xã A Mú Sung", "type": "Xã" }, { "level3_id": "02689", "name": "Xã Nậm Chạc", "type": "Xã" }, { "level3_id": "02692", "name": "Xã A Lù", "type": "Xã" }, { "level3_id": "02695", "name": "Xã Trịnh Tường", "type": "Xã" }, { "level3_id": "02701", "name": "Xã Y Tý", "type": "Xã" }, { "level3_id": "02704", "name": "Xã Cốc Mỳ", "type": "Xã" }, { "level3_id": "02707", "name": "Xã Dền Sáng", "type": "Xã" }, { "level3_id": "02710", "name": "Xã Bản Vược", "type": "Xã" }, { "level3_id": "02713", "name": "Xã Sàng Ma Sáo", "type": "Xã" }, { "level3_id": "02716", "name": "Xã Bản Qua", "type": "Xã" }, { "level3_id": "02719", "name": "Xã Mường Vi", "type": "Xã" }, { "level3_id": "02722", "name": "Xã Dền Thàng", "type": "Xã" }, { "level3_id": "02725", "name": "Xã Bản Xèo", "type": "Xã" }, { "level3_id": "02728", "name": "Xã Mường Hum", "type": "Xã" }, { "level3_id": "02731", "name": "Xã Trung Lèng Hồ", "type": "Xã" }, { "level3_id": "02734", "name": "Xã Quang Kim", "type": "Xã" }, { "level3_id": "02737", "name": "Xã Pa Cheo", "type": "Xã" }, { "level3_id": "02740", "name": "Xã Nậm Pung", "type": "Xã" }, { "level3_id": "02743", "name": "Xã Phìn Ngan", "type": "Xã" }, { "level3_id": "02749", "name": "Xã Tòng Sành", "type": "Xã" } ] }, { "level2_id": "083", "name": "Huyện Mường Khương", "type": "Huyện", "level3s": [ { "level3_id": "02752", "name": "Xã Pha Long", "type": "Xã" }, { "level3_id": "02755", "name": "Xã Tả Ngải Chồ", "type": "Xã" }, { "level3_id": "02758", "name": "Xã Tung Chung Phố", "type": "Xã" }, { "level3_id": "02761", "name": "Thị trấn Mường Khương", "type": "Thị trấn" }, { "level3_id": "02764", "name": "Xã Dìn Chin", "type": "Xã" }, { "level3_id": "02767", "name": "Xã Tả Gia Khâu", "type": "Xã" }, { "level3_id": "02770", "name": "Xã Nậm Chảy", "type": "Xã" }, { "level3_id": "02773", "name": "Xã Nấm Lư", "type": "Xã" }, { "level3_id": "02776", "name": "Xã Lùng Khấu Nhin", "type": "Xã" }, { "level3_id": "02779", "name": "Xã Thanh Bình", "type": "Xã" }, { "level3_id": "02782", "name": "Xã Cao Sơn", "type": "Xã" }, { "level3_id": "02785", "name": "Xã Lùng Vai", "type": "Xã" }, { "level3_id": "02788", "name": "Xã Bản Lầu", "type": "Xã" }, { "level3_id": "02791", "name": "Xã La Pan Tẩn", "type": "Xã" }, { "level3_id": "02794", "name": "Xã Tả Thàng", "type": "Xã" }, { "level3_id": "02797", "name": "Xã Bản Sen", "type": "Xã" } ] }, { "level2_id": "084", "name": "Huyện Si Ma Cai", "type": "Huyện", "level3s": [ { "level3_id": "02800", "name": "Xã Nàn Sán", "type": "Xã" }, { "level3_id": "02803", "name": "Xã Thào Chư Phìn", "type": "Xã" }, { "level3_id": "02806", "name": "Xã Bản Mế", "type": "Xã" }, { "level3_id": "02809", "name": "Thị trấn Si Ma Cai", "type": "Thị trấn" }, { "level3_id": "02812", "name": "Xã Sán Chải", "type": "Xã" }, { "level3_id": "02818", "name": "Xã Lùng Thẩn", "type": "Xã" }, { "level3_id": "02821", "name": "Xã Cán Cấu", "type": "Xã" }, { "level3_id": "02824", "name": "Xã Sín Chéng", "type": "Xã" }, { "level3_id": "02827", "name": "Xã Quan Hồ Thẩn", "type": "Xã" }, { "level3_id": "02836", "name": "Xã Nàn Xín", "type": "Xã" } ] }, { "level2_id": "085", "name": "Huyện Bắc Hà", "type": "Huyện", "level3s": [ { "level3_id": "02839", "name": "Thị trấn Bắc Hà", "type": "Thị trấn" }, { "level3_id": "02842", "name": "Xã Lùng Cải", "type": "Xã" }, { "level3_id": "02848", "name": "Xã Lùng Phình", "type": "Xã" }, { "level3_id": "02851", "name": "Xã Tả Van Chư", "type": "Xã" }, { "level3_id": "02854", "name": "Xã Tả Củ Tỷ", "type": "Xã" }, { "level3_id": "02857", "name": "Xã Thải Giàng Phố", "type": "Xã" }, { "level3_id": "02863", "name": "Xã Hoàng Thu Phố", "type": "Xã" }, { "level3_id": "02866", "name": "Xã Bản Phố", "type": "Xã" }, { "level3_id": "02869", "name": "Xã Bản Liền", "type": "Xã" }, { "level3_id": "02875", "name": "Xã Na Hối", "type": "Xã" }, { "level3_id": "02878", "name": "Xã Cốc Ly", "type": "Xã" }, { "level3_id": "02881", "name": "Xã Nậm Mòn", "type": "Xã" }, { "level3_id": "02884", "name": "Xã Nậm Đét", "type": "Xã" }, { "level3_id": "02887", "name": "Xã Nậm Khánh", "type": "Xã" }, { "level3_id": "02890", "name": "Xã Bảo Nhai", "type": "Xã" }, { "level3_id": "02893", "name": "Xã Nậm Lúc", "type": "Xã" }, { "level3_id": "02896", "name": "Xã Cốc Lầu", "type": "Xã" }, { "level3_id": "02899", "name": "Xã Bản Cái", "type": "Xã" } ] }, { "level2_id": "086", "name": "Huyện Bảo Thắng", "type": "Huyện", "level3s": [ { "level3_id": "02902", "name": "Thị trấn N.T Phong Hải", "type": "Thị trấn" }, { "level3_id": "02905", "name": "Thị trấn Phố Lu", "type": "Thị trấn" }, { "level3_id": "02908", "name": "Thị trấn Tằng Loỏng", "type": "Thị trấn" }, { "level3_id": "02911", "name": "Xã Bản Phiệt", "type": "Xã" }, { "level3_id": "02914", "name": "Xã Bản Cầm", "type": "Xã" }, { "level3_id": "02917", "name": "Xã Thái Niên", "type": "Xã" }, { "level3_id": "02920", "name": "Xã Phong Niên", "type": "Xã" }, { "level3_id": "02923", "name": "Xã Gia Phú", "type": "Xã" }, { "level3_id": "02926", "name": "Xã Xuân Quang", "type": "Xã" }, { "level3_id": "02929", "name": "Xã Sơn Hải", "type": "Xã" }, { "level3_id": "02932", "name": "Xã Xuân Giao", "type": "Xã" }, { "level3_id": "02935", "name": "Xã Trì Quang", "type": "Xã" }, { "level3_id": "02938", "name": "Xã Sơn Hà", "type": "Xã" }, { "level3_id": "02944", "name": "Xã Phú Nhuận", "type": "Xã" } ] }, { "level2_id": "087", "name": "Huyện Bảo Yên", "type": "Huyện", "level3s": [ { "level3_id": "02947", "name": "Thị trấn Phố Ràng", "type": "Thị trấn" }, { "level3_id": "02950", "name": "Xã Tân Tiến", "type": "Xã" }, { "level3_id": "02953", "name": "Xã Nghĩa Đô", "type": "Xã" }, { "level3_id": "02956", "name": "Xã Vĩnh Yên", "type": "Xã" }, { "level3_id": "02959", "name": "Xã Điện Quan", "type": "Xã" }, { "level3_id": "02962", "name": "Xã Xuân Hoà", "type": "Xã" }, { "level3_id": "02965", "name": "Xã Tân Dương", "type": "Xã" }, { "level3_id": "02968", "name": "Xã Thượng Hà", "type": "Xã" }, { "level3_id": "02971", "name": "Xã Kim Sơn", "type": "Xã" }, { "level3_id": "02974", "name": "Xã Cam Cọn", "type": "Xã" }, { "level3_id": "02977", "name": "Xã Minh Tân", "type": "Xã" }, { "level3_id": "02980", "name": "Xã Xuân Thượng", "type": "Xã" }, { "level3_id": "02983", "name": "Xã Việt Tiến", "type": "Xã" }, { "level3_id": "02986", "name": "Xã Yên Sơn", "type": "Xã" }, { "level3_id": "02989", "name": "Xã Bảo Hà", "type": "Xã" }, { "level3_id": "02992", "name": "Xã Lương Sơn", "type": "Xã" }, { "level3_id": "02998", "name": "Xã Phúc Khánh", "type": "Xã" } ] }, { "level2_id": "088", "name": "Thị xã Sa Pa", "type": "Thị xã", "level3s": [ { "level3_id": "03001", "name": "Phường Sa Pa", "type": "Phường" }, { "level3_id": "03002", "name": "Phường Sa Pả", "type": "Phường" }, { "level3_id": "03003", "name": "Phường Ô Quý Hồ", "type": "Phường" }, { "level3_id": "03004", "name": "Xã Ngũ Chỉ Sơn", "type": "Xã" }, { "level3_id": "03006", "name": "Phường Phan Si Păng", "type": "Phường" }, { "level3_id": "03010", "name": "Xã Trung Chải", "type": "Xã" }, { "level3_id": "03013", "name": "Xã Tả Phìn", "type": "Xã" }, { "level3_id": "03016", "name": "Phường Hàm Rồng", "type": "Phường" }, { "level3_id": "03019", "name": "Xã Hoàng Liên", "type": "Xã" }, { "level3_id": "03022", "name": "Xã Thanh Bình", "type": "Xã" }, { "level3_id": "03028", "name": "Phường Cầu Mây", "type": "Phường" }, { "level3_id": "03037", "name": "Xã Mường Hoa", "type": "Xã" }, { "level3_id": "03040", "name": "Xã Tả Van", "type": "Xã" }, { "level3_id": "03043", "name": "Xã Mường Bo", "type": "Xã" }, { "level3_id": "03046", "name": "Xã Bản Hồ", "type": "Xã" }, { "level3_id": "03052", "name": "Xã Liên Minh", "type": "Xã" } ] }, { "level2_id": "089", "name": "Huyện Văn Bàn", "type": "Huyện", "level3s": [ { "level3_id": "03055", "name": "Thị trấn Khánh Yên", "type": "Thị trấn" }, { "level3_id": "03061", "name": "Xã Võ Lao", "type": "Xã" }, { "level3_id": "03064", "name": "Xã Sơn Thuỷ", "type": "Xã" }, { "level3_id": "03067", "name": "Xã Nậm Mả", "type": "Xã" }, { "level3_id": "03070", "name": "Xã Tân Thượng", "type": "Xã" }, { "level3_id": "03073", "name": "Xã Nậm Rạng", "type": "Xã" }, { "level3_id": "03076", "name": "Xã Nậm Chầy", "type": "Xã" }, { "level3_id": "03079", "name": "Xã Tân An", "type": "Xã" }, { "level3_id": "03082", "name": "Xã Khánh Yên Thượng", "type": "Xã" }, { "level3_id": "03085", "name": "Xã Nậm Xé", "type": "Xã" }, { "level3_id": "03088", "name": "Xã Dần Thàng", "type": "Xã" }, { "level3_id": "03091", "name": "Xã Chiềng Ken", "type": "Xã" }, { "level3_id": "03094", "name": "Xã Làng Giàng", "type": "Xã" }, { "level3_id": "03097", "name": "Xã Hoà Mạc", "type": "Xã" }, { "level3_id": "03100", "name": "Xã Khánh Yên Trung", "type": "Xã" }, { "level3_id": "03103", "name": "Xã Khánh Yên Hạ", "type": "Xã" }, { "level3_id": "03106", "name": "Xã Dương Quỳ", "type": "Xã" }, { "level3_id": "03109", "name": "Xã Nậm Tha", "type": "Xã" }, { "level3_id": "03112", "name": "Xã Minh Lương", "type": "Xã" }, { "level3_id": "03115", "name": "Xã Thẩm Dương", "type": "Xã" }, { "level3_id": "03118", "name": "Xã Liêm Phú", "type": "Xã" }, { "level3_id": "03121", "name": "Xã Nậm Xây", "type": "Xã" } ] } ] }, { "level1_id": "11", "name": "Tỉnh Điện Biên", "type": "Tỉnh", "level2s": [ { "level2_id": "094", "name": "Thành phố Điện Biên Phủ", "type": "Thành phố", "level3s": [ { "level3_id": "03124", "name": "Phường Noong Bua", "type": "Phường" }, { "level3_id": "03127", "name": "Phường Him Lam", "type": "Phường" }, { "level3_id": "03130", "name": "Phường Thanh Bình", "type": "Phường" }, { "level3_id": "03133", "name": "Phường Tân Thanh", "type": "Phường" }, { "level3_id": "03136", "name": "Phường Mường Thanh", "type": "Phường" }, { "level3_id": "03139", "name": "Phường Nam Thanh", "type": "Phường" }, { "level3_id": "03142", "name": "Phường Thanh Trường", "type": "Phường" }, { "level3_id": "03145", "name": "Xã Thanh Minh", "type": "Xã" }, { "level3_id": "03316", "name": "Xã Nà Tấu", "type": "Xã" }, { "level3_id": "03317", "name": "Xã Nà Nhạn", "type": "Xã" }, { "level3_id": "03325", "name": "Xã Mường Phăng", "type": "Xã" }, { "level3_id": "03326", "name": "Xã Pá Khoang", "type": "Xã" } ] }, { "level2_id": "095", "name": "Thị Xã Mường Lay", "type": "Thị xã", "level3s": [ { "level3_id": "03148", "name": "Phường Sông Đà", "type": "Phường" }, { "level3_id": "03151", "name": "Phường Na Lay", "type": "Phường" }, { "level3_id": "03184", "name": "Xã Lay Nưa", "type": "Xã" } ] }, { "level2_id": "096", "name": "Huyện Mường Nhé", "type": "Huyện", "level3s": [ { "level3_id": "03154", "name": "Xã Sín Thầu", "type": "Xã" }, { "level3_id": "03155", "name": "Xã Sen Thượng", "type": "Xã" }, { "level3_id": "03157", "name": "Xã Chung Chải", "type": "Xã" }, { "level3_id": "03158", "name": "Xã Leng Su Sìn", "type": "Xã" }, { "level3_id": "03159", "name": "Xã Pá Mỳ", "type": "Xã" }, { "level3_id": "03160", "name": "Xã Mường Nhé", "type": "Xã" }, { "level3_id": "03161", "name": "Xã Nậm Vì", "type": "Xã" }, { "level3_id": "03162", "name": "Xã Nậm Kè", "type": "Xã" }, { "level3_id": "03163", "name": "Xã Mường Toong", "type": "Xã" }, { "level3_id": "03164", "name": "Xã Quảng Lâm", "type": "Xã" }, { "level3_id": "03177", "name": "Xã Huổi Lếnh", "type": "Xã" } ] }, { "level2_id": "097", "name": "Huyện Mường Chà", "type": "Huyện", "level3s": [ { "level3_id": "03172", "name": "Thị Trấn Mường Chà", "type": "Thị trấn" }, { "level3_id": "03178", "name": "Xã Xá Tổng", "type": "Xã" }, { "level3_id": "03181", "name": "Xã Mường Tùng", "type": "Xã" }, { "level3_id": "03190", "name": "Xã Hừa Ngài", "type": "Xã" }, { "level3_id": "03191", "name": "Xã Huổi Mí", "type": "Xã" }, { "level3_id": "03193", "name": "Xã Pa Ham", "type": "Xã" }, { "level3_id": "03194", "name": "Xã Nậm Nèn", "type": "Xã" }, { "level3_id": "03196", "name": "Xã Huổi Lèng", "type": "Xã" }, { "level3_id": "03197", "name": "Xã Sa Lông", "type": "Xã" }, { "level3_id": "03200", "name": "Xã Ma Thì Hồ", "type": "Xã" }, { "level3_id": "03201", "name": "Xã Na Sang", "type": "Xã" }, { "level3_id": "03202", "name": "Xã Mường Mươn", "type": "Xã" } ] }, { "level2_id": "098", "name": "Huyện Tủa Chùa", "type": "Huyện", "level3s": [ { "level3_id": "03217", "name": "Thị trấn Tủa Chùa", "type": "Thị trấn" }, { "level3_id": "03220", "name": "Xã Huổi Só", "type": "Xã" }, { "level3_id": "03223", "name": "Xã Xín Chải", "type": "Xã" }, { "level3_id": "03226", "name": "Xã Tả Sìn Thàng", "type": "Xã" }, { "level3_id": "03229", "name": "Xã Lao Xả Phình", "type": "Xã" }, { "level3_id": "03232", "name": "Xã Tả Phìn", "type": "Xã" }, { "level3_id": "03235", "name": "Xã Tủa Thàng", "type": "Xã" }, { "level3_id": "03238", "name": "Xã Trung Thu", "type": "Xã" }, { "level3_id": "03241", "name": "Xã Sính Phình", "type": "Xã" }, { "level3_id": "03244", "name": "Xã Sáng Nhè", "type": "Xã" }, { "level3_id": "03247", "name": "Xã Mường Đun", "type": "Xã" }, { "level3_id": "03250", "name": "Xã Mường Báng", "type": "Xã" } ] }, { "level2_id": "099", "name": "Huyện Tuần Giáo", "type": "Huyện", "level3s": [ { "level3_id": "03253", "name": "Thị trấn Tuần Giáo", "type": "Thị trấn" }, { "level3_id": "03259", "name": "Xã Phình Sáng", "type": "Xã" }, { "level3_id": "03260", "name": "Xã Rạng Đông", "type": "Xã" }, { "level3_id": "03262", "name": "Xã Mùn Chung", "type": "Xã" }, { "level3_id": "03263", "name": "Xã Nà Tòng", "type": "Xã" }, { "level3_id": "03265", "name": "Xã Ta Ma", "type": "Xã" }, { "level3_id": "03268", "name": "Xã Mường Mùn", "type": "Xã" }, { "level3_id": "03269", "name": "Xã Pú Xi", "type": "Xã" }, { "level3_id": "03271", "name": "Xã Pú Nhung", "type": "Xã" }, { "level3_id": "03274", "name": "Xã Quài Nưa", "type": "Xã" }, { "level3_id": "03277", "name": "Xã Mường Thín", "type": "Xã" }, { "level3_id": "03280", "name": "Xã Tỏa Tình", "type": "Xã" }, { "level3_id": "03283", "name": "Xã Nà Sáy", "type": "Xã" }, { "level3_id": "03284", "name": "Xã Mường Khong", "type": "Xã" }, { "level3_id": "03289", "name": "Xã Quài Cang", "type": "Xã" }, { "level3_id": "03295", "name": "Xã Quài Tở", "type": "Xã" }, { "level3_id": "03298", "name": "Xã Chiềng Sinh", "type": "Xã" }, { "level3_id": "03299", "name": "Xã Chiềng Đông", "type": "Xã" }, { "level3_id": "03304", "name": "Xã Tênh Phông", "type": "Xã" } ] }, { "level2_id": "100", "name": "Huyện Điện Biên", "type": "Huyện", "level3s": [ { "level3_id": "03319", "name": "Xã Mường Pồn", "type": "Xã" }, { "level3_id": "03322", "name": "Xã Thanh Nưa", "type": "Xã" }, { "level3_id": "03323", "name": "Xã Hua Thanh", "type": "Xã" }, { "level3_id": "03328", "name": "Xã Thanh Luông", "type": "Xã" }, { "level3_id": "03331", "name": "Xã Thanh Hưng", "type": "Xã" }, { "level3_id": "03334", "name": "Xã Thanh Xương", "type": "Xã" }, { "level3_id": "03337", "name": "Xã Thanh Chăn", "type": "Xã" }, { "level3_id": "03340", "name": "Xã Pa Thơm", "type": "Xã" }, { "level3_id": "03343", "name": "Xã Thanh An", "type": "Xã" }, { "level3_id": "03346", "name": "Xã Thanh Yên", "type": "Xã" }, { "level3_id": "03349", "name": "Xã Noong Luống", "type": "Xã" }, { "level3_id": "03352", "name": "Xã Noọng Hẹt", "type": "Xã" }, { "level3_id": "03355", "name": "Xã Sam Mứn", "type": "Xã" }, { "level3_id": "03356", "name": "Xã Pom Lót", "type": "Xã" }, { "level3_id": "03358", "name": "Xã Núa Ngam", "type": "Xã" }, { "level3_id": "03359", "name": "Xã Hẹ Muông", "type": "Xã" }, { "level3_id": "03361", "name": "Xã Na Ư", "type": "Xã" }, { "level3_id": "03364", "name": "Xã Mường Nhà", "type": "Xã" }, { "level3_id": "03365", "name": "Xã Na Tông", "type": "Xã" }, { "level3_id": "03367", "name": "Xã Mường Lói", "type": "Xã" }, { "level3_id": "03368", "name": "Xã Phu Luông", "type": "Xã" } ] }, { "level2_id": "101", "name": "Huyện Điện Biên Đông", "type": "Huyện", "level3s": [ { "level3_id": "03203", "name": "Thị trấn Điện Biên Đông", "type": "Thị trấn" }, { "level3_id": "03205", "name": "Xã Na Son", "type": "Xã" }, { "level3_id": "03208", "name": "Xã Phì Nhừ", "type": "Xã" }, { "level3_id": "03211", "name": "Xã Chiềng Sơ", "type": "Xã" }, { "level3_id": "03214", "name": "Xã Mường Luân", "type": "Xã" }, { "level3_id": "03370", "name": "Xã Pú Nhi", "type": "Xã" }, { "level3_id": "03371", "name": "Xã Nong U", "type": "Xã" }, { "level3_id": "03373", "name": "Xã Xa Dung", "type": "Xã" }, { "level3_id": "03376", "name": "Xã Keo Lôm", "type": "Xã" }, { "level3_id": "03379", "name": "Xã Luân Giới", "type": "Xã" }, { "level3_id": "03382", "name": "Xã Phình Giàng", "type": "Xã" }, { "level3_id": "03383", "name": "Xã Pú Hồng", "type": "Xã" }, { "level3_id": "03384", "name": "Xã Tìa Dình", "type": "Xã" }, { "level3_id": "03385", "name": "Xã Háng Lìa", "type": "Xã" } ] }, { "level2_id": "102", "name": "Huyện Mường Ảng", "type": "Huyện", "level3s": [ { "level3_id": "03256", "name": "Thị trấn Mường Ảng", "type": "Thị trấn" }, { "level3_id": "03286", "name": "Xã Mường Đăng", "type": "Xã" }, { "level3_id": "03287", "name": "Xã Ngối Cáy", "type": "Xã" }, { "level3_id": "03292", "name": "Xã Ẳng Tở", "type": "Xã" }, { "level3_id": "03301", "name": "Xã Búng Lao", "type": "Xã" }, { "level3_id": "03302", "name": "Xã Xuân Lao", "type": "Xã" }, { "level3_id": "03307", "name": "Xã Ẳng Nưa", "type": "Xã" }, { "level3_id": "03310", "name": "Xã Ẳng Cang", "type": "Xã" }, { "level3_id": "03312", "name": "Xã Nặm Lịch", "type": "Xã" }, { "level3_id": "03313", "name": "Xã Mường Lạn", "type": "Xã" } ] }, { "level2_id": "103", "name": "Huyện Nậm Pồ", "type": "Huyện", "level3s": [ { "level3_id": "03156", "name": "Xã Nậm Tin", "type": "Xã" }, { "level3_id": "03165", "name": "Xã Pa Tần", "type": "Xã" }, { "level3_id": "03166", "name": "Xã Chà Cang", "type": "Xã" }, { "level3_id": "03167", "name": "Xã Na Cô Sa", "type": "Xã" }, { "level3_id": "03168", "name": "Xã Nà Khoa", "type": "Xã" }, { "level3_id": "03169", "name": "Xã Nà Hỳ", "type": "Xã" }, { "level3_id": "03170", "name": "Xã Nà Bủng", "type": "Xã" }, { "level3_id": "03171", "name": "Xã Nậm Nhừ", "type": "Xã" }, { "level3_id": "03173", "name": "Xã Nậm Chua", "type": "Xã" }, { "level3_id": "03174", "name": "Xã Nậm Khăn", "type": "Xã" }, { "level3_id": "03175", "name": "Xã Chà Tở", "type": "Xã" }, { "level3_id": "03176", "name": "Xã Vàng Đán", "type": "Xã" }, { "level3_id": "03187", "name": "Xã Chà Nưa", "type": "Xã" }, { "level3_id": "03198", "name": "Xã Phìn Hồ", "type": "Xã" }, { "level3_id": "03199", "name": "Xã Si Pa Phìn", "type": "Xã" } ] } ] }, { "level1_id": "12", "name": "Tỉnh Lai Châu", "type": "Tỉnh", "level2s": [ { "level2_id": "105", "name": "Thành phố Lai Châu", "type": "Thành phố", "level3s": [ { "level3_id": "03386", "name": "Phường Quyết Thắng", "type": "Phường" }, { "level3_id": "03387", "name": "Phường Tân Phong", "type": "Phường" }, { "level3_id": "03388", "name": "Phường Quyết Tiến", "type": "Phường" }, { "level3_id": "03389", "name": "Phường Đoàn Kết", "type": "Phường" }, { "level3_id": "03403", "name": "Xã Sùng Phài", "type": "Xã" }, { "level3_id": "03408", "name": "Phường Đông Phong", "type": "Phường" }, { "level3_id": "03409", "name": "Xã San Thàng", "type": "Xã" } ] }, { "level2_id": "106", "name": "Huyện Tam Đường", "type": "Huyện", "level3s": [ { "level3_id": "03390", "name": "Thị trấn Tam Đường", "type": "Thị trấn" }, { "level3_id": "03394", "name": "Xã Thèn Sin", "type": "Xã" }, { "level3_id": "03400", "name": "Xã Tả Lèng", "type": "Xã" }, { "level3_id": "03405", "name": "Xã Giang Ma", "type": "Xã" }, { "level3_id": "03406", "name": "Xã Hồ Thầu", "type": "Xã" }, { "level3_id": "03412", "name": "Xã Bình Lư", "type": "Xã" }, { "level3_id": "03413", "name": "Xã Sơn Bình", "type": "Xã" }, { "level3_id": "03415", "name": "Xã Nùng Nàng", "type": "Xã" }, { "level3_id": "03418", "name": "Xã Bản Giang", "type": "Xã" }, { "level3_id": "03421", "name": "Xã Bản Hon", "type": "Xã" }, { "level3_id": "03424", "name": "Xã Bản Bo", "type": "Xã" }, { "level3_id": "03427", "name": "Xã Nà Tăm", "type": "Xã" }, { "level3_id": "03430", "name": "Xã Khun Há", "type": "Xã" } ] }, { "level2_id": "107", "name": "Huyện Mường Tè", "type": "Huyện", "level3s": [ { "level3_id": "03433", "name": "Thị trấn Mường Tè", "type": "Thị trấn" }, { "level3_id": "03436", "name": "Xã Thu Lũm", "type": "Xã" }, { "level3_id": "03439", "name": "Xã Ka Lăng", "type": "Xã" }, { "level3_id": "03440", "name": "Xã Tá Bạ", "type": "Xã" }, { "level3_id": "03442", "name": "Xã Pa ủ", "type": "Xã" }, { "level3_id": "03445", "name": "Xã Mường Tè", "type": "Xã" }, { "level3_id": "03448", "name": "Xã Pa Vệ Sử", "type": "Xã" }, { "level3_id": "03451", "name": "Xã Mù Cả", "type": "Xã" }, { "level3_id": "03454", "name": "Xã Bum Tở", "type": "Xã" }, { "level3_id": "03457", "name": "Xã Nậm Khao", "type": "Xã" }, { "level3_id": "03463", "name": "Xã Tà Tổng", "type": "Xã" }, { "level3_id": "03466", "name": "Xã Bum Nưa", "type": "Xã" }, { "level3_id": "03467", "name": "Xã Vàng San", "type": "Xã" }, { "level3_id": "03469", "name": "Xã Kan Hồ", "type": "Xã" } ] }, { "level2_id": "108", "name": "Huyện Sìn Hồ", "type": "Huyện", "level3s": [ { "level3_id": "03478", "name": "Thị trấn Sìn Hồ", "type": "Thị trấn" }, { "level3_id": "03487", "name": "Xã Chăn Nưa", "type": "Xã" }, { "level3_id": "03493", "name": "Xã Pa Tần", "type": "Xã" }, { "level3_id": "03496", "name": "Xã Phìn Hồ", "type": "Xã" }, { "level3_id": "03499", "name": "Xã Hồng Thu", "type": "Xã" }, { "level3_id": "03505", "name": "Xã Phăng Sô Lin", "type": "Xã" }, { "level3_id": "03508", "name": "Xã Ma Quai", "type": "Xã" }, { "level3_id": "03509", "name": "Xã Lùng Thàng", "type": "Xã" }, { "level3_id": "03511", "name": "Xã Tả Phìn", "type": "Xã" }, { "level3_id": "03514", "name": "Xã Sà Dề Phìn", "type": "Xã" }, { "level3_id": "03517", "name": "Xã Nậm Tăm", "type": "Xã" }, { "level3_id": "03520", "name": "Xã Tả Ngảo", "type": "Xã" }, { "level3_id": "03523", "name": "Xã Pu Sam Cáp", "type": "Xã" }, { "level3_id": "03526", "name": "Xã Nậm Cha", "type": "Xã" }, { "level3_id": "03527", "name": "Xã Pa Khoá", "type": "Xã" }, { "level3_id": "03529", "name": "Xã Làng Mô", "type": "Xã" }, { "level3_id": "03532", "name": "Xã Noong Hẻo", "type": "Xã" }, { "level3_id": "03535", "name": "Xã Nậm Mạ", "type": "Xã" }, { "level3_id": "03538", "name": "Xã Căn Co", "type": "Xã" }, { "level3_id": "03541", "name": "Xã Tủa Sín Chải", "type": "Xã" }, { "level3_id": "03544", "name": "Xã Nậm Cuổi", "type": "Xã" }, { "level3_id": "03547", "name": "Xã Nậm Hăn", "type": "Xã" } ] }, { "level2_id": "109", "name": "Huyện Phong Thổ", "type": "Huyện", "level3s": [ { "level3_id": "03391", "name": "Xã Lả Nhì Thàng", "type": "Xã" }, { "level3_id": "03490", "name": "Xã Huổi Luông", "type": "Xã" }, { "level3_id": "03549", "name": "Thị trấn Phong Thổ", "type": "Thị trấn" }, { "level3_id": "03550", "name": "Xã Sì Lở Lầu", "type": "Xã" }, { "level3_id": "03553", "name": "Xã Mồ Sì San", "type": "Xã" }, { "level3_id": "03559", "name": "Xã Pa Vây Sử", "type": "Xã" }, { "level3_id": "03562", "name": "Xã Vàng Ma Chải", "type": "Xã" }, { "level3_id": "03565", "name": "Xã Tông Qua Lìn", "type": "Xã" }, { "level3_id": "03568", "name": "Xã Mù Sang", "type": "Xã" }, { "level3_id": "03571", "name": "Xã Dào San", "type": "Xã" }, { "level3_id": "03574", "name": "Xã Ma Ly Pho", "type": "Xã" }, { "level3_id": "03577", "name": "Xã Bản Lang", "type": "Xã" }, { "level3_id": "03580", "name": "Xã Hoang Thèn", "type": "Xã" }, { "level3_id": "03583", "name": "Xã Khổng Lào", "type": "Xã" }, { "level3_id": "03586", "name": "Xã Nậm Xe", "type": "Xã" }, { "level3_id": "03589", "name": "Xã Mường So", "type": "Xã" }, { "level3_id": "03592", "name": "Xã Sin Suối Hồ", "type": "Xã" } ] }, { "level2_id": "110", "name": "Huyện Than Uyên", "type": "Huyện", "level3s": [ { "level3_id": "03595", "name": "Thị trấn Than Uyên", "type": "Thị trấn" }, { "level3_id": "03618", "name": "Xã Phúc Than", "type": "Xã" }, { "level3_id": "03619", "name": "Xã Mường Than", "type": "Xã" }, { "level3_id": "03625", "name": "Xã Mường Mít", "type": "Xã" }, { "level3_id": "03628", "name": "Xã Pha Mu", "type": "Xã" }, { "level3_id": "03631", "name": "Xã Mường Cang", "type": "Xã" }, { "level3_id": "03632", "name": "Xã Hua Nà", "type": "Xã" }, { "level3_id": "03634", "name": "Xã Tà Hừa", "type": "Xã" }, { "level3_id": "03637", "name": "Xã Mường Kim", "type": "Xã" }, { "level3_id": "03638", "name": "Xã Tà Mung", "type": "Xã" }, { "level3_id": "03640", "name": "Xã Tà Gia", "type": "Xã" }, { "level3_id": "03643", "name": "Xã Khoen On", "type": "Xã" } ] }, { "level2_id": "111", "name": "Huyện Tân Uyên", "type": "Huyện", "level3s": [ { "level3_id": "03598", "name": "Thị trấn Tân Uyên", "type": "Thị trấn" }, { "level3_id": "03601", "name": "Xã Mường Khoa", "type": "Xã" }, { "level3_id": "03602", "name": "Xã Phúc Khoa", "type": "Xã" }, { "level3_id": "03604", "name": "Xã Thân Thuộc", "type": "Xã" }, { "level3_id": "03605", "name": "Xã Trung Đồng", "type": "Xã" }, { "level3_id": "03607", "name": "Xã Hố Mít", "type": "Xã" }, { "level3_id": "03610", "name": "Xã Nậm Cần", "type": "Xã" }, { "level3_id": "03613", "name": "Xã Nậm Sỏ", "type": "Xã" }, { "level3_id": "03616", "name": "Xã Pắc Ta", "type": "Xã" }, { "level3_id": "03622", "name": "Xã Tà Mít", "type": "Xã" } ] }, { "level2_id": "112", "name": "Huyện Nậm Nhùn", "type": "Huyện", "level3s": [ { "level3_id": "03434", "name": "Thị trấn Nậm Nhùn", "type": "Thị trấn" }, { "level3_id": "03460", "name": "Xã Hua Bun", "type": "Xã" }, { "level3_id": "03472", "name": "Xã Mường Mô", "type": "Xã" }, { "level3_id": "03473", "name": "Xã Nậm Chà", "type": "Xã" }, { "level3_id": "03474", "name": "Xã Nậm Manh", "type": "Xã" }, { "level3_id": "03475", "name": "Xã Nậm Hàng", "type": "Xã" }, { "level3_id": "03481", "name": "Xã Lê Lợi", "type": "Xã" }, { "level3_id": "03484", "name": "Xã Pú Đao", "type": "Xã" }, { "level3_id": "03488", "name": "Xã Nậm Pì", "type": "Xã" }, { "level3_id": "03502", "name": "Xã Nậm Ban", "type": "Xã" }, { "level3_id": "03503", "name": "Xã Trung Chải", "type": "Xã" } ] } ] }, { "level1_id": "14", "name": "Tỉnh Sơn La", "type": "Tỉnh", "level2s": [ { "level2_id": "116", "name": "Thành phố Sơn La", "type": "Thành phố", "level3s": [ { "level3_id": "03646", "name": "Phường Chiềng Lề", "type": "Phường" }, { "level3_id": "03649", "name": "Phường Tô Hiệu", "type": "Phường" }, { "level3_id": "03652", "name": "Phường Quyết Thắng", "type": "Phường" }, { "level3_id": "03655", "name": "Phường Quyết Tâm", "type": "Phường" }, { "level3_id": "03658", "name": "Xã Chiềng Cọ", "type": "Xã" }, { "level3_id": "03661", "name": "Xã Chiềng Đen", "type": "Xã" }, { "level3_id": "03664", "name": "Xã Chiềng Xôm", "type": "Xã" }, { "level3_id": "03667", "name": "Phường Chiềng An", "type": "Phường" }, { "level3_id": "03670", "name": "Phường Chiềng Cơi", "type": "Phường" }, { "level3_id": "03673", "name": "Xã Chiềng Ngần", "type": "Xã" }, { "level3_id": "03676", "name": "Xã Hua La", "type": "Xã" }, { "level3_id": "03679", "name": "Phường Chiềng Sinh", "type": "Phường" } ] }, { "level2_id": "118", "name": "Huyện Quỳnh Nhai", "type": "Huyện", "level3s": [ { "level3_id": "03682", "name": "Xã Mường Chiên", "type": "Xã" }, { "level3_id": "03685", "name": "Xã Cà Nàng", "type": "Xã" }, { "level3_id": "03688", "name": "Xã Chiềng Khay", "type": "Xã" }, { "level3_id": "03694", "name": "Xã Mường Giôn", "type": "Xã" }, { "level3_id": "03697", "name": "Xã Pá Ma Pha Khinh", "type": "Xã" }, { "level3_id": "03700", "name": "Xã Chiềng Ơn", "type": "Xã" }, { "level3_id": "03703", "name": "Thị trấn Mường Giàng", "type": "Thị trấn" }, { "level3_id": "03706", "name": "Xã Chiềng Bằng", "type": "Xã" }, { "level3_id": "03709", "name": "Xã Mường Sại", "type": "Xã" }, { "level3_id": "03712", "name": "Xã Nậm ét", "type": "Xã" }, { "level3_id": "03718", "name": "Xã Chiềng Khoang", "type": "Xã" } ] }, { "level2_id": "119", "name": "Huyện Thuận Châu", "type": "Huyện", "level3s": [ { "level3_id": "03721", "name": "Thị trấn Thuận Châu", "type": "Thị trấn" }, { "level3_id": "03724", "name": "Xã Phổng Lái", "type": "Xã" }, { "level3_id": "03727", "name": "Xã Mường é", "type": "Xã" }, { "level3_id": "03730", "name": "Xã Chiềng Pha", "type": "Xã" }, { "level3_id": "03733", "name": "Xã Chiềng La", "type": "Xã" }, { "level3_id": "03736", "name": "Xã Chiềng Ngàm", "type": "Xã" }, { "level3_id": "03739", "name": "Xã Liệp Tè", "type": "Xã" }, { "level3_id": "03742", "name": "Xã é Tòng", "type": "Xã" }, { "level3_id": "03745", "name": "Xã Phổng Lập", "type": "Xã" }, { "level3_id": "03748", "name": "Xã Phổng Ly", "type": "Xã" }, { "level3_id": "03754", "name": "Xã Noong Lay", "type": "Xã" }, { "level3_id": "03757", "name": "Xã Mường Khiêng", "type": "Xã" }, { "level3_id": "03760", "name": "Xã Mường Bám", "type": "Xã" }, { "level3_id": "03763", "name": "Xã Long Hẹ", "type": "Xã" }, { "level3_id": "03766", "name": "Xã Chiềng Bôm", "type": "Xã" }, { "level3_id": "03769", "name": "Xã Thôm Mòn", "type": "Xã" }, { "level3_id": "03772", "name": "Xã Tông Lạnh", "type": "Xã" }, { "level3_id": "03775", "name": "Xã Tông Cọ", "type": "Xã" }, { "level3_id": "03778", "name": "Xã Bó Mười", "type": "Xã" }, { "level3_id": "03781", "name": "Xã Co Mạ", "type": "Xã" }, { "level3_id": "03784", "name": "Xã Púng Tra", "type": "Xã" }, { "level3_id": "03787", "name": "Xã Chiềng Pấc", "type": "Xã" }, { "level3_id": "03790", "name": "Xã Nậm Lầu", "type": "Xã" }, { "level3_id": "03793", "name": "Xã Bon Phặng", "type": "Xã" }, { "level3_id": "03796", "name": "Xã Co Tòng", "type": "Xã" }, { "level3_id": "03799", "name": "Xã Muổi Nọi", "type": "Xã" }, { "level3_id": "03802", "name": "Xã Pá Lông", "type": "Xã" }, { "level3_id": "03805", "name": "Xã Bản Lầm", "type": "Xã" } ] }, { "level2_id": "120", "name": "Huyện Mường La", "type": "Huyện", "level3s": [ { "level3_id": "03808", "name": "Thị trấn Ít Ong", "type": "Thị trấn" }, { "level3_id": "03811", "name": "Xã Nậm Giôn", "type": "Xã" }, { "level3_id": "03814", "name": "Xã Chiềng Lao", "type": "Xã" }, { "level3_id": "03817", "name": "Xã Hua Trai", "type": "Xã" }, { "level3_id": "03820", "name": "Xã Ngọc Chiến", "type": "Xã" }, { "level3_id": "03823", "name": "Xã Mường Trai", "type": "Xã" }, { "level3_id": "03826", "name": "Xã Nậm Păm", "type": "Xã" }, { "level3_id": "03829", "name": "Xã Chiềng Muôn", "type": "Xã" }, { "level3_id": "03832", "name": "Xã Chiềng Ân", "type": "Xã" }, { "level3_id": "03835", "name": "Xã Pi Toong", "type": "Xã" }, { "level3_id": "03838", "name": "Xã Chiềng Công", "type": "Xã" }, { "level3_id": "03841", "name": "Xã Tạ Bú", "type": "Xã" }, { "level3_id": "03844", "name": "Xã Chiềng San", "type": "Xã" }, { "level3_id": "03847", "name": "Xã Mường Bú", "type": "Xã" }, { "level3_id": "03850", "name": "Xã Chiềng Hoa", "type": "Xã" }, { "level3_id": "03853", "name": "Xã Mường Chùm", "type": "Xã" } ] }, { "level2_id": "121", "name": "Huyện Bắc Yên", "type": "Huyện", "level3s": [ { "level3_id": "03856", "name": "Thị trấn Bắc Yên", "type": "Thị trấn" }, { "level3_id": "03859", "name": "Xã Phiêng Ban", "type": "Xã" }, { "level3_id": "03862", "name": "Xã Hang Chú", "type": "Xã" }, { "level3_id": "03865", "name": "Xã Xím Vàng", "type": "Xã" }, { "level3_id": "03868", "name": "Xã Tà Xùa", "type": "Xã" }, { "level3_id": "03869", "name": "Xã Háng Đồng", "type": "Xã" }, { "level3_id": "03871", "name": "Xã Pắc Ngà", "type": "Xã" }, { "level3_id": "03874", "name": "Xã Làng Chếu", "type": "Xã" }, { "level3_id": "03877", "name": "Xã Chim Vàn", "type": "Xã" }, { "level3_id": "03880", "name": "Xã Mường Khoa", "type": "Xã" }, { "level3_id": "03883", "name": "Xã Song Pe", "type": "Xã" }, { "level3_id": "03886", "name": "Xã Hồng Ngài", "type": "Xã" }, { "level3_id": "03889", "name": "Xã Tạ Khoa", "type": "Xã" }, { "level3_id": "03890", "name": "Xã Hua Nhàn", "type": "Xã" }, { "level3_id": "03892", "name": "Xã Phiêng Côn", "type": "Xã" }, { "level3_id": "03895", "name": "Xã Chiềng Sại", "type": "Xã" } ] }, { "level2_id": "122", "name": "Huyện Phù Yên", "type": "Huyện", "level3s": [ { "level3_id": "03901", "name": "Xã Suối Tọ", "type": "Xã" }, { "level3_id": "03904", "name": "Xã Mường Thải", "type": "Xã" }, { "level3_id": "03907", "name": "Xã Mường Cơi", "type": "Xã" }, { "level3_id": "03910", "name": "Thị trấn Quang Huy", "type": "Thị trấn" }, { "level3_id": "03916", "name": "Xã Huy Thượng", "type": "Xã" }, { "level3_id": "03919", "name": "Xã Tân Lang", "type": "Xã" }, { "level3_id": "03922", "name": "Xã Gia Phù", "type": "Xã" }, { "level3_id": "03925", "name": "Xã Tường Phù", "type": "Xã" }, { "level3_id": "03928", "name": "Xã Huy Hạ", "type": "Xã" }, { "level3_id": "03931", "name": "Xã Huy Tân", "type": "Xã" }, { "level3_id": "03934", "name": "Xã Mường Lang", "type": "Xã" }, { "level3_id": "03937", "name": "Xã Suối Bau", "type": "Xã" }, { "level3_id": "03940", "name": "Xã Huy Tường", "type": "Xã" }, { "level3_id": "03943", "name": "Xã Mường Do", "type": "Xã" }, { "level3_id": "03946", "name": "Xã Sập Xa", "type": "Xã" }, { "level3_id": "03949", "name": "Xã Tường Thượng", "type": "Xã" }, { "level3_id": "03952", "name": "Xã Tường Tiến", "type": "Xã" }, { "level3_id": "03955", "name": "Xã Tường Phong", "type": "Xã" }, { "level3_id": "03958", "name": "Xã Tường Hạ", "type": "Xã" }, { "level3_id": "03961", "name": "Xã Kim Bon", "type": "Xã" }, { "level3_id": "03964", "name": "Xã Mường Bang", "type": "Xã" }, { "level3_id": "03967", "name": "Xã Đá Đỏ", "type": "Xã" }, { "level3_id": "03970", "name": "Xã Tân Phong", "type": "Xã" }, { "level3_id": "03973", "name": "Xã Nam Phong", "type": "Xã" }, { "level3_id": "03976", "name": "Xã Bắc Phong", "type": "Xã" } ] }, { "level2_id": "123", "name": "Thị xã Mộc Châu", "type": "Thị xã", "level3s": [ { "level3_id": "03979", "name": "Phường Mộc Sơn", "type": "Phường" }, { "level3_id": "03980", "name": "Phường Mộc Lỵ", "type": "Phường" }, { "level3_id": "03982", "name": "Phường Thảo Nguyên", "type": "Phường" }, { "level3_id": "03983", "name": "Phường Bình Minh", "type": "Phường" }, { "level3_id": "03984", "name": "Phường Cờ Đỏ", "type": "Phường" }, { "level3_id": "03985", "name": "Xã Chiềng Sơn", "type": "Xã" }, { "level3_id": "03997", "name": "Xã Tân Yên", "type": "Xã" }, { "level3_id": "04000", "name": "Xã Đoàn Kết", "type": "Xã" }, { "level3_id": "04012", "name": "Xã Chiềng Hắc", "type": "Xã" }, { "level3_id": "04015", "name": "Xã Chiềng Chung", "type": "Xã" }, { "level3_id": "04024", "name": "Xã Chiềng Khừa", "type": "Xã" }, { "level3_id": "04027", "name": "Phường Mường Sang", "type": "Phường" }, { "level3_id": "04030", "name": "Phường Đông Sang", "type": "Phường" }, { "level3_id": "04033", "name": "Phường Vân Sơn", "type": "Phường" }, { "level3_id": "04045", "name": "Xã Lóng Sập", "type": "Xã" } ] }, { "level2_id": "124", "name": "Huyện Yên Châu", "type": "Huyện", "level3s": [ { "level3_id": "04063", "name": "Xã Chiềng Đông", "type": "Xã" }, { "level3_id": "04066", "name": "Xã Sặp Vạt", "type": "Xã" }, { "level3_id": "04069", "name": "Xã Chiềng Sàng", "type": "Xã" }, { "level3_id": "04072", "name": "Xã Chiềng Pằn", "type": "Xã" }, { "level3_id": "04075", "name": "Thị trấn Yên Châu", "type": "Thị trấn" }, { "level3_id": "04078", "name": "Xã Chiềng Hặc", "type": "Xã" }, { "level3_id": "04081", "name": "Xã Mường Lựm", "type": "Xã" }, { "level3_id": "04084", "name": "Xã Chiềng On", "type": "Xã" }, { "level3_id": "04087", "name": "Xã Yên Sơn", "type": "Xã" }, { "level3_id": "04090", "name": "Xã Chiềng Khoi", "type": "Xã" }, { "level3_id": "04093", "name": "Xã Tú Nang", "type": "Xã" }, { "level3_id": "04096", "name": "Xã Lóng Phiêng", "type": "Xã" }, { "level3_id": "04099", "name": "Xã Phiêng Khoài", "type": "Xã" }, { "level3_id": "04102", "name": "Xã Chiềng Tương", "type": "Xã" } ] }, { "level2_id": "125", "name": "Huyện Mai Sơn", "type": "Huyện", "level3s": [ { "level3_id": "04105", "name": "Thị trấn Hát Lót", "type": "Thị trấn" }, { "level3_id": "04108", "name": "Xã Chiềng Sung", "type": "Xã" }, { "level3_id": "04111", "name": "Xã Mường Bằng", "type": "Xã" }, { "level3_id": "04114", "name": "Xã Chiềng Chăn", "type": "Xã" }, { "level3_id": "04117", "name": "Xã Mương Chanh", "type": "Xã" }, { "level3_id": "04120", "name": "Xã Chiềng Ban", "type": "Xã" }, { "level3_id": "04123", "name": "Xã Chiềng Mung", "type": "Xã" }, { "level3_id": "04126", "name": "Xã Mường Bon", "type": "Xã" }, { "level3_id": "04129", "name": "Xã Chiềng Chung", "type": "Xã" }, { "level3_id": "04132", "name": "Xã Chiềng Mai", "type": "Xã" }, { "level3_id": "04135", "name": "Xã Hát Lót", "type": "Xã" }, { "level3_id": "04136", "name": "Xã Nà Pó", "type": "Xã" }, { "level3_id": "04138", "name": "Xã Cò  Nòi", "type": "Xã" }, { "level3_id": "04141", "name": "Xã Chiềng Nơi", "type": "Xã" }, { "level3_id": "04144", "name": "Xã Phiêng Cằm", "type": "Xã" }, { "level3_id": "04147", "name": "Xã Chiềng Dong", "type": "Xã" }, { "level3_id": "04150", "name": "Xã Chiềng Kheo", "type": "Xã" }, { "level3_id": "04153", "name": "Xã Chiềng Ve", "type": "Xã" }, { "level3_id": "04156", "name": "Xã Chiềng Lương", "type": "Xã" }, { "level3_id": "04159", "name": "Xã Phiêng Pằn", "type": "Xã" }, { "level3_id": "04162", "name": "Xã Nà Ơt", "type": "Xã" }, { "level3_id": "04165", "name": "Xã Tà Hộc", "type": "Xã" } ] }, { "level2_id": "126", "name": "Huyện Sông Mã", "type": "Huyện", "level3s": [ { "level3_id": "04168", "name": "Thị trấn Sông Mã", "type": "Thị trấn" }, { "level3_id": "04171", "name": "Xã Bó Sinh", "type": "Xã" }, { "level3_id": "04174", "name": "Xã Pú Pẩu", "type": "Xã" }, { "level3_id": "04177", "name": "Xã Chiềng Phung", "type": "Xã" }, { "level3_id": "04180", "name": "Xã Chiềng En", "type": "Xã" }, { "level3_id": "04183", "name": "Xã Mường Lầm", "type": "Xã" }, { "level3_id": "04186", "name": "Xã Nậm Ty", "type": "Xã" }, { "level3_id": "04189", "name": "Xã Đứa Mòn", "type": "Xã" }, { "level3_id": "04192", "name": "Xã Yên Hưng", "type": "Xã" }, { "level3_id": "04195", "name": "Xã Chiềng Sơ", "type": "Xã" }, { "level3_id": "04198", "name": "Xã Nà Nghịu", "type": "Xã" }, { "level3_id": "04201", "name": "Xã Nậm Mằn", "type": "Xã" }, { "level3_id": "04204", "name": "Xã Chiềng Khoong", "type": "Xã" }, { "level3_id": "04207", "name": "Xã Chiềng Cang", "type": "Xã" }, { "level3_id": "04210", "name": "Xã Huổi Một", "type": "Xã" }, { "level3_id": "04213", "name": "Xã Mường Sai", "type": "Xã" }, { "level3_id": "04216", "name": "Xã Mường Cai", "type": "Xã" }, { "level3_id": "04219", "name": "Xã Mường Hung", "type": "Xã" }, { "level3_id": "04222", "name": "Xã Chiềng Khương", "type": "Xã" } ] }, { "level2_id": "127", "name": "Huyện Sốp Cộp", "type": "Huyện", "level3s": [ { "level3_id": "04225", "name": "Xã Sam Kha", "type": "Xã" }, { "level3_id": "04228", "name": "Xã Púng Bánh", "type": "Xã" }, { "level3_id": "04231", "name": "Xã Sốp Cộp", "type": "Xã" }, { "level3_id": "04234", "name": "Xã Dồm Cang", "type": "Xã" }, { "level3_id": "04237", "name": "Xã Nậm Lạnh", "type": "Xã" }, { "level3_id": "04240", "name": "Xã Mường Lèo", "type": "Xã" }, { "level3_id": "04243", "name": "Xã Mường Và", "type": "Xã" }, { "level3_id": "04246", "name": "Xã Mường Lạn", "type": "Xã" } ] }, { "level2_id": "128", "name": "Huyện Vân Hồ", "type": "Huyện", "level3s": [ { "level3_id": "03994", "name": "Xã Suối Bàng", "type": "Xã" }, { "level3_id": "04006", "name": "Xã Song Khủa", "type": "Xã" }, { "level3_id": "04009", "name": "Xã Liên Hoà", "type": "Xã" }, { "level3_id": "04018", "name": "Xã Tô Múa", "type": "Xã" }, { "level3_id": "04021", "name": "Xã Mường Tè", "type": "Xã" }, { "level3_id": "04036", "name": "Xã Chiềng Khoa", "type": "Xã" }, { "level3_id": "04039", "name": "Xã Mường Men", "type": "Xã" }, { "level3_id": "04042", "name": "Xã Quang Minh", "type": "Xã" }, { "level3_id": "04048", "name": "Xã Vân Hồ", "type": "Xã" }, { "level3_id": "04051", "name": "Xã Lóng Luông", "type": "Xã" }, { "level3_id": "04054", "name": "Xã Chiềng Yên", "type": "Xã" }, { "level3_id": "04056", "name": "Xã Chiềng Xuân", "type": "Xã" }, { "level3_id": "04057", "name": "Xã Xuân Nha", "type": "Xã" }, { "level3_id": "04058", "name": "Xã Tân Xuân", "type": "Xã" } ] } ] }, { "level1_id": "15", "name": "Tỉnh Yên Bái", "type": "Tỉnh", "level2s": [ { "level2_id": "132", "name": "Thành phố Yên Bái", "type": "Thành phố", "level3s": [ { "level3_id": "04249", "name": "Phường Yên Thịnh", "type": "Phường" }, { "level3_id": "04252", "name": "Phường Yên Ninh", "type": "Phường" }, { "level3_id": "04255", "name": "Phường Minh Tân", "type": "Phường" }, { "level3_id": "04258", "name": "Phường Nguyễn Thái Học", "type": "Phường" }, { "level3_id": "04261", "name": "Phường Đồng Tâm", "type": "Phường" }, { "level3_id": "04264", "name": "Phường Hồng Hà", "type": "Phường" }, { "level3_id": "04270", "name": "Xã Minh Bảo", "type": "Xã" }, { "level3_id": "04273", "name": "Phường Nam Cường", "type": "Phường" }, { "level3_id": "04276", "name": "Xã Tuy Lộc", "type": "Xã" }, { "level3_id": "04279", "name": "Xã Tân Thịnh", "type": "Xã" }, { "level3_id": "04540", "name": "Xã Âu Lâu", "type": "Xã" }, { "level3_id": "04543", "name": "Xã Giới Phiên", "type": "Xã" }, { "level3_id": "04546", "name": "Phường Hợp Minh", "type": "Phường" }, { "level3_id": "04558", "name": "Xã Văn Phú", "type": "Xã" } ] }, { "level2_id": "133", "name": "Thị xã Nghĩa Lộ", "type": "Thị xã", "level3s": [ { "level3_id": "04282", "name": "Phường Pú Trạng", "type": "Phường" }, { "level3_id": "04285", "name": "Phường Trung Tâm", "type": "Phường" }, { "level3_id": "04288", "name": "Phường Tân An", "type": "Phường" }, { "level3_id": "04291", "name": "Phường Cầu Thia", "type": "Phường" }, { "level3_id": "04294", "name": "Xã Nghĩa Lợi", "type": "Xã" }, { "level3_id": "04297", "name": "Xã Nghĩa Phúc", "type": "Xã" }, { "level3_id": "04300", "name": "Xã Nghĩa An", "type": "Xã" }, { "level3_id": "04624", "name": "Xã Nghĩa Lộ", "type": "Xã" }, { "level3_id": "04660", "name": "Xã Sơn A", "type": "Xã" }, { "level3_id": "04663", "name": "Xã Phù Nham", "type": "Xã" }, { "level3_id": "04675", "name": "Xã Thanh Lương", "type": "Xã" }, { "level3_id": "04678", "name": "Xã Hạnh Sơn", "type": "Xã" }, { "level3_id": "04681", "name": "Xã Phúc Sơn", "type": "Xã" }, { "level3_id": "04684", "name": "Xã Thạch Lương", "type": "Xã" } ] }, { "level2_id": "135", "name": "Huyện Lục Yên", "type": "Huyện", "level3s": [ { "level3_id": "04303", "name": "Thị trấn Yên Thế", "type": "Thị trấn" }, { "level3_id": "04306", "name": "Xã Tân Phượng", "type": "Xã" }, { "level3_id": "04309", "name": "Xã Lâm Thượng", "type": "Xã" }, { "level3_id": "04312", "name": "Xã Khánh Thiện", "type": "Xã" }, { "level3_id": "04315", "name": "Xã Minh Chuẩn", "type": "Xã" }, { "level3_id": "04318", "name": "Xã Mai Sơn", "type": "Xã" }, { "level3_id": "04321", "name": "Xã Khai Trung", "type": "Xã" }, { "level3_id": "04324", "name": "Xã Mường Lai", "type": "Xã" }, { "level3_id": "04327", "name": "Xã An Lạc", "type": "Xã" }, { "level3_id": "04330", "name": "Xã Minh Xuân", "type": "Xã" }, { "level3_id": "04333", "name": "Xã Tô Mậu", "type": "Xã" }, { "level3_id": "04336", "name": "Xã Tân Lĩnh", "type": "Xã" }, { "level3_id": "04339", "name": "Xã Yên Thắng", "type": "Xã" }, { "level3_id": "04342", "name": "Xã Khánh Hoà", "type": "Xã" }, { "level3_id": "04345", "name": "Xã Vĩnh Lạc", "type": "Xã" }, { "level3_id": "04348", "name": "Xã Liễu Đô", "type": "Xã" }, { "level3_id": "04351", "name": "Xã Động Quan", "type": "Xã" }, { "level3_id": "04354", "name": "Xã Tân Lập", "type": "Xã" }, { "level3_id": "04357", "name": "Xã Minh Tiến", "type": "Xã" }, { "level3_id": "04360", "name": "Xã Trúc Lâu", "type": "Xã" }, { "level3_id": "04363", "name": "Xã Phúc Lợi", "type": "Xã" }, { "level3_id": "04366", "name": "Xã Phan Thanh", "type": "Xã" }, { "level3_id": "04369", "name": "Xã An Phú", "type": "Xã" }, { "level3_id": "04372", "name": "Xã Trung Tâm", "type": "Xã" } ] }, { "level2_id": "136", "name": "Huyện Văn Yên", "type": "Huyện", "level3s": [ { "level3_id": "04375", "name": "Thị trấn Mậu A", "type": "Thị trấn" }, { "level3_id": "04378", "name": "Xã Lang Thíp", "type": "Xã" }, { "level3_id": "04381", "name": "Xã Lâm Giang", "type": "Xã" }, { "level3_id": "04384", "name": "Xã Châu Quế Thượng", "type": "Xã" }, { "level3_id": "04387", "name": "Xã Châu Quế Hạ", "type": "Xã" }, { "level3_id": "04390", "name": "Xã An Bình", "type": "Xã" }, { "level3_id": "04393", "name": "Xã Quang Minh", "type": "Xã" }, { "level3_id": "04396", "name": "Xã Đông An", "type": "Xã" }, { "level3_id": "04399", "name": "Xã Đông Cuông", "type": "Xã" }, { "level3_id": "04402", "name": "Xã Phong Dụ Hạ", "type": "Xã" }, { "level3_id": "04405", "name": "Xã Mậu Đông", "type": "Xã" }, { "level3_id": "04408", "name": "Xã Ngòi A", "type": "Xã" }, { "level3_id": "04411", "name": "Xã Xuân Tầm", "type": "Xã" }, { "level3_id": "04414", "name": "Xã Tân Hợp", "type": "Xã" }, { "level3_id": "04417", "name": "Xã An Thịnh", "type": "Xã" }, { "level3_id": "04420", "name": "Xã Yên Thái", "type": "Xã" }, { "level3_id": "04423", "name": "Xã Phong Dụ Thượng", "type": "Xã" }, { "level3_id": "04426", "name": "Xã Yên Hợp", "type": "Xã" }, { "level3_id": "04429", "name": "Xã Đại Sơn", "type": "Xã" }, { "level3_id": "04435", "name": "Xã Đại Phác", "type": "Xã" }, { "level3_id": "04438", "name": "Xã Yên Phú", "type": "Xã" }, { "level3_id": "04441", "name": "Xã Xuân Ái", "type": "Xã" }, { "level3_id": "04447", "name": "Xã Viễn Sơn", "type": "Xã" }, { "level3_id": "04450", "name": "Xã Mỏ Vàng", "type": "Xã" }, { "level3_id": "04453", "name": "Xã Nà Hẩu", "type": "Xã" } ] }, { "level2_id": "137", "name": "Huyện Mù Căng Chải", "type": "Huyện", "level3s": [ { "level3_id": "04456", "name": "Thị trấn Mù Căng Chải", "type": "Thị trấn" }, { "level3_id": "04459", "name": "Xã Hồ Bốn", "type": "Xã" }, { "level3_id": "04462", "name": "Xã Nậm Có", "type": "Xã" }, { "level3_id": "04465", "name": "Xã Khao Mang", "type": "Xã" }, { "level3_id": "04468", "name": "Xã Mồ Dề", "type": "Xã" }, { "level3_id": "04471", "name": "Xã Chế Cu Nha", "type": "Xã" }, { "level3_id": "04474", "name": "Xã Lao Chải", "type": "Xã" }, { "level3_id": "04477", "name": "Xã Kim Nọi", "type": "Xã" }, { "level3_id": "04480", "name": "Xã Cao Phạ", "type": "Xã" }, { "level3_id": "04483", "name": "Xã La Pán Tẩn", "type": "Xã" }, { "level3_id": "04486", "name": "Xã Dế Su Phình", "type": "Xã" }, { "level3_id": "04489", "name": "Xã Chế Tạo", "type": "Xã" }, { "level3_id": "04492", "name": "Xã Púng Luông", "type": "Xã" }, { "level3_id": "04495", "name": "Xã Nậm Khắt", "type": "Xã" } ] }, { "level2_id": "138", "name": "Huyện Trấn Yên", "type": "Huyện", "level3s": [ { "level3_id": "04498", "name": "Thị trấn Cổ Phúc", "type": "Thị trấn" }, { "level3_id": "04501", "name": "Xã Tân Đồng", "type": "Xã" }, { "level3_id": "04504", "name": "Xã Báo Đáp", "type": "Xã" }, { "level3_id": "04510", "name": "Xã Thành Thịnh", "type": "Xã" }, { "level3_id": "04513", "name": "Xã Hòa Cuông", "type": "Xã" }, { "level3_id": "04516", "name": "Xã Minh Quán", "type": "Xã" }, { "level3_id": "04519", "name": "Xã Quy Mông", "type": "Xã" }, { "level3_id": "04522", "name": "Xã Cường Thịnh", "type": "Xã" }, { "level3_id": "04525", "name": "Xã Kiên Thành", "type": "Xã" }, { "level3_id": "04531", "name": "Xã Y Can", "type": "Xã" }, { "level3_id": "04537", "name": "Xã Lương Thịnh", "type": "Xã" }, { "level3_id": "04564", "name": "Xã Việt Cường", "type": "Xã" }, { "level3_id": "04567", "name": "Xã Minh Quân", "type": "Xã" }, { "level3_id": "04570", "name": "Xã Hồng Ca", "type": "Xã" }, { "level3_id": "04573", "name": "Xã Hưng Thịnh", "type": "Xã" }, { "level3_id": "04576", "name": "Xã Hưng Khánh", "type": "Xã" }, { "level3_id": "04579", "name": "Xã Việt Hồng", "type": "Xã" }, { "level3_id": "04582", "name": "Xã Vân Hội", "type": "Xã" } ] }, { "level2_id": "139", "name": "Huyện Trạm Tấu", "type": "Huyện", "level3s": [ { "level3_id": "04585", "name": "Thị trấn Trạm Tấu", "type": "Thị trấn" }, { "level3_id": "04588", "name": "Xã Túc Đán", "type": "Xã" }, { "level3_id": "04591", "name": "Xã Pá Lau", "type": "Xã" }, { "level3_id": "04594", "name": "Xã Xà Hồ", "type": "Xã" }, { "level3_id": "04597", "name": "Xã Phình Hồ", "type": "Xã" }, { "level3_id": "04600", "name": "Xã Trạm Tấu", "type": "Xã" }, { "level3_id": "04603", "name": "Xã Tà Si Láng", "type": "Xã" }, { "level3_id": "04606", "name": "Xã Pá Hu", "type": "Xã" }, { "level3_id": "04609", "name": "Xã Làng Nhì", "type": "Xã" }, { "level3_id": "04612", "name": "Xã Bản Công", "type": "Xã" }, { "level3_id": "04615", "name": "Xã Bản Mù", "type": "Xã" }, { "level3_id": "04618", "name": "Xã Hát Lìu", "type": "Xã" } ] }, { "level2_id": "140", "name": "Huyện Văn Chấn", "type": "Huyện", "level3s": [ { "level3_id": "04621", "name": "Thị trấn NT Liên Sơn", "type": "Thị trấn" }, { "level3_id": "04627", "name": "Thị trấn NT Trần Phú", "type": "Thị trấn" }, { "level3_id": "04630", "name": "Xã Tú Lệ", "type": "Xã" }, { "level3_id": "04633", "name": "Xã Nậm Búng", "type": "Xã" }, { "level3_id": "04636", "name": "Xã Gia Hội", "type": "Xã" }, { "level3_id": "04639", "name": "Xã Sùng Đô", "type": "Xã" }, { "level3_id": "04642", "name": "Xã Nậm Mười", "type": "Xã" }, { "level3_id": "04645", "name": "Xã An Lương", "type": "Xã" }, { "level3_id": "04648", "name": "Xã Nậm Lành", "type": "Xã" }, { "level3_id": "04651", "name": "Xã Sơn Lương", "type": "Xã" }, { "level3_id": "04654", "name": "Xã Suối Quyền", "type": "Xã" }, { "level3_id": "04657", "name": "Xã Suối Giàng", "type": "Xã" }, { "level3_id": "04666", "name": "Xã Nghĩa Sơn", "type": "Xã" }, { "level3_id": "04669", "name": "Xã Suối Bu", "type": "Xã" }, { "level3_id": "04672", "name": "Thị trấn Sơn Thịnh", "type": "Thị trấn" }, { "level3_id": "04687", "name": "Xã Đại Lịch", "type": "Xã" }, { "level3_id": "04690", "name": "Xã Đồng Khê", "type": "Xã" }, { "level3_id": "04693", "name": "Xã Cát Thịnh", "type": "Xã" }, { "level3_id": "04696", "name": "Xã Tân Thịnh", "type": "Xã" }, { "level3_id": "04699", "name": "Xã Chấn Thịnh", "type": "Xã" }, { "level3_id": "04702", "name": "Xã Bình Thuận", "type": "Xã" }, { "level3_id": "04705", "name": "Xã Thượng Bằng La", "type": "Xã" }, { "level3_id": "04708", "name": "Xã Minh An", "type": "Xã" }, { "level3_id": "04711", "name": "Xã Nghĩa Tâm", "type": "Xã" } ] }, { "level2_id": "141", "name": "Huyện Yên Bình", "type": "Huyện", "level3s": [ { "level3_id": "04714", "name": "Thị trấn Yên Bình", "type": "Thị trấn" }, { "level3_id": "04717", "name": "Thị trấn Thác Bà", "type": "Thị trấn" }, { "level3_id": "04720", "name": "Xã Xuân Long", "type": "Xã" }, { "level3_id": "04726", "name": "Xã Cảm Nhân", "type": "Xã" }, { "level3_id": "04729", "name": "Xã Ngọc Chấn", "type": "Xã" }, { "level3_id": "04732", "name": "Xã Tân Nguyên", "type": "Xã" }, { "level3_id": "04735", "name": "Xã Phúc Ninh", "type": "Xã" }, { "level3_id": "04738", "name": "Xã Bảo Ái", "type": "Xã" }, { "level3_id": "04741", "name": "Xã Mỹ Gia", "type": "Xã" }, { "level3_id": "04744", "name": "Xã Xuân Lai", "type": "Xã" }, { "level3_id": "04747", "name": "Xã Mông Sơn", "type": "Xã" }, { "level3_id": "04750", "name": "Xã Cảm Ân", "type": "Xã" }, { "level3_id": "04753", "name": "Xã Yên Thành", "type": "Xã" }, { "level3_id": "04756", "name": "Xã Tân Hương", "type": "Xã" }, { "level3_id": "04759", "name": "Xã Phúc An", "type": "Xã" }, { "level3_id": "04762", "name": "Xã Bạch Hà", "type": "Xã" }, { "level3_id": "04765", "name": "Xã Vũ Linh", "type": "Xã" }, { "level3_id": "04768", "name": "Xã Đại Đồng", "type": "Xã" }, { "level3_id": "04771", "name": "Xã Vĩnh Kiên", "type": "Xã" }, { "level3_id": "04777", "name": "Xã Thịnh Hưng", "type": "Xã" }, { "level3_id": "04780", "name": "Xã Hán Đà", "type": "Xã" }, { "level3_id": "04783", "name": "Xã Phú Thịnh", "type": "Xã" }, { "level3_id": "04786", "name": "Xã Đại Minh", "type": "Xã" } ] } ] }, { "level1_id": "17", "name": "Tỉnh Hoà Bình", "type": "Tỉnh", "level2s": [ { "level2_id": "148", "name": "Thành phố Hòa Bình", "type": "Thành phố", "level3s": [ { "level3_id": "04789", "name": "Phường Thái Bình", "type": "Phường" }, { "level3_id": "04792", "name": "Phường Tân Hòa", "type": "Phường" }, { "level3_id": "04795", "name": "Phường Thịnh Lang", "type": "Phường" }, { "level3_id": "04798", "name": "Phường Hữu Nghị", "type": "Phường" }, { "level3_id": "04801", "name": "Phường Tân Thịnh", "type": "Phường" }, { "level3_id": "04804", "name": "Phường Đồng Tiến", "type": "Phường" }, { "level3_id": "04807", "name": "Phường Phương Lâm", "type": "Phường" }, { "level3_id": "04813", "name": "Xã Yên Mông", "type": "Xã" }, { "level3_id": "04816", "name": "Phường Quỳnh Lâm", "type": "Phường" }, { "level3_id": "04819", "name": "Phường Dân Chủ", "type": "Phường" }, { "level3_id": "04825", "name": "Xã Hòa Bình", "type": "Xã" }, { "level3_id": "04828", "name": "Phường Thống Nhất", "type": "Phường" }, { "level3_id": "04894", "name": "Phường Kỳ Sơn", "type": "Phường" }, { "level3_id": "04897", "name": "Xã Thịnh Minh", "type": "Xã" }, { "level3_id": "04903", "name": "Xã Hợp Thành", "type": "Xã" }, { "level3_id": "04906", "name": "Xã Quang Tiến", "type": "Xã" }, { "level3_id": "04912", "name": "Xã Mông Hóa", "type": "Xã" }, { "level3_id": "04918", "name": "Phường Trung Minh", "type": "Phường" }, { "level3_id": "04921", "name": "Xã Độc Lập", "type": "Xã" } ] }, { "level2_id": "150", "name": "Huyện Đà Bắc", "type": "Huyện", "level3s": [ { "level3_id": "04831", "name": "Thị trấn Đà Bắc", "type": "Thị trấn" }, { "level3_id": "04834", "name": "Xã Nánh Nghê", "type": "Xã" }, { "level3_id": "04840", "name": "Xã Giáp Đắt", "type": "Xã" }, { "level3_id": "04846", "name": "Xã Mường Chiềng", "type": "Xã" }, { "level3_id": "04849", "name": "Xã Tân Pheo", "type": "Xã" }, { "level3_id": "04852", "name": "Xã Đồng Chum", "type": "Xã" }, { "level3_id": "04855", "name": "Xã Tân Minh", "type": "Xã" }, { "level3_id": "04858", "name": "Xã Đoàn Kết", "type": "Xã" }, { "level3_id": "04861", "name": "Xã Đồng Ruộng", "type": "Xã" }, { "level3_id": "04867", "name": "Xã Tú Lý", "type": "Xã" }, { "level3_id": "04870", "name": "Xã Trung Thành", "type": "Xã" }, { "level3_id": "04873", "name": "Xã Yên Hòa", "type": "Xã" }, { "level3_id": "04876", "name": "Xã Cao Sơn", "type": "Xã" }, { "level3_id": "04879", "name": "Xã Toàn Sơn", "type": "Xã" }, { "level3_id": "04885", "name": "Xã Hiền Lương", "type": "Xã" }, { "level3_id": "04888", "name": "Xã Tiền Phong", "type": "Xã" }, { "level3_id": "04891", "name": "Xã Vầy Nưa", "type": "Xã" } ] }, { "level2_id": "152", "name": "Huyện Lương Sơn", "type": "Huyện", "level3s": [ { "level3_id": "04924", "name": "Thị trấn Lương Sơn", "type": "Thị trấn" }, { "level3_id": "04942", "name": "Xã Lâm Sơn", "type": "Xã" }, { "level3_id": "04945", "name": "Xã Hòa Sơn", "type": "Xã" }, { "level3_id": "04951", "name": "Xã Tân Vinh", "type": "Xã" }, { "level3_id": "04954", "name": "Xã Nhuận Trạch", "type": "Xã" }, { "level3_id": "04957", "name": "Xã Cao Sơn", "type": "Xã" }, { "level3_id": "04960", "name": "Xã Cư Yên", "type": "Xã" }, { "level3_id": "04969", "name": "Xã Liên Sơn", "type": "Xã" }, { "level3_id": "05008", "name": "Xã Cao Dương", "type": "Xã" }, { "level3_id": "05041", "name": "Xã Thanh Sơn", "type": "Xã" }, { "level3_id": "05047", "name": "Xã Thanh Cao", "type": "Xã" } ] }, { "level2_id": "153", "name": "Huyện Kim Bôi", "type": "Huyện", "level3s": [ { "level3_id": "04978", "name": "Thị trấn Bo", "type": "Thị trấn" }, { "level3_id": "04984", "name": "Xã Đú Sáng", "type": "Xã" }, { "level3_id": "04987", "name": "Xã Hùng Sơn", "type": "Xã" }, { "level3_id": "04990", "name": "Xã Bình Sơn", "type": "Xã" }, { "level3_id": "04999", "name": "Xã Tú Sơn", "type": "Xã" }, { "level3_id": "05005", "name": "Xã Vĩnh Tiến", "type": "Xã" }, { "level3_id": "05014", "name": "Xã Đông Bắc", "type": "Xã" }, { "level3_id": "05017", "name": "Xã Xuân Thủy", "type": "Xã" }, { "level3_id": "05026", "name": "Xã Vĩnh Đồng", "type": "Xã" }, { "level3_id": "05035", "name": "Xã Kim Lập", "type": "Xã" }, { "level3_id": "05038", "name": "Xã Hợp Tiến", "type": "Xã" }, { "level3_id": "05065", "name": "Xã Kim Bôi", "type": "Xã" }, { "level3_id": "05068", "name": "Xã Nam Thượng", "type": "Xã" }, { "level3_id": "05077", "name": "Xã Cuối Hạ", "type": "Xã" }, { "level3_id": "05080", "name": "Xã Sào Báy", "type": "Xã" }, { "level3_id": "05083", "name": "Xã Mi Hòa", "type": "Xã" }, { "level3_id": "05086", "name": "Xã Nuông Dăm", "type": "Xã" } ] }, { "level2_id": "154", "name": "Huyện Cao Phong", "type": "Huyện", "level3s": [ { "level3_id": "05089", "name": "Thị trấn Cao Phong", "type": "Thị trấn" }, { "level3_id": "05092", "name": "Xã Bình Thanh", "type": "Xã" }, { "level3_id": "05095", "name": "Xã Thung Nai", "type": "Xã" }, { "level3_id": "05098", "name": "Xã Bắc Phong", "type": "Xã" }, { "level3_id": "05101", "name": "Xã Thu Phong", "type": "Xã" }, { "level3_id": "05104", "name": "Xã Hợp Phong", "type": "Xã" }, { "level3_id": "05110", "name": "Xã Tây Phong", "type": "Xã" }, { "level3_id": "05116", "name": "Xã Dũng Phong", "type": "Xã" }, { "level3_id": "05119", "name": "Xã Nam Phong", "type": "Xã" }, { "level3_id": "05125", "name": "Xã Thạch Yên", "type": "Xã" } ] }, { "level2_id": "155", "name": "Huyện Tân Lạc", "type": "Huyện", "level3s": [ { "level3_id": "05128", "name": "Thị trấn Mãn Đức", "type": "Thị trấn" }, { "level3_id": "05134", "name": "Xã Suối Hoa", "type": "Xã" }, { "level3_id": "05137", "name": "Xã Phú Vinh", "type": "Xã" }, { "level3_id": "05140", "name": "Xã Phú Cường", "type": "Xã" }, { "level3_id": "05143", "name": "Xã Mỹ Hòa", "type": "Xã" }, { "level3_id": "05152", "name": "Xã Quyết Chiến", "type": "Xã" }, { "level3_id": "05158", "name": "Xã Phong Phú", "type": "Xã" }, { "level3_id": "05164", "name": "Xã Tử Nê", "type": "Xã" }, { "level3_id": "05167", "name": "Xã Thanh Hối", "type": "Xã" }, { "level3_id": "05170", "name": "Xã Ngọc Mỹ", "type": "Xã" }, { "level3_id": "05173", "name": "Xã Đông Lai", "type": "Xã" }, { "level3_id": "05176", "name": "Xã Vân Sơn", "type": "Xã" }, { "level3_id": "05182", "name": "Xã Nhân Mỹ", "type": "Xã" }, { "level3_id": "05191", "name": "Xã Lỗ Sơn", "type": "Xã" }, { "level3_id": "05194", "name": "Xã Ngổ Luông", "type": "Xã" }, { "level3_id": "05197", "name": "Xã Gia Mô", "type": "Xã" } ] }, { "level2_id": "156", "name": "Huyện Mai Châu", "type": "Huyện", "level3s": [ { "level3_id": "04882", "name": "Xã Tân Thành", "type": "Xã" }, { "level3_id": "05200", "name": "Thị trấn Mai Châu", "type": "Thị trấn" }, { "level3_id": "05206", "name": "Xã Sơn Thủy", "type": "Xã" }, { "level3_id": "05209", "name": "Xã Pà Cò", "type": "Xã" }, { "level3_id": "05212", "name": "Xã Hang Kia", "type": "Xã" }, { "level3_id": "05221", "name": "Xã Đồng Tân", "type": "Xã" }, { "level3_id": "05224", "name": "Xã Cun Pheo", "type": "Xã" }, { "level3_id": "05227", "name": "Xã Bao La", "type": "Xã" }, { "level3_id": "05233", "name": "Xã Tòng Đậu", "type": "Xã" }, { "level3_id": "05242", "name": "Xã Nà Phòn", "type": "Xã" }, { "level3_id": "05245", "name": "Xã Săm Khóe", "type": "Xã" }, { "level3_id": "05248", "name": "Xã Chiềng Châu", "type": "Xã" }, { "level3_id": "05251", "name": "Xã Mai Hạ", "type": "Xã" }, { "level3_id": "05254", "name": "Xã Thành Sơn", "type": "Xã" }, { "level3_id": "05257", "name": "Xã Mai Hịch", "type": "Xã" }, { "level3_id": "05263", "name": "Xã Vạn Mai", "type": "Xã" } ] }, { "level2_id": "157", "name": "Huyện Lạc Sơn", "type": "Huyện", "level3s": [ { "level3_id": "05266", "name": "Thị trấn Vụ Bản", "type": "Thị trấn" }, { "level3_id": "05269", "name": "Xã Quý Hòa", "type": "Xã" }, { "level3_id": "05272", "name": "Xã Miền Đồi", "type": "Xã" }, { "level3_id": "05275", "name": "Xã Mỹ Thành", "type": "Xã" }, { "level3_id": "05278", "name": "Xã Tuân Đạo", "type": "Xã" }, { "level3_id": "05281", "name": "Xã Văn Nghĩa", "type": "Xã" }, { "level3_id": "05284", "name": "Xã Văn Sơn", "type": "Xã" }, { "level3_id": "05287", "name": "Xã Tân Lập", "type": "Xã" }, { "level3_id": "05290", "name": "Xã Nhân Nghĩa", "type": "Xã" }, { "level3_id": "05293", "name": "Xã Thượng Cốc", "type": "Xã" }, { "level3_id": "05299", "name": "Xã Quyết Thắng", "type": "Xã" }, { "level3_id": "05302", "name": "Xã Xuất Hóa", "type": "Xã" }, { "level3_id": "05305", "name": "Xã Yên Phú", "type": "Xã" }, { "level3_id": "05308", "name": "Xã Bình Hẻm", "type": "Xã" }, { "level3_id": "05320", "name": "Xã Định Cư", "type": "Xã" }, { "level3_id": "05323", "name": "Xã Chí Đạo", "type": "Xã" }, { "level3_id": "05329", "name": "Xã Ngọc Sơn", "type": "Xã" }, { "level3_id": "05332", "name": "Xã Hương Nhượng", "type": "Xã" }, { "level3_id": "05335", "name": "Xã Vũ Bình", "type": "Xã" }, { "level3_id": "05338", "name": "Xã Tự Do", "type": "Xã" }, { "level3_id": "05341", "name": "Xã Yên Nghiệp", "type": "Xã" }, { "level3_id": "05344", "name": "Xã Tân Mỹ", "type": "Xã" }, { "level3_id": "05347", "name": "Xã Ân Nghĩa", "type": "Xã" }, { "level3_id": "05350", "name": "Xã Ngọc Lâu", "type": "Xã" } ] }, { "level2_id": "158", "name": "Huyện Yên Thủy", "type": "Huyện", "level3s": [ { "level3_id": "05353", "name": "Thị trấn Hàng Trạm", "type": "Thị trấn" }, { "level3_id": "05356", "name": "Xã Lạc Sỹ", "type": "Xã" }, { "level3_id": "05362", "name": "Xã Lạc Lương", "type": "Xã" }, { "level3_id": "05365", "name": "Xã Bảo Hiệu", "type": "Xã" }, { "level3_id": "05368", "name": "Xã Đa Phúc", "type": "Xã" }, { "level3_id": "05371", "name": "Xã Hữu Lợi", "type": "Xã" }, { "level3_id": "05374", "name": "Xã Lạc Thịnh", "type": "Xã" }, { "level3_id": "05380", "name": "Xã Đoàn Kết", "type": "Xã" }, { "level3_id": "05383", "name": "Xã Phú Lai", "type": "Xã" }, { "level3_id": "05386", "name": "Xã Yên Trị", "type": "Xã" }, { "level3_id": "05389", "name": "Xã Ngọc Lương", "type": "Xã" } ] }, { "level2_id": "159", "name": "Huyện Lạc Thủy", "type": "Huyện", "level3s": [ { "level3_id": "04981", "name": "Thị trấn Ba Hàng Đồi", "type": "Thị trấn" }, { "level3_id": "05392", "name": "Thị trấn Chi Nê", "type": "Thị trấn" }, { "level3_id": "05395", "name": "Xã Phú Nghĩa", "type": "Xã" }, { "level3_id": "05398", "name": "Xã Phú Thành", "type": "Xã" }, { "level3_id": "05404", "name": "Xã Hưng Thi", "type": "Xã" }, { "level3_id": "05413", "name": "Xã Khoan Dụ", "type": "Xã" }, { "level3_id": "05419", "name": "Xã Đồng Tâm", "type": "Xã" }, { "level3_id": "05422", "name": "Xã Yên Bồng", "type": "Xã" }, { "level3_id": "05425", "name": "Xã Thống Nhất", "type": "Xã" }, { "level3_id": "05428", "name": "Xã An Bình", "type": "Xã" } ] } ] }, { "level1_id": "19", "name": "Tỉnh Thái Nguyên", "type": "Tỉnh", "level2s": [ { "level2_id": "164", "name": "Thành phố Thái Nguyên", "type": "Thành phố", "level3s": [ { "level3_id": "05431", "name": "Phường Quán Triều", "type": "Phường" }, { "level3_id": "05434", "name": "Phường Quang Vinh", "type": "Phường" }, { "level3_id": "05437", "name": "Phường Túc Duyên", "type": "Phường" }, { "level3_id": "05440", "name": "Phường Hoàng Văn Thụ", "type": "Phường" }, { "level3_id": "05443", "name": "Phường Trưng Vương", "type": "Phường" }, { "level3_id": "05446", "name": "Phường Quang Trung", "type": "Phường" }, { "level3_id": "05449", "name": "Phường Phan Đình Phùng", "type": "Phường" }, { "level3_id": "05452", "name": "Phường Tân Thịnh", "type": "Phường" }, { "level3_id": "05455", "name": "Phường Thịnh Đán", "type": "Phường" }, { "level3_id": "05458", "name": "Phường Đồng Quang", "type": "Phường" }, { "level3_id": "05461", "name": "Phường Gia Sàng", "type": "Phường" }, { "level3_id": "05464", "name": "Phường Tân Lập", "type": "Phường" }, { "level3_id": "05467", "name": "Phường Cam Giá", "type": "Phường" }, { "level3_id": "05470", "name": "Phường Phú Xá", "type": "Phường" }, { "level3_id": "05473", "name": "Phường Hương Sơn", "type": "Phường" }, { "level3_id": "05476", "name": "Phường Trung Thành", "type": "Phường" }, { "level3_id": "05479", "name": "Phường Tân Thành", "type": "Phường" }, { "level3_id": "05482", "name": "Phường Tân Long", "type": "Phường" }, { "level3_id": "05485", "name": "Xã Phúc Hà", "type": "Xã" }, { "level3_id": "05488", "name": "Xã Phúc Xuân", "type": "Xã" }, { "level3_id": "05491", "name": "Xã Quyết Thắng", "type": "Xã" }, { "level3_id": "05494", "name": "Xã Phúc Trìu", "type": "Xã" }, { "level3_id": "05497", "name": "Xã Thịnh Đức", "type": "Xã" }, { "level3_id": "05500", "name": "Phường Tích Lương", "type": "Phường" }, { "level3_id": "05503", "name": "Xã Tân Cương", "type": "Xã" }, { "level3_id": "05653", "name": "Xã Sơn Cẩm", "type": "Xã" }, { "level3_id": "05659", "name": "Phường Chùa Hang", "type": "Phường" }, { "level3_id": "05695", "name": "Xã Cao Ngạn", "type": "Xã" }, { "level3_id": "05701", "name": "Xã Linh Sơn", "type": "Xã" }, { "level3_id": "05710", "name": "Phường Đồng Bẩm", "type": "Phường" }, { "level3_id": "05713", "name": "Xã Huống Thượng", "type": "Xã" }, { "level3_id": "05914", "name": "Xã Đồng Liên", "type": "Xã" } ] }, { "level2_id": "165", "name": "Thành phố Sông Công", "type": "Thành phố", "level3s": [ { "level3_id": "05506", "name": "Phường Lương Sơn", "type": "Phường" }, { "level3_id": "05509", "name": "Phường Châu Sơn", "type": "Phường" }, { "level3_id": "05512", "name": "Phường Mỏ Chè", "type": "Phường" }, { "level3_id": "05515", "name": "Phường Cải Đan", "type": "Phường" }, { "level3_id": "05518", "name": "Phường Thắng Lợi", "type": "Phường" }, { "level3_id": "05521", "name": "Phường Phố Cò", "type": "Phường" }, { "level3_id": "05527", "name": "Xã Tân Quang", "type": "Xã" }, { "level3_id": "05528", "name": "Phường Bách Quang", "type": "Phường" }, { "level3_id": "05530", "name": "Xã Bình Sơn", "type": "Xã" }, { "level3_id": "05533", "name": "Xã Bá Xuyên", "type": "Xã" } ] }, { "level2_id": "167", "name": "Huyện Định Hóa", "type": "Huyện", "level3s": [ { "level3_id": "05539", "name": "Xã Linh Thông", "type": "Xã" }, { "level3_id": "05542", "name": "Xã Lam Vỹ", "type": "Xã" }, { "level3_id": "05545", "name": "Xã Quy Kỳ", "type": "Xã" }, { "level3_id": "05548", "name": "Xã Tân Thịnh", "type": "Xã" }, { "level3_id": "05551", "name": "Xã Kim Phượng", "type": "Xã" }, { "level3_id": "05554", "name": "Xã Bảo Linh", "type": "Xã" }, { "level3_id": "05560", "name": "Xã Phúc Chu", "type": "Xã" }, { "level3_id": "05563", "name": "Xã Tân Dương", "type": "Xã" }, { "level3_id": "05566", "name": "Xã Phượng Tiến", "type": "Xã" }, { "level3_id": "05569", "name": "Thị trấn Chợ Chu", "type": "Thị trấn" }, { "level3_id": "05572", "name": "Xã Đồng Thịnh", "type": "Xã" }, { "level3_id": "05575", "name": "Xã Định Biên", "type": "Xã" }, { "level3_id": "05578", "name": "Xã Thanh Định", "type": "Xã" }, { "level3_id": "05581", "name": "Xã Trung Hội", "type": "Xã" }, { "level3_id": "05584", "name": "Xã Trung Lương", "type": "Xã" }, { "level3_id": "05587", "name": "Xã Bình Yên", "type": "Xã" }, { "level3_id": "05590", "name": "Xã Điềm Mặc", "type": "Xã" }, { "level3_id": "05593", "name": "Xã Phú Tiến", "type": "Xã" }, { "level3_id": "05596", "name": "Xã Bộc Nhiêu", "type": "Xã" }, { "level3_id": "05599", "name": "Xã Sơn Phú", "type": "Xã" }, { "level3_id": "05602", "name": "Xã Phú Đình", "type": "Xã" }, { "level3_id": "05605", "name": "Xã Bình Thành", "type": "Xã" } ] }, { "level2_id": "168", "name": "Huyện Phú Lương", "type": "Huyện", "level3s": [ { "level3_id": "05611", "name": "Thị trấn Đu", "type": "Thị trấn" }, { "level3_id": "05614", "name": "Xã Yên Ninh", "type": "Xã" }, { "level3_id": "05617", "name": "Xã Yên Trạch", "type": "Xã" }, { "level3_id": "05620", "name": "Xã Yên Đổ", "type": "Xã" }, { "level3_id": "05623", "name": "Xã Yên Lạc", "type": "Xã" }, { "level3_id": "05626", "name": "Xã Ôn Lương", "type": "Xã" }, { "level3_id": "05629", "name": "Xã Động Đạt", "type": "Xã" }, { "level3_id": "05632", "name": "Xã Phủ Lý", "type": "Xã" }, { "level3_id": "05635", "name": "Xã Phú Đô", "type": "Xã" }, { "level3_id": "05638", "name": "Xã Hợp Thành", "type": "Xã" }, { "level3_id": "05641", "name": "Xã Tức Tranh", "type": "Xã" }, { "level3_id": "05644", "name": "Thị trấn Giang Tiên", "type": "Thị trấn" }, { "level3_id": "05647", "name": "Xã Vô Tranh", "type": "Xã" }, { "level3_id": "05650", "name": "Xã Cổ Lũng", "type": "Xã" } ] }, { "level2_id": "169", "name": "Huyện Đồng Hỷ", "type": "Huyện", "level3s": [ { "level3_id": "05656", "name": "Thị trấn Sông Cầu", "type": "Thị trấn" }, { "level3_id": "05662", "name": "Thị trấn Trại Cau", "type": "Thị trấn" }, { "level3_id": "05665", "name": "Xã Văn Lăng", "type": "Xã" }, { "level3_id": "05668", "name": "Xã Tân Long", "type": "Xã" }, { "level3_id": "05671", "name": "Xã Hòa Bình", "type": "Xã" }, { "level3_id": "05674", "name": "Xã Quang Sơn", "type": "Xã" }, { "level3_id": "05677", "name": "Xã Minh Lập", "type": "Xã" }, { "level3_id": "05680", "name": "Xã Văn Hán", "type": "Xã" }, { "level3_id": "05683", "name": "Xã Hóa Trung", "type": "Xã" }, { "level3_id": "05686", "name": "Xã Khe Mo", "type": "Xã" }, { "level3_id": "05689", "name": "Xã Cây Thị", "type": "Xã" }, { "level3_id": "05692", "name": "Thị trấn Hóa Thượng", "type": "Thị trấn" }, { "level3_id": "05698", "name": "Xã Hợp Tiến", "type": "Xã" }, { "level3_id": "05707", "name": "Xã Nam Hòa", "type": "Xã" } ] }, { "level2_id": "170", "name": "Huyện Võ Nhai", "type": "Huyện", "level3s": [ { "level3_id": "05716", "name": "Thị trấn Đình Cả", "type": "Thị trấn" }, { "level3_id": "05719", "name": "Xã Sảng Mộc", "type": "Xã" }, { "level3_id": "05722", "name": "Xã Nghinh Tường", "type": "Xã" }, { "level3_id": "05725", "name": "Xã Thần Xa", "type": "Xã" }, { "level3_id": "05728", "name": "Xã Vũ Chấn", "type": "Xã" }, { "level3_id": "05731", "name": "Xã Thượng Nung", "type": "Xã" }, { "level3_id": "05734", "name": "Xã Phú Thượng", "type": "Xã" }, { "level3_id": "05737", "name": "Xã Cúc Đường", "type": "Xã" }, { "level3_id": "05740", "name": "Xã La Hiên", "type": "Xã" }, { "level3_id": "05743", "name": "Xã Lâu Thượng", "type": "Xã" }, { "level3_id": "05746", "name": "Xã Tràng Xá", "type": "Xã" }, { "level3_id": "05749", "name": "Xã Phương Giao", "type": "Xã" }, { "level3_id": "05752", "name": "Xã Liên Minh", "type": "Xã" }, { "level3_id": "05755", "name": "Xã Dân Tiến", "type": "Xã" }, { "level3_id": "05758", "name": "Xã Bình Long", "type": "Xã" } ] }, { "level2_id": "171", "name": "Huyện Đại Từ", "type": "Huyện", "level3s": [ { "level3_id": "05761", "name": "Thị trấn Hùng Sơn", "type": "Thị trấn" }, { "level3_id": "05767", "name": "Xã Phúc Lương", "type": "Xã" }, { "level3_id": "05770", "name": "Xã Minh Tiến", "type": "Xã" }, { "level3_id": "05773", "name": "Xã Yên Lãng", "type": "Xã" }, { "level3_id": "05776", "name": "Xã Đức Lương", "type": "Xã" }, { "level3_id": "05779", "name": "Xã Phú Cường", "type": "Xã" }, { "level3_id": "05785", "name": "Xã Phú Lạc", "type": "Xã" }, { "level3_id": "05788", "name": "Xã Tân Linh", "type": "Xã" }, { "level3_id": "05791", "name": "Xã Phú Thịnh", "type": "Xã" }, { "level3_id": "05794", "name": "Xã Phục Linh", "type": "Xã" }, { "level3_id": "05797", "name": "Xã Phú Xuyên", "type": "Xã" }, { "level3_id": "05800", "name": "Xã Bản Ngoại", "type": "Xã" }, { "level3_id": "05803", "name": "Xã Tiên Hội", "type": "Xã" }, { "level3_id": "05809", "name": "Xã Cù Vân", "type": "Xã" }, { "level3_id": "05812", "name": "Xã Hà Thượng", "type": "Xã" }, { "level3_id": "05815", "name": "Xã La Bằng", "type": "Xã" }, { "level3_id": "05818", "name": "Xã Hoàng Nông", "type": "Xã" }, { "level3_id": "05821", "name": "Xã Khôi Kỳ", "type": "Xã" }, { "level3_id": "05824", "name": "Xã An Khánh", "type": "Xã" }, { "level3_id": "05827", "name": "Xã Tân Thái", "type": "Xã" }, { "level3_id": "05830", "name": "Xã Bình Thuận", "type": "Xã" }, { "level3_id": "05833", "name": "Xã Lục Ba", "type": "Xã" }, { "level3_id": "05836", "name": "Xã Mỹ Yên", "type": "Xã" }, { "level3_id": "05842", "name": "Xã Văn Yên", "type": "Xã" }, { "level3_id": "05845", "name": "Xã Vạn Phú", "type": "Xã" }, { "level3_id": "05848", "name": "Xã Cát Nê", "type": "Xã" }, { "level3_id": "05851", "name": "Thị trấn Quân Chu", "type": "Thị trấn" } ] }, { "level2_id": "172", "name": "Thành phố Phổ Yên", "type": "Thành phố", "level3s": [ { "level3_id": "05854", "name": "Phường Bãi Bông", "type": "Phường" }, { "level3_id": "05857", "name": "Phường Bắc Sơn", "type": "Phường" }, { "level3_id": "05860", "name": "Phường Ba Hàng", "type": "Phường" }, { "level3_id": "05863", "name": "Xã Phúc Tân", "type": "Xã" }, { "level3_id": "05866", "name": "Xã Phúc Thuận", "type": "Xã" }, { "level3_id": "05869", "name": "Phường Hồng Tiến", "type": "Phường" }, { "level3_id": "05872", "name": "Xã Minh Đức", "type": "Xã" }, { "level3_id": "05875", "name": "Phường Đắc Sơn", "type": "Phường" }, { "level3_id": "05878", "name": "Phường Đồng Tiến", "type": "Phường" }, { "level3_id": "05881", "name": "Xã Thành Công", "type": "Xã" }, { "level3_id": "05884", "name": "Phường Tiên Phong", "type": "Phường" }, { "level3_id": "05887", "name": "Xã Vạn Phái", "type": "Xã" }, { "level3_id": "05890", "name": "Phường Nam Tiến", "type": "Phường" }, { "level3_id": "05893", "name": "Phường Tân Hương", "type": "Phường" }, { "level3_id": "05896", "name": "Phường Đông Cao", "type": "Phường" }, { "level3_id": "05899", "name": "Phường Trung Thành", "type": "Phường" }, { "level3_id": "05902", "name": "Phường Tân Phú", "type": "Phường" }, { "level3_id": "05905", "name": "Phường Thuận Thành", "type": "Phường" } ] }, { "level2_id": "173", "name": "Huyện Phú Bình", "type": "Huyện", "level3s": [ { "level3_id": "05908", "name": "Thị trấn Hương Sơn", "type": "Thị trấn" }, { "level3_id": "05911", "name": "Xã Bàn Đạt", "type": "Xã" }, { "level3_id": "05917", "name": "Xã Tân Khánh", "type": "Xã" }, { "level3_id": "05920", "name": "Xã Tân Kim", "type": "Xã" }, { "level3_id": "05923", "name": "Xã Tân Thành", "type": "Xã" }, { "level3_id": "05926", "name": "Xã Đào Xá", "type": "Xã" }, { "level3_id": "05929", "name": "Xã Bảo Lý", "type": "Xã" }, { "level3_id": "05932", "name": "Xã Thượng Đình", "type": "Xã" }, { "level3_id": "05935", "name": "Xã Tân Hòa", "type": "Xã" }, { "level3_id": "05938", "name": "Xã Nhã Lộng", "type": "Xã" }, { "level3_id": "05941", "name": "Xã Điềm Thụy", "type": "Xã" }, { "level3_id": "05944", "name": "Xã Xuân Phương", "type": "Xã" }, { "level3_id": "05947", "name": "Xã Tân Đức", "type": "Xã" }, { "level3_id": "05950", "name": "Xã Úc Kỳ", "type": "Xã" }, { "level3_id": "05953", "name": "Xã Lương Phú", "type": "Xã" }, { "level3_id": "05956", "name": "Xã Nga My", "type": "Xã" }, { "level3_id": "05959", "name": "Xã Kha Sơn", "type": "Xã" }, { "level3_id": "05962", "name": "Xã Thanh Ninh", "type": "Xã" }, { "level3_id": "05965", "name": "Xã Dương Thành", "type": "Xã" }, { "level3_id": "05968", "name": "Xã Hà Châu", "type": "Xã" } ] } ] }, { "level1_id": "20", "name": "Tỉnh Lạng Sơn", "type": "Tỉnh", "level2s": [ { "level2_id": "178", "name": "Thành phố Lạng Sơn", "type": "Thành phố", "level3s": [ { "level3_id": "05971", "name": "Phường Hoàng Văn Thụ", "type": "Phường" }, { "level3_id": "05974", "name": "Phường Tam Thanh", "type": "Phường" }, { "level3_id": "05977", "name": "Phường Vĩnh Trại", "type": "Phường" }, { "level3_id": "05980", "name": "Phường Đông Kinh", "type": "Phường" }, { "level3_id": "05983", "name": "Phường Chi Lăng", "type": "Phường" }, { "level3_id": "05986", "name": "Xã Hoàng Đồng", "type": "Xã" }, { "level3_id": "05989", "name": "Xã Quảng Lạc", "type": "Xã" }, { "level3_id": "05992", "name": "Xã Mai Pha", "type": "Xã" } ] }, { "level2_id": "180", "name": "Huyện Tràng Định", "type": "Huyện", "level3s": [ { "level3_id": "05998", "name": "Xã Khánh Long", "type": "Xã" }, { "level3_id": "06001", "name": "Xã Đoàn Kết", "type": "Xã" }, { "level3_id": "06004", "name": "Xã Quốc Khánh", "type": "Xã" }, { "level3_id": "06010", "name": "Xã Cao Minh", "type": "Xã" }, { "level3_id": "06013", "name": "Xã Chí Minh", "type": "Xã" }, { "level3_id": "06016", "name": "Xã Tri Phương", "type": "Xã" }, { "level3_id": "06019", "name": "Xã Tân Tiến", "type": "Xã" }, { "level3_id": "06022", "name": "Xã Tân Yên", "type": "Xã" }, { "level3_id": "06025", "name": "Xã Đội Cấn", "type": "Xã" }, { "level3_id": "06028", "name": "Xã Tân Minh", "type": "Xã" }, { "level3_id": "06031", "name": "Xã Kim Đồng", "type": "Xã" }, { "level3_id": "06034", "name": "Xã Chi Lăng", "type": "Xã" }, { "level3_id": "06037", "name": "Xã Trung Thành", "type": "Xã" }, { "level3_id": "06040", "name": "Thị trấn Thất Khê", "type": "Thị trấn" }, { "level3_id": "06043", "name": "Xã Đào Viên", "type": "Xã" }, { "level3_id": "06046", "name": "Xã Đề Thám", "type": "Xã" }, { "level3_id": "06049", "name": "Xã Kháng Chiến", "type": "Xã" }, { "level3_id": "06055", "name": "Xã Hùng Sơn", "type": "Xã" }, { "level3_id": "06058", "name": "Xã Quốc Việt", "type": "Xã" }, { "level3_id": "06061", "name": "Xã Hùng Việt", "type": "Xã" } ] }, { "level2_id": "181", "name": "Huyện Bình Gia", "type": "Huyện", "level3s": [ { "level3_id": "06067", "name": "Xã Hưng Đạo", "type": "Xã" }, { "level3_id": "06070", "name": "Xã Vĩnh Yên", "type": "Xã" }, { "level3_id": "06073", "name": "Xã Hoa Thám", "type": "Xã" }, { "level3_id": "06076", "name": "Xã Quý Hòa", "type": "Xã" }, { "level3_id": "06079", "name": "Xã Hồng Phong", "type": "Xã" }, { "level3_id": "06082", "name": "Xã Yên Lỗ", "type": "Xã" }, { "level3_id": "06085", "name": "Xã Thiện Hòa", "type": "Xã" }, { "level3_id": "06088", "name": "Xã Quang Trung", "type": "Xã" }, { "level3_id": "06091", "name": "Xã Thiện Thuật", "type": "Xã" }, { "level3_id": "06094", "name": "Xã Minh Khai", "type": "Xã" }, { "level3_id": "06097", "name": "Xã Thiện Long", "type": "Xã" }, { "level3_id": "06100", "name": "Xã Hoàng Văn Thụ", "type": "Xã" }, { "level3_id": "06103", "name": "Xã Hòa Bình", "type": "Xã" }, { "level3_id": "06106", "name": "Xã Mông Ân", "type": "Xã" }, { "level3_id": "06109", "name": "Xã Tân Hòa", "type": "Xã" }, { "level3_id": "06112", "name": "Thị trấn Bình Gia", "type": "Thị trấn" }, { "level3_id": "06115", "name": "Xã Hồng Thái", "type": "Xã" }, { "level3_id": "06118", "name": "Xã Bình La", "type": "Xã" }, { "level3_id": "06121", "name": "Xã Tân Văn", "type": "Xã" } ] }, { "level2_id": "182", "name": "Huyện Văn Lãng", "type": "Huyện", "level3s": [ { "level3_id": "06124", "name": "Thị trấn Na Sầm", "type": "Thị trấn" }, { "level3_id": "06127", "name": "Xã Trùng Khánh", "type": "Xã" }, { "level3_id": "06133", "name": "Xã Bắc La", "type": "Xã" }, { "level3_id": "06136", "name": "Xã Thụy Hùng", "type": "Xã" }, { "level3_id": "06139", "name": "Xã Bắc Hùng", "type": "Xã" }, { "level3_id": "06142", "name": "Xã Tân Tác", "type": "Xã" }, { "level3_id": "06148", "name": "Xã Thanh Long", "type": "Xã" }, { "level3_id": "06151", "name": "Xã Hội Hoan", "type": "Xã" }, { "level3_id": "06154", "name": "Xã Bắc Việt", "type": "Xã" }, { "level3_id": "06157", "name": "Xã Hoàng Việt", "type": "Xã" }, { "level3_id": "06160", "name": "Xã Gia Miễn", "type": "Xã" }, { "level3_id": "06163", "name": "Xã Thành Hòa", "type": "Xã" }, { "level3_id": "06166", "name": "Xã Tân Thanh", "type": "Xã" }, { "level3_id": "06172", "name": "Xã Tân Mỹ", "type": "Xã" }, { "level3_id": "06175", "name": "Xã Hồng Thái", "type": "Xã" }, { "level3_id": "06178", "name": "Xã  Hoàng Văn Thụ", "type": "Xã" }, { "level3_id": "06181", "name": "Xã Nhạc Kỳ", "type": "Xã" } ] }, { "level2_id": "183", "name": "Huyện Cao Lộc", "type": "Huyện", "level3s": [ { "level3_id": "06184", "name": "Thị trấn Đồng Đăng", "type": "Thị trấn" }, { "level3_id": "06187", "name": "Thị trấn Cao Lộc", "type": "Thị trấn" }, { "level3_id": "06190", "name": "Xã Bảo Lâm", "type": "Xã" }, { "level3_id": "06193", "name": "Xã Thanh Lòa", "type": "Xã" }, { "level3_id": "06196", "name": "Xã Cao Lâu", "type": "Xã" }, { "level3_id": "06199", "name": "Xã Thạch Đạn", "type": "Xã" }, { "level3_id": "06202", "name": "Xã Xuất Lễ", "type": "Xã" }, { "level3_id": "06205", "name": "Xã Hồng Phong", "type": "Xã" }, { "level3_id": "06208", "name": "Xã Thụy Hùng", "type": "Xã" }, { "level3_id": "06211", "name": "Xã Lộc Yên", "type": "Xã" }, { "level3_id": "06214", "name": "Xã Phú Xá", "type": "Xã" }, { "level3_id": "06217", "name": "Xã Bình Trung", "type": "Xã" }, { "level3_id": "06220", "name": "Xã Hải Yến", "type": "Xã" }, { "level3_id": "06223", "name": "Xã Hòa Cư", "type": "Xã" }, { "level3_id": "06226", "name": "Xã Hợp Thành", "type": "Xã" }, { "level3_id": "06232", "name": "Xã Công Sơn", "type": "Xã" }, { "level3_id": "06235", "name": "Xã Gia Cát", "type": "Xã" }, { "level3_id": "06238", "name": "Xã Mẫu Sơn", "type": "Xã" }, { "level3_id": "06241", "name": "Xã Xuân Long", "type": "Xã" }, { "level3_id": "06244", "name": "Xã Tân Liên", "type": "Xã" }, { "level3_id": "06247", "name": "Xã Yên Trạch", "type": "Xã" }, { "level3_id": "06250", "name": "Xã Tân Thành", "type": "Xã" } ] }, { "level2_id": "184", "name": "Huyện Văn Quan", "type": "Huyện", "level3s": [ { "level3_id": "06253", "name": "Thị trấn Văn Quan", "type": "Thị trấn" }, { "level3_id": "06256", "name": "Xã Trấn Ninh", "type": "Xã" }, { "level3_id": "06268", "name": "Xã Liên Hội", "type": "Xã" }, { "level3_id": "06274", "name": "Xã Hòa Bình", "type": "Xã" }, { "level3_id": "06277", "name": "Xã Tú Xuyên", "type": "Xã" }, { "level3_id": "06280", "name": "Xã Điềm He", "type": "Xã" }, { "level3_id": "06283", "name": "Xã An Sơn", "type": "Xã" }, { "level3_id": "06286", "name": "Xã Khánh Khê", "type": "Xã" }, { "level3_id": "06292", "name": "Xã Lương Năng", "type": "Xã" }, { "level3_id": "06298", "name": "Xã Bình Phúc", "type": "Xã" }, { "level3_id": "06307", "name": "Xã Tân Đoàn", "type": "Xã" }, { "level3_id": "06313", "name": "Xã Tri Lễ", "type": "Xã" }, { "level3_id": "06316", "name": "Xã Tràng Phái", "type": "Xã" }, { "level3_id": "06319", "name": "Xã Yên Phúc", "type": "Xã" }, { "level3_id": "06322", "name": "Xã Hữu Lễ", "type": "Xã" } ] }, { "level2_id": "185", "name": "Huyện Bắc Sơn", "type": "Huyện", "level3s": [ { "level3_id": "06325", "name": "Thị trấn Bắc Sơn", "type": "Thị trấn" }, { "level3_id": "06328", "name": "Xã Long Đống", "type": "Xã" }, { "level3_id": "06331", "name": "Xã Vạn Thủy", "type": "Xã" }, { "level3_id": "06337", "name": "Xã Đồng ý", "type": "Xã" }, { "level3_id": "06340", "name": "Xã Tân Tri", "type": "Xã" }, { "level3_id": "06343", "name": "Xã Bắc Quỳnh", "type": "Xã" }, { "level3_id": "06349", "name": "Xã Hưng Vũ", "type": "Xã" }, { "level3_id": "06352", "name": "Xã Tân Lập", "type": "Xã" }, { "level3_id": "06355", "name": "Xã Vũ Sơn", "type": "Xã" }, { "level3_id": "06358", "name": "Xã Chiêu Vũ", "type": "Xã" }, { "level3_id": "06361", "name": "Xã Tân Hương", "type": "Xã" }, { "level3_id": "06364", "name": "Xã Chiến Thắng", "type": "Xã" }, { "level3_id": "06367", "name": "Xã Vũ Lăng", "type": "Xã" }, { "level3_id": "06370", "name": "Xã Trấn Yên", "type": "Xã" }, { "level3_id": "06373", "name": "Xã Vũ Lễ", "type": "Xã" }, { "level3_id": "06376", "name": "Xã Nhất Hòa", "type": "Xã" }, { "level3_id": "06379", "name": "Xã Tân Thành", "type": "Xã" }, { "level3_id": "06382", "name": "Xã Nhất Tiến", "type": "Xã" } ] }, { "level2_id": "186", "name": "Huyện Hữu Lũng", "type": "Huyện", "level3s": [ { "level3_id": "06385", "name": "Thị trấn Hữu Lũng", "type": "Thị trấn" }, { "level3_id": "06388", "name": "Xã Hữu Liên", "type": "Xã" }, { "level3_id": "06391", "name": "Xã Yên Bình", "type": "Xã" }, { "level3_id": "06394", "name": "Xã Quyết Thắng", "type": "Xã" }, { "level3_id": "06397", "name": "Xã Hòa Bình", "type": "Xã" }, { "level3_id": "06400", "name": "Xã Yên Thịnh", "type": "Xã" }, { "level3_id": "06403", "name": "Xã Yên Sơn", "type": "Xã" }, { "level3_id": "06406", "name": "Xã Thiện Tân", "type": "Xã" }, { "level3_id": "06412", "name": "Xã Yên Vượng", "type": "Xã" }, { "level3_id": "06415", "name": "Xã Minh Tiến", "type": "Xã" }, { "level3_id": "06418", "name": "Xã Nhật Tiến", "type": "Xã" }, { "level3_id": "06421", "name": "Xã Thanh Sơn", "type": "Xã" }, { "level3_id": "06424", "name": "Xã Đồng Tân", "type": "Xã" }, { "level3_id": "06427", "name": "Xã Cai Kinh", "type": "Xã" }, { "level3_id": "06430", "name": "Xã Hòa Lạc", "type": "Xã" }, { "level3_id": "06433", "name": "Xã Vân Nham", "type": "Xã" }, { "level3_id": "06436", "name": "Xã Đồng Tiến", "type": "Xã" }, { "level3_id": "06442", "name": "Xã Tân Thành", "type": "Xã" }, { "level3_id": "06445", "name": "Xã Hòa Sơn", "type": "Xã" }, { "level3_id": "06448", "name": "Xã Minh Sơn", "type": "Xã" }, { "level3_id": "06451", "name": "Xã Hồ Sơn", "type": "Xã" }, { "level3_id": "06457", "name": "Xã Minh Hòa", "type": "Xã" }, { "level3_id": "06460", "name": "Xã Hòa Thắng", "type": "Xã" } ] }, { "level2_id": "187", "name": "Huyện Chi Lăng", "type": "Huyện", "level3s": [ { "level3_id": "06463", "name": "Thị trấn Đồng Mỏ", "type": "Thị trấn" }, { "level3_id": "06466", "name": "Thị trấn Chi Lăng", "type": "Thị trấn" }, { "level3_id": "06469", "name": "Xã Vân An", "type": "Xã" }, { "level3_id": "06472", "name": "Xã Vân Thủy", "type": "Xã" }, { "level3_id": "06475", "name": "Xã Gia Lộc", "type": "Xã" }, { "level3_id": "06478", "name": "Xã Bắc Thủy", "type": "Xã" }, { "level3_id": "06481", "name": "Xã Chiến Thắng", "type": "Xã" }, { "level3_id": "06484", "name": "Xã Mai Sao", "type": "Xã" }, { "level3_id": "06487", "name": "Xã Bằng Hữu", "type": "Xã" }, { "level3_id": "06490", "name": "Xã Thượng Cường", "type": "Xã" }, { "level3_id": "06493", "name": "Xã Bằng Mạc", "type": "Xã" }, { "level3_id": "06496", "name": "Xã Nhân Lý", "type": "Xã" }, { "level3_id": "06499", "name": "Xã Lâm Sơn", "type": "Xã" }, { "level3_id": "06502", "name": "Xã Liên Sơn", "type": "Xã" }, { "level3_id": "06505", "name": "Xã Vạn Linh", "type": "Xã" }, { "level3_id": "06508", "name": "Xã Hòa Bình", "type": "Xã" }, { "level3_id": "06514", "name": "Xã Hữu Kiên", "type": "Xã" }, { "level3_id": "06517", "name": "Xã Quan Sơn", "type": "Xã" }, { "level3_id": "06520", "name": "Xã Y Tịch", "type": "Xã" }, { "level3_id": "06523", "name": "Xã Chi Lăng", "type": "Xã" } ] }, { "level2_id": "188", "name": "Huyện Lộc Bình", "type": "Huyện", "level3s": [ { "level3_id": "06526", "name": "Thị trấn Na Dương", "type": "Thị trấn" }, { "level3_id": "06529", "name": "Thị trấn Lộc Bình",]; // Dán JSON đầy đủ của bạn vào đây


    --></section><!-- /Login Register Section -->

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
  
  <script>
  const urlParams = new URLSearchParams(window.location.search);
  const tab = urlParams.get('tab') || 'login';
  const trigger = document.querySelector(`a[href="#login-register-${tab}-form"]`);
  if (trigger) new bootstrap.Tab(trigger).show();
</script>


</body>

</html>