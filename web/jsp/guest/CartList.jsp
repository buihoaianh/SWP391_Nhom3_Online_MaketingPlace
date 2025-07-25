<%@page import="model.ProductVariant"%>
<%@page import="model.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Bootstrap Icons -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

        <style>
            .input-group .form-control.quantity-input {
                max-width: 60px;
            }
            .cart-item img {
                border-radius: 8px;
            }
        </style>

    </head>
    <body>
        <%
            ArrayList<Cart> cart = (ArrayList<Cart>) session.getAttribute("cart");
            int cartSize = (cart != null) ? cart.size() : 0;
        %>
        <jsp:include page="/jsp/public/Header.jsp"></jsp:include>


        <div class="container mt-5">
            <h1 class="mb-4">🛒 Your Shopping Cart</h1>
            <%
                if (cart == null || cart.isEmpty()) {
            %>
            <div class="alert alert-info" role="alert">
                Your cart is empty!
            </div>
            <%
            } else {
            %>
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
                        <th>Action</th>
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
                            <div class="input-group input-group-sm justify-content-center">
                                <button class="btn btn-outline-secondary" onclick="updateQuantity(<%= variant.getProductVariantId()%>, -1)">-</button>
                                <input type="number" class="form-control text-center" value="<%= item.getQuantity()%>" readonly>
                                <button class="btn btn-outline-secondary" onclick="updateQuantity(<%= variant.getProductVariantId()%>, 1)">+</button>
                            </div>
                        </td>
                        <td>$<%= String.format("%.0f", total)%></td>
                        <td>
                            <button onclick="updateQuantity(<%= variant.getProductVariantId()%>, -<%= item.getQuantity()%>)" class="btn btn-danger btn-sm">
                                <i class="bi bi-trash"></i> Remove
                            </button>
                        </td>
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
            <div class="text-end mt-3">
                <a href="<%= request.getContextPath()%>/confirm-checkout" class="btn btn-success btn-lg">
                    <i class="bi bi-credit-card"></i> Checkout
                </a>
            </div>
            <% }%>
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

        <!-- Bootstrap JS and Popper -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
        <script>
                                function updateQuantity(variantId, change) {
                                    fetch('/MarketingPlace/addToCart?variantId=' + variantId + '&quantity=' + change, {
                                        method: 'POST'
                                    })
                                            .then(response => response.json())
                                            .then(data => {
                                                if (data.success) {
                                                    window.location.href = "cartList";
                                                } else {
                                                    alert('Failed to update quantity: ' + data.message);
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
