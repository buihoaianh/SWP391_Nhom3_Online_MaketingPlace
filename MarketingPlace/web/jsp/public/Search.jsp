<%-- 
    Document   : Search
    Created on : Jul 22, 2025, 1:28:35 AM
    Author     : tulok
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>Search Results - eStore Bootstrap Template</title>
  <meta name="description" content="">
  <meta name="keywords" content="">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Fonts -->
  <link href="https://fonts.googleapis.com" rel="preconnect">
  <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Nunito:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/drift-zoom/drift-basic.css" rel="stylesheet">

  <!-- Main CSS File -->
  <link href="assets/css/main.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: eStore
  * Template URL: https://bootstrapmade.com/estore-bootstrap-ecommerce-template/
  * Updated: Apr 26 2025 with Bootstrap v5.3.5
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body class="search-results-page">

  <jsp:include page="Header.jsp"></jsp:include>

  <main class="main">

    <!-- Search Results Header Section -->
    <section id="search-results-header" class="search-results-header section">

      <div class="container" data-aos="fade-up" data-aos-delay="100">

        <div class="search-results-header">
          <div class="row align-items-center">
            <div class="col-lg-6 mb-4 mb-lg-0">
              <div class="results-count" data-aos="fade-right" data-aos-delay="200">
                <h2>Search Results</h2>
                <p>We found <span class="results-number">${resultCount}</span> results for <span class="search-term">"${query}"</span></p>
              </div>
            </div>
            <div class="col-lg-6" data-aos="fade-left" data-aos-delay="300">
              <form method="post" class="search-form">
                <div class="input-group">
                  <input type="text" class="form-control" placeholder="Search..." name="search" value="${query}" required="">
                  <button class="btn search-btn" type="submit">
                    <i class="bi bi-search"></i>
                  </button>
                </div>
              </form>
            </div>
          </div>

          <div class="search-filters mt-4" data-aos="fade-up" data-aos-delay="400">
            <div class="row">
              <div class="col-lg-4 text-lg-end mt-3 mt-lg-0">
                <div class="sort-options">
                  <label for="sort-select" class="me-2">Sort by:</label>
                  <select id="sort-select" class="form-select form-select-sm d-inline-block w-auto">
                    <option value="relevance">Relevance</option>
                    <option value="date-desc">Newest First</option>
                    <option value="date-asc">Oldest First</option>
                    <option value="title-asc">Title A-Z</option>
                    <option value="title-desc">Title Z-A</option>
                  </select>
                </div>
              </div>
            </div>
          </div>
        </div>

      </div>

    </section><!-- /Search Results Header Section -->

    <!-- Search Product List Section -->
    <section id="search-product-list" class="search-product-list section">

      <div class="container" data-aos="fade-up" data-aos-delay="100">

        <div class="row g-4">
          <!-- Product 1 -->
        <c:forEach items="${results}" var="item">
            <div class="col-6 col-lg-3">
            <div class="product-card" data-aos="zoom-in">
              <div class="product-image">
                <img src="${item.thumbnailURL}" class="main-image img-fluid" alt="Product">
                
                <div class="product-overlay">
                  <div class="product-actions">
                   
                    <button type="button" class="action-btn" data-bs-toggle="tooltip" title="Add to Cart">
                      <i class="bi bi-cart-plus"></i>
                    </button>
                  </div>
                </div>
              </div>
              <div class="product-details">
                <div class="product-category">${item.categoryName}</div>
                <h4 class="product-title"><a href="DetailProduct?pid=${item.productId}">${item.productName}</a></h4>
                <div class="product-meta">
                  <div class="product-price">$${item.price}</div>
                  <div class="product-rating">
                    <i class="bi bi-star-fill"></i>
                    4.8 <span>(42)</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </c:forEach>
        </div>

      </div>

    </section><!-- /Search Product List Section -->

    <!-- Category Pagination Section -->
    <section id="category-pagination" class="category-pagination section">

      <div class="container">
        <nav class="d-flex justify-content-center" aria-label="Page navigation">
          <ul>
            <li>
              <a href="#" aria-label="Previous page">
                <i class="bi bi-arrow-left"></i>
                <span class="d-none d-sm-inline">Previous</span>
              </a>
            </li>

            <li><a href="#" class="active">1</a></li>
            <li><a href="#">2</a></li>
            <li><a href="#">3</a></li>
            <li class="ellipsis">...</li>
            <li><a href="#">8</a></li>
            <li><a href="#">9</a></li>
            <li><a href="#">10</a></li>

            <li>
              <a href="#" aria-label="Next page">
                <span class="d-none d-sm-inline">Next</span>
                <i class="bi bi-arrow-right"></i>
              </a>
            </li>
          </ul>
        </nav>
      </div>

    </section><!-- /Category Pagination Section -->

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
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/imagesloaded/imagesloaded.pkgd.min.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/drift-zoom/Drift.min.js"></script>
  <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>

  <!-- Main JS File -->
  <script src="assets/js/main.js"></script>

</body>

</html>
