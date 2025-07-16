<%-- 
    Document   : Category
    Created on : Jul 15, 2025, 11:08:42 AM
    Author     : tulok
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <title>Category - eStore Bootstrap Template</title>
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

    <body class="category-page">

        <jsp:include page="Header.jsp"></jsp:include>

            <main class="main">

                <!-- Page Title -->
                <div class="page-title light-background">
                    <div class="container d-lg-flex justify-content-between align-items-center">
                        <h1 class="mb-2 mb-lg-0">Category</h1>
                        <nav class="breadcrumbs">
                            <ol>
                                <li><a href="index.html">Home</a></li>
                                <li class="current">Category</li>
                            </ol>
                        </nav>
                    </div>
                </div><!-- End Page Title -->

                <div class="container">
                    <div class="row">

                        <div class="col-lg-4 sidebar">

                            <div class="widgets-container">

                                <!-- Product Categories Widget -->

                                <!-- Pricing Range Widget -->

                                <!-- Brand Filter Widget -->
                                <h3 class="brand-filter-widget widget-item">Filter by Brand</h3><!--/Brand Filter Widget -->

                                <!-- Color Filter Widget -->
                                <div class="color-filter-widget widget-item">

                                    <h3 class="widget-title">Filter by Color</h3>

                                    <div class="color-filter-content">
                                        <div class="color-options">
                                            <div class="form-check color-option">
                                                <input class="form-check-input" type="checkbox" value="black" id="color-black">
                                                <label class="form-check-label" for="color-black">
                                                    <span class="color-swatch" style="background-color: #000000;" title="Black"></span>
                                                </label>
                                            </div>

                                            <div class="form-check color-option">
                                                <input class="form-check-input" type="checkbox" value="white" id="color-white">
                                                <label class="form-check-label" for="color-white">
                                                    <span class="color-swatch" style="background-color: #ffffff;" title="White"></span>
                                                </label>
                                            </div>

                                            <div class="form-check color-option">
                                                <input class="form-check-input" type="checkbox" value="red" id="color-red">
                                                <label class="form-check-label" for="color-red">
                                                    <span class="color-swatch" style="background-color: #e74c3c;" title="Red"></span>
                                                </label>
                                            </div>

                                            <div class="form-check color-option">
                                                <input class="form-check-input" type="checkbox" value="blue" id="color-blue">
                                                <label class="form-check-label" for="color-blue">
                                                    <span class="color-swatch" style="background-color: #3498db;" title="Blue"></span>
                                                </label>
                                            </div>

                                            <div class="form-check color-option">
                                                <input class="form-check-input" type="checkbox" value="green" id="color-green">
                                                <label class="form-check-label" for="color-green">
                                                    <span class="color-swatch" style="background-color: #2ecc71;" title="Green"></span>
                                                </label>
                                            </div>

                                            <div class="form-check color-option">
                                                <input class="form-check-input" type="checkbox" value="yellow" id="color-yellow">
                                                <label class="form-check-label" for="color-yellow">
                                                    <span class="color-swatch" style="background-color: #f1c40f;" title="Yellow"></span>
                                                </label>
                                            </div>

                                            <div class="form-check color-option">
                                                <input class="form-check-input" type="checkbox" value="purple" id="color-purple">
                                                <label class="form-check-label" for="color-purple">
                                                    <span class="color-swatch" style="background-color: #9b59b6;" title="Purple"></span>
                                                </label>
                                            </div>

                                            <div class="form-check color-option">
                                                <input class="form-check-input" type="checkbox" value="orange" id="color-orange">
                                                <label class="form-check-label" for="color-orange">
                                                    <span class="color-swatch" style="background-color: #e67e22;" title="Orange"></span>
                                                </label>
                                            </div>

                                            <div class="form-check color-option">
                                                <input class="form-check-input" type="checkbox" value="pink" id="color-pink">
                                                <label class="form-check-label" for="color-pink">
                                                    <span class="color-swatch" style="background-color: #fd79a8;" title="Pink"></span>
                                                </label>
                                            </div>

                                            <div class="form-check color-option">
                                                <input class="form-check-input" type="checkbox" value="brown" id="color-brown">
                                                <label class="form-check-label" for="color-brown">
                                                    <span class="color-swatch" style="background-color: #795548;" title="Brown"></span>
                                                </label>
                                            </div>
                                        </div>

                                        <div class="filter-actions mt-3">
                                            <button type="button" class="btn btn-sm btn-outline-secondary">Clear All</button>
                                            <button type="button" class="btn btn-sm btn-primary">Apply Filter</button>
                                        </div>
                                    </div>

                                </div><!--/Color Filter Widget -->

                                <!-- Brand Filter Widget -->
                                <div class="brand-filter-widget widget-item">

                                  

                                  

                                </div><!--/Brand Filter Widget -->

                            </div>

                        </div>

                        <div class="col-lg-8">

                            <!-- Category Header Section -->
                            <section id="category-header" class="category-header section">

                                <div class="container" data-aos="fade-up">

                                    <!-- Filter and Sort Options -->
                                    <div class="filter-container mb-4" data-aos="fade-up" data-aos-delay="100">
                                        <div class="row g-3">
                                            <div class="col-12 col-md-6 col-lg-4">

                                                <form action="ProductByCategory" method="get" class="filter-item search-form">

                                                    <input type="hidden" name="cid" value="${param.cid}" />

                                                <label for="productSearch" class="form-label">Search Products</label>
                                                <div class="input-group">
                                                    <input type="text" class="form-control" id="productSearch" name="query"
                                                           placeholder="Search for products..." aria-label="Search for products" value="${param.query}">
                                                    <button class="btn search-btn" type="submit">
                                                        <i class="bi bi-search"></i>
                                                    </button>
                                                </div>
                                            </form>
                                        </div>

                                        <div class="col-12 col-md-6 col-lg-2">
                                            <form action="ProductByCategory" method="get" class="filter-item">
                                                <input type="hidden" name="cid" value="${param.cid}" />
                                                <input type="hidden" name="query" value="${param.query}" />

                                                <label for="priceRange" class="form-label">Price Range</label>
                                                <select class="form-select" id="priceRange" name="price" onchange="this.form.submit()">
                                                    <option value="" ${empty param.price ? "selected" : ""}>All Prices</option>
                                                    <option value="under500" ${param.price == "under500" ? "selected" : ""}>Under $500</option>
                                                    <option value="500to750" ${param.price == "500to750" ? "selected" : ""}>$500 to $750</option>
                                                    <option value="750to850" ${param.price == "750to850" ? "selected" : ""}>$750 to $850</option>
                                                    <option value="850to950" ${param.price == "850to950" ? "selected" : ""}>$850 to $950</option>
                                                    <option value="above950" ${param.price == "above950" ? "selected" : ""}>$950 & Above</option>
                                                </select>
                                            </form>
                                        </div>
                                        <div class="col-12 col-md-6 col-lg-2">
                                            <form action="ProductByCategory" method="get">
                                                <input type="hidden" name="cid" value="${param.cid}" />
                                                <input type="hidden" name="query" value="${param.query}" />
                                                <input type="hidden" name="priceRange" value="${param.priceRange}" />

                                                <div class="filter-item">
                                                    <label for="sortBy" class="form-label">Sort By</label>
                                                    <select class="form-select" id="sortBy" name="sort" onchange="this.form.submit()">
                                                        <option value="" ${empty sort ? "selected" : ""}>Featured</option>
                                                        <option value="lowtohigh" ${sort == 'lowtohigh' ? "selected" : ""}>Price: Low to High</option>
                                                        <option value="hightolow" ${sort == 'hightolow' ? "selected" : ""}>Price: High to Low</option>
                                                        <option value="newest" ${sort == 'newest' ? "selected" : ""}>Newest Arrivals</option>
                                                    </select>
                                                </div>
                                            </form>
                                        </div>

                                        
                                    </div>

                                    

                                </div>

                            </div>

                        </section><!-- /Category Header Section -->

                        <!-- Category Product List Section -->
                        <section id="category-product-list" class="category-product-list section">

                            <div class="container" data-aos="fade-up" data-aos-delay="100">

                                <div class="row gy-4">
                                    <!-- Product 1 -->
                                    <c:forEach items="${products}" var="p">
                                        <div class="col-lg-6">

                                            <div class="product-box">
                                                <div class="product-thumb">

                                                    <img src="${p.thumbnailURL}" alt="Product Image" class="main-img" loading="lazy">
                                                    <div class="product-overlay">
                                                        <div class="product-quick-actions">
                                                            <button type="button" class="quick-action-btn">
                                                                <i class="bi bi-heart"></i>
                                                            </button>
                                                            <button type="button" class="quick-action-btn">
                                                                <i class="bi bi-arrow-repeat"></i>
                                                            </button>
                                                            <button type="button" class="quick-action-btn">
                                                                <i class="bi bi-eye"></i>
                                                            </button>
                                                        </div>
                                                        <div class="add-to-cart-container">
                                                            <button type="button" class="add-to-cart-btn">Add to Cart</button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="product-content">
                                                    <div class="product-details">
                                                        <h3 class="product-title"><a href="DetailProduct?pid=${p.productId}">${p.productName}</a></h3>
                                                        <div class="product-price">
                                                            <span>$${p.price}</span>
                                                        </div>
                                                    </div>
                                                    <div class="product-rating-container">
                                                        <div class="rating-stars">
                                                            <i class="bi bi-star-fill"></i>
                                                            <i class="bi bi-star-fill"></i>
                                                            <i class="bi bi-star-fill"></i>
                                                            <i class="bi bi-star-fill"></i>
                                                            <i class="bi bi-star"></i>
                                                        </div>
                                                        <span class="rating-number">4.0</span>
                                                    </div>
                                                    <div class="product-color-options">
                                                        <span class="color-option" style="background-color: #3b82f6;"></span>
                                                        <span class="color-option" style="background-color: #22c55e;"></span>
                                                        <span class="color-option active" style="background-color: #f97316;"></span>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </c:forEach>
                                </div>

                            </div>

                        </section><!-- /Category Product List Section -->

                        <!-- Category Pagination Section -->
                        <section id="category-pagination" class="category-pagination section">
                            <div class="container">
                                <nav class="d-flex justify-content-center" aria-label="Page navigation">
                                    <ul>
                                        <!-- Previous -->
                                        <li>
                                            <a href="?cid=${cid}&page=${currentPage - 1}&query=${query}&price=${price}&sort=${sort}"
                                               aria-label="Previous page"
                                               class="${currentPage == 1 ? 'disabled' : ''}">
                                                <i class="bi bi-arrow-left"></i>
                                                <span class="d-none d-sm-inline">Previous</span>
                                            </a>
                                        </li>

                                        <!-- Page Numbers -->
                                        <c:forEach var="i" begin="1" end="${totalPages}">
                                            <li>
                                                <a href="?cid=${cid}&page=${i}&query=${query}&price=${price}&sort=${sort}"
                                                   class="${i == currentPage ? 'active' : ''}">
                                                    ${i}
                                                </a>
                                            </li>
                                        </c:forEach>

                                        <!-- Next -->
                                        <li>
                                            <a href="?cid=${cid}&page=${currentPage + 1}&query=${query}&price=${price}&sort=${sort}"
                                               aria-label="Next page"
                                               class="${currentPage == totalPages ? 'disabled' : ''}">
                                                <span class="d-none d-sm-inline">Next</span>
                                                <i class="bi bi-arrow-right"></i>
                                            </a>
                                        </li>
                                    </ul>
                                </nav>
                            </div>
                        </section>

                    </div>

                </div>
            </div>

        </main>

        <jsp:include page="Footer.jsp"></jsp:include> 

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