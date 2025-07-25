<%-- 
    Document   : Profile
    Created on : Jun 1, 2025, 9:33:25 PM
    Author     : chinhnv11
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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

     
        <main class="main">

            <!-- Page Title -->
            <div class="page-title light-background">
          <jsp:include page="public/Header.jsp"></jsp:include>


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
                                            <a class="nav-link" data-bs-toggle="tab" href="#settings">
                                                <i class="bi bi-gear"></i>
                                                <span>Account Settings</span>
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
                                    
                                    <!-- Wishlist Tab -->
                              

                                    <!-- Payment Methods Tab -->
                                   

                                    <!-- Reviews Tab -->
                                    
                                    <!-- Addresses Tab -->
                                

                                    <!-- Settings Tab -->
                                    <div class="tab-pane fade" id="settings">
                                        <div class="section-header" data-aos="fade-up">
                                            <h2>Account Settings</h2>
                                        </div>

                                        <div class="settings-content">
                                            <!-- Personal Information -->
                                            <div class="settings-section" data-aos="fade-up">
                                                <h3>Personal Information</h3>
                                                <form  method="post" action="${pageContext.request.contextPath}/updateProfile">
                                                    <div class="row g-3">
                                                        <div class="col-md-6">
                                                            <label for="firstName" class="form-label">Full Name</label>
                                                            <input type="text" class="form-control" name="fullName" id="firstName" value="${sessionScope.user.fullName}" required="">
                                                        </div>

                                                        <div class="col-md-6">
                                                            <label for="email" class="form-label">Email</label>
                                                            <input type="email" class="form-control" name="email" id="email" value="${sessionScope.user.email}" required="">
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label for="phone" class="form-label">Phone</label>
                                                            <input type="tel" class="form-control" id="phone" name="phoneNumber" value="${sessionScope.user.phoneNumber}">
                                                        </div>
                                                    </div>

                                                    <div class="form-buttons">
                                                        <button type="submit" class="btn-save">Save Changes</button>
                                                    </div>

                                                   
                                                </form>
                                            </div>

                                            <!-- Email Preferences -->
                                            

                                            <!-- Security Settings -->
                                            <div class="settings-section">
                                                <h3>Security</h3>
                                                <form action="${pageContext.request.contextPath}/changepassword" method="post" class="settings-form">
                                                    <div class="form-group">
                                                        <label for="currentPassword">Current Password</label>
                                                        <input type="password" id="currentPassword" name="currentPassword" required>
                                                    </div>
                                                    <div class="form-row">
                                                        <div class="form-group half-width">
                                                            <label for="newPassword">New Password</label>
                                                            <input type="password" id="newPassword" name="newPassword" required>
                                                        </div>
                                                        <div class="form-group half-width">
                                                            <label for="confirmPassword">Confirm Password</label>
                                                            <input type="password" id="confirmPassword" name="confirmPassword" required>
                                                        </div>
                                                    </div>
                                                    <div class="form-buttons">
                                                        <button type="submit" class="btn-save">Update Password</button>
                                                    </div>
                                                    <div class="form-message error">${error}</div>
                                                    <div class="form-message success">${success}</div>
                                                </form>
                                            </div>
                                            <!-- Delete Account -->
                                            <div class="settings-section danger-zone" data-aos="fade-up" data-aos-delay="300">
                                                <h3>Delete Account</h3>
                                                <div class="danger-zone-content">
                                                    <p>Once you delete your account, there is no going back. Please be certain.</p>
                                                    <button type="button" class="btn-danger">Delete Account</button>
                                                </div>
                                            </div>
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
