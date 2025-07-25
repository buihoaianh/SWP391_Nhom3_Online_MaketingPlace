<%-- 
    Document   : Unauthorized
    Created on : Jul 22, 2025, 3:39:56 PM
    Author     : tulok
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>404 - eStore Bootstrap Template</title>
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

<body class="page-404">

  <main class="main">

    <!-- Page Title -->
    <div class="page-title light-background">
      <div class="container d-lg-flex justify-content-between align-items-center">
        <h1 class="mb-2 mb-lg-0">404</h1>
        <nav class="breadcrumbs">
          <ol>
            <li><a href="index.html">Home</a></li>
            <li class="current">404</li>
          </ol>
        </nav>
      </div>
    </div><!-- End Page Title -->

    <!-- Error 404 Section -->
    <section id="error-404" class="error-404 section">

      <div class="container" data-aos="fade-up" data-aos-delay="100">

        <div class="text-center">
          <div class="error-icon mb-4" data-aos="zoom-in" data-aos-delay="200">
            <i class="bi bi-exclamation-circle"></i>
          </div>

          <h1 class="error-code mb-4" data-aos="fade-up" data-aos-delay="300">404</h1>

          <h2 class="error-title mb-3" data-aos="fade-up" data-aos-delay="400">Oops!</h2>

          <p class="error-text mb-4" data-aos="fade-up" data-aos-delay="500">
            Access denied. You are not authorized to view this page.
          </p>


          <div class="error-action" data-aos="fade-up" data-aos-delay="700">
            <a href="${pageContext.request.contextPath}/Home" class="btn btn-primary">Back to Home</a>
          </div>
        </div>

      </div>

    </section><!-- /Error 404 Section -->

  </main>

 

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
