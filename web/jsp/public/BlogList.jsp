
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
        <!--Them thư vien-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css" integrity="sha256-mmgLkCYLUQbXn0B1SRqzHar6dCnv9oZFPEC1g1cwlkk=" crossorigin="anonymous" />
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
            body{
                margin-top:20px;
            }
            .blog-listing {
                padding-top: 30px;
                padding-bottom: 30px;
            }
            .gray-bg {
                background-color: #f5f5f5;
            }
            /* Blog 
            ---------------------*/
            .blog-grid {
                box-shadow: 0 0 30px rgba(31, 45, 61, 0.125);
                border-radius: 5px;
                overflow: hidden;
                background: #ffffff;
                margin-top: 15px;
                margin-bottom: 15px;
            }
            .blog-grid .blog-img {
                position: relative;
            }
            .blog-grid .blog-img .date {
                position: absolute;
                background: #fc5356;
                color: #ffffff;
                padding: 8px 15px;
                left: 10px;
                top: 10px;
                border-radius: 4px;
            }
            .blog-grid .blog-img .date span {
                font-size: 22px;
                display: block;
                line-height: 22px;
                font-weight: 700;
            }
            .blog-grid .blog-img .date label {
                font-size: 14px;
                margin: 0;
            }
            .blog-grid .blog-info {
                padding: 20px;
            }
            .blog-grid .blog-info h5 {
                font-size: 22px;
                font-weight: 700;
                margin: 0 0 10px;
            }
            .blog-grid .blog-info h5 a {
                color: #20247b;
            }
            .blog-grid .blog-info p {
                margin: 0;
            }
            .blog-grid .blog-info .btn-bar {
                margin-top: 20px;
            }


            /* Blog Sidebar
            -------------------*/
            .blog-aside .widget {
                box-shadow: 0 0 30px rgba(31, 45, 61, 0.125);
                border-radius: 5px;
                overflow: hidden;
                background: #ffffff;
                margin-top: 15px;
                margin-bottom: 15px;
                width: 100%;
                display: inline-block;
                vertical-align: top;
            }
            .blog-aside .widget-body {
                padding: 15px;
            }
            .blog-aside .widget-title {
                padding: 15px;
                border-bottom: 1px solid #eee;
            }
            .blog-aside .widget-title h3 {
                font-size: 20px;
                font-weight: 700;
                color: #fc5356;
                margin: 0;
            }
            .blog-aside .widget-author .media {
                margin-bottom: 15px;
            }
            .blog-aside .widget-author p {
                font-size: 16px;
                margin: 0;
            }
            .blog-aside .widget-author .avatar {
                width: 70px;
                height: 70px;
                border-radius: 50%;
                overflow: hidden;
            }
            .blog-aside .widget-author h6 {
                font-weight: 600;
                color: #20247b;
                font-size: 22px;
                margin: 0;
                padding-left: 20px;
            }
            .blog-aside .post-aside {
                margin-bottom: 15px;
            }
            .blog-aside .post-aside .post-aside-title h5 {
                margin: 0;
            }
            .blog-aside .post-aside .post-aside-title a {
                font-size: 18px;
                color: #20247b;
                font-weight: 600;
            }
            .blog-aside .post-aside .post-aside-meta {
                padding-bottom: 10px;
            }
            .blog-aside .post-aside .post-aside-meta a {
                color: #6F8BA4;
                font-size: 12px;
                text-transform: uppercase;
                display: inline-block;
                margin-right: 10px;
            }
            .blog-aside .latest-post-aside + .latest-post-aside {
                border-top: 1px solid #eee;
                padding-top: 15px;
                margin-top: 15px;
            }
            .blog-aside .latest-post-aside .lpa-right {
                width: 90px;
            }
            .blog-aside .latest-post-aside .lpa-right img {
                border-radius: 3px;
            }
            .blog-aside .latest-post-aside .lpa-left {
                padding-right: 15px;
            }
            .blog-aside .latest-post-aside .lpa-title h5 {
                margin: 0;
                font-size: 15px;
            }
            .blog-aside .latest-post-aside .lpa-title a {
                color: #20247b;
                font-weight: 600;
            }
            .blog-aside .latest-post-aside .lpa-meta a {
                color: #6F8BA4;
                font-size: 12px;
                text-transform: uppercase;
                display: inline-block;
                margin-right: 10px;
            }

            .tag-cloud a {
                padding: 4px 15px;
                font-size: 13px;
                color: #ffffff;
                background: #20247b;
                border-radius: 3px;
                margin-right: 4px;
                margin-bottom: 4px;
            }
            .tag-cloud a:hover {
                background: #fc5356;
            }

            .blog-single {
                padding-top: 30px;
                padding-bottom: 30px;
            }

            .article {
                box-shadow: 0 0 30px rgba(31, 45, 61, 0.125);
                border-radius: 5px;
                overflow: hidden;
                background: #ffffff;
                padding: 15px;
                margin: 15px 0 30px;
            }
            .article .article-title {
                padding: 15px 0 20px;
            }
            .article .article-title h6 {
                font-size: 14px;
                font-weight: 700;
                margin-bottom: 20px;
            }
            .article .article-title h6 a {
                text-transform: uppercase;
                color: #fc5356;
                border-bottom: 1px solid #fc5356;
            }
            .article .article-title h2 {
                color: #20247b;
                font-weight: 600;
            }
            .article .article-title .media {
                padding-top: 15px;
                border-bottom: 1px dashed #ddd;
                padding-bottom: 20px;
            }
            .article .article-title .media .avatar {
                width: 45px;
                height: 45px;
                border-radius: 50%;
                overflow: hidden;
            }
            .article .article-title .media .media-body {
                padding-left: 8px;
            }
            .article .article-title .media .media-body label {
                font-weight: 600;
                color: #fc5356;
                margin: 0;
            }
            .article .article-title .media .media-body span {
                display: block;
                font-size: 12px;
            }
            .article .article-content h1,
            .article .article-content h2,
            .article .article-content h3,
            .article .article-content h4,
            .article .article-content h5,
            .article .article-content h6 {
                color: #20247b;
                font-weight: 600;
                margin-bottom: 15px;
            }
            .article .article-content blockquote {
                max-width: 600px;
                padding: 15px 0 30px 0;
                margin: 0;
            }
            .article .article-content blockquote p {
                font-size: 20px;
                font-weight: 500;
                color: #fc5356;
                margin: 0;
            }
            .article .article-content blockquote .blockquote-footer {
                color: #20247b;
                font-size: 16px;
            }
            .article .article-content blockquote .blockquote-footer cite {
                font-weight: 600;
            }
            .article .tag-cloud {
                padding-top: 10px;
            }

            .article-comment {
                box-shadow: 0 0 30px rgba(31, 45, 61, 0.125);
                border-radius: 5px;
                overflow: hidden;
                background: #ffffff;
                padding: 20px;
            }
            .article-comment h4 {
                color: #20247b;
                font-weight: 700;
                margin-bottom: 25px;
                font-size: 22px;
            }
            img {
                max-width: 100%;
            }
            img {
                vertical-align: middle;
                border-style: none;
            }
            .active-category {
                font-weight: bold;
                color: #007bff;
            }
.blog-grid {
    height: 100%;
    display: flex;
    flex-direction: column;
    border: 1px solid #ddd;
    border-radius: 8px;
    overflow: hidden;
    box-shadow: 0 0 10px rgba(0,0,0,0.05);
}

.blog-img {
    position: relative;
    height: 200px;
    overflow: hidden;
}

.blog-img img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.blog-info {
    padding: 16px;
    flex: 1;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
}

        </style>
    </head>

    <body class="index-page">
        <%
            ArrayList<Cart> cart = (ArrayList<Cart>) session.getAttribute("cart");
        %>
        <jsp:include page="Header.jsp"></jsp:include>
        <main class="main">

            <section class="blog-listing gray-bg">
                <div class="container">
                    <div class="row align-items-start">
                        <div class="col-lg-8 m-15px-tb">
                            <div class="row">
                                <!--                                <div class="col-sm-6">
                                                                    <div class="blog-grid">
                                                                        <div class="blog-img">
                                                                            <div class="date">
                                                                                <span>04</span>
                                                                                <label>FEB</label>
                                                                            </div>
                                                                            <a href="#">
                                                                                <img src="https://www.bootdey.com/image/400x200/FFB6C1/000000" title="" alt="">
                                                                            </a>
                                                                        </div>
                                                                        <div class="blog-info">
                                                                            <h5><a href="#">Prevent 75% of visitors from google analytics</a></h5>
                                                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                                                                            <div class="btn-bar">
                                                                                <a href="#" class="px-btn-arrow">
                                                                                    <span>Read More</span>
                                                                                    <i class="arrow"></i>
                                                                                </a>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>-->
                                <c:forEach var="blog" items="${blogData}">
    <div class="col-sm-6 mb-4">
        <div class="blog-grid">
            <div class="blog-img">
                <div class="date">
                    <span>${blog.createdAt.dayOfMonth}</span>
                    <label>${blog.createdAt.month}</label>
                </div>
                <a href="BlogDetail?service=blogDetail&id=${blog.blogID}">
                    <img src="${blog.thumbnailURL}" title="${blog.title}" alt="${blog.title}">
                </a>
            </div>
            <div class="blog-info">
                <h5>
                    <a href="BlogDetail?service=blogDetail&id=${blog.blogID}">${blog.title}</a>
                </h5>
                <p>${fn:substring(blog.content, 0, 120)}...</p>
                <div class="btn-bar mt-2">
                    <a href="BlogDetail?service=blogDetail&id=${blog.blogID}" class="px-btn-arrow">
                        <span>Read More</span>
                        <i class="arrow"></i>
                    </a>
                </div>
            </div>
        </div>
    </div>
</c:forEach>

                                <!--                                <div class="col-12">
                                                                    <ul class="pagination justify-content-center">
                                                                        <li class="page-item disabled">
                                                                            <a class="page-link" href="#" tabindex="-1"><i class="fas fa-chevron-left"></i></a>
                                                                        </li>
                                                                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                                                                        <li class="page-item active">
                                                                            <a class="page-link" href="#">2 <span class="sr-only">(current)</span></a>
                                                                        </li>
                                                                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                                                                        <li class="page-item">
                                                                            <a class="page-link" href="#"><i class="fas fa-chevron-right"></i></a>
                                                                        </li>
                                                                    </ul>
                                                                </div>-->
                                <div class="col-12">
                                    <ul class="pagination justify-content-center">
                                        <c:if test="${currentPage > 1}">
                                            <li class="page-item">
                                                <a class="page-link" href="Blog?service=listBlogs&page=${currentPage - 1}"><i class="fas fa-chevron-left"></i></a>
                                            </li>
                                        </c:if>

                                        <c:forEach var="i" begin="1" end="${totalPages}">
                                            <li class="page-item ${i == currentPage ? 'active' : ''}">
                                                <a class="page-link" href="Blog?service=listBlogs&page=${i}">${i}</a>
                                            </li>
                                        </c:forEach>

                                        <c:if test="${currentPage < totalPages}">
                                            <li class="page-item">
                                                <a class="page-link" href="Blog?service=listBlogs&page=${currentPage + 1}"><i class="fas fa-chevron-right"></i></a>
                                            </li>
                                        </c:if>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4 m-15px-tb blog-aside">
                            <!-- Author -->
                            <!--                            <div class="widget widget-author">
                                                            <div class="widget-title">
                                                                <h3>Author</h3>
                                                            </div>
                                                            <div class="widget-body">
                                                                <div class="media align-items-center">
                                                                    <div class="avatar">
                                                                        <img src="https://bootdey.com/img/Content/avatar/avatar6.png" title="" alt="">
                                                                    </div>
                                                                    <div class="media-body">
                                                                        <h6>Hello, I'm<br> Rachel Roth</h6>
                                                                    </div>
                                                                </div>
                                                                <p>I design and develop services for customers of all sizes, specializing in creating stylish, modern websites, web services and online stores</p>
                                                            </div>
                                                        </div>-->
                            <!-- widget Tags -->
                            <div class="widget widget-tags">
                                <div class="widget-title">
                                    <h3>Categories</h3>
                                </div>
                                <div class="widget-body">
                                    <div class="nav tag-cloud">
                                        <c:forEach var="cat" items="${categoryList}">
                                            <c:choose>
                                                <c:when test="${cat.categoryId == selectedCategoryId}">
                                                    <!-- Nếu đang chọn rồi => bỏ chọn (hiển thị tất cả blog) -->
                                                    <a href="Blog?service=listBlogs" class="active-category">
                                                        ${cat.categoryName}
                                                    </a>
                                                </c:when>
                                                <c:otherwise>
                                                    <a href="Blog?service=listByCategory&id=${cat.categoryId}">
                                                        ${cat.categoryName}
                                                    </a>
                                                </c:otherwise>
                                            </c:choose>

                                        </c:forEach>

                                    </div>
                                </div>
                            </div>
                            <!-- End widget Tags -->

                            <!-- Latest Post -->
                            <!--                                               <div class="widget widget-latest-post">
                                                                                        <div class="widget-title">
                                                                                            <h3>Latest Post</h3>
                                                                                        </div>
                                                                                        <div class="widget-body">
                                                                                            <div class="latest-post-aside media">
                                                                                                <div class="lpa-left media-body">
                                                                                                    <div class="lpa-title">
                                                                                                        <h5><a href="#">Prevent 75% of visitors from google analytics</a></h5>
                                                                                                    </div>
                                                                                                    <div class="lpa-meta">
                                                                                                        <a class="name" href="#">
                                                                                                            Rachel Roth
                                                                                                        </a>
                                                                                                        <a class="date" href="#">
                                                                                                            26 FEB 2020
                                                                                                        </a>
                                                                                                    </div>
                                                                                                </div>
                                                                                                <div class="lpa-right">
                                                                                                    <a href="#">
                                                                                                        <img src="https://www.bootdey.com/image/400x200/E6E6FA/000000" title="" alt="">
                                                                                                    </a>
                                                                                                </div>
                                                                                            </div>
                                                        
                                                                                            <div class="latest-post-aside media">
                                                                                                <div class="lpa-left media-body">
                                                                                                    <div class="lpa-title">
                                                                                                        <h5><a href="#">Prevent 75% of visitors from google analytics</a></h5>
                                                                                                    </div>
                                                                                                    <div class="lpa-meta">
                                                                                                        <a class="name" href="#">
                                                                                                            Rachel Roth
                                                                                                        </a>
                                                                                                        <a class="date" href="#">
                                                                                                            26 FEB 2020
                                                                                                        </a>
                                                                                                    </div>
                                                                                                </div>
                                                                                                <div class="lpa-right">
                                                                                                    <a href="#">
                                                                                                        <img src="https://www.bootdey.com/image/400x200/FFA07A/000000" title="" alt="">
                                                                                                    </a>
                                                                                                </div>
                                                                                            </div>
                                                        
                                                                                            <div class="latest-post-aside media">
                                                                                                <div class="lpa-left media-body">
                                                                                                    <div class="lpa-title">
                                                                                                        <h5><a href="#">Prevent 75% of visitors from google analytics</a></h5>
                                                                                                    </div>
                                                                                                    <div class="lpa-meta">
                                                                                                        <a class="name" href="#">
                                                                                                            Rachel Roth
                                                                                                        </a>
                                                                                                        <a class="date" href="#">
                                                                                                            26 FEB 2020
                                                                                                        </a>
                                                                                                    </div>
                                                                                                </div>
                                                                                                <div class="lpa-right">
                                                                                                    <a href="#">
                                                                                                        <img src="https://www.bootdey.com/image/400x200/FFF0F5/000000" title="" alt="">
                                                                                                    </a>
                                                                                                </div>
                                                                                            </div>
                                                        
                                                                                        </div>
                                                                                    </div>-->
                            <div class="widget widget-latest-post">
                                <div class="widget-title">
                                    <h3>Latest Posts</h3>
                                </div>
                                <div class="widget-body">
                                    <c:forEach var="latest" items="${latestBlogs}">
                                        <div class="latest-post-aside media">
                                            <div class="lpa-left media-body">
                                                <div class="lpa-title">
                                                    <h5>
                                                        <a href="BlogDetail?service=blogDetail&id=${latest.blogID}">
                                                            ${latest.title}
                                                        </a>
                                                    </h5>
                                                    <a class="date" href="#">
                                                        ${latest.createdAt}
                                                    </a>
                                                </div>
                                                <div class="lpa-meta">
                                                    <a class="name" href="#">Author #${latest.authorID}</a>

                                                </div>
                                            </div>
                                            <div class="lpa-right">
                                                <a href="BlogDetailURL?service=blogDetail&id=${latest.blogID}">
                                                    <img src="${latest.thumbnailURL}" width="80" height="60" />
                                                </a>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>

                            <!-- End Latest Post -->
                            <!-- widget Tags -->
                            <div class="widget widget-tags">
                                <div class="widget-title">
                                    <h3>Tags</h3>   
                                </div>
                                <div class="widget-body">
                                    <div class="nav tag-cloud">
                                        <c:forEach var="tag" items="${tagList}">
                                            <a href="#">${tag.tagName}</a>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                            <!-- End widget Tags -->
                        </div>
                    </div>
                </div>
            </section>

            <!--             Info Cards Section 
                        <section id="info-cards" class="info-cards section light-background">
            
                            
            
                             ✅ Đưa nút ra ngoài isotope-layout 
            
                        </section>
                        <div class="text-center mt-5 mb-5" data-aos="fade-up">
                            <a href="#" class="view-all-btn">
                                View All Products <i class="bi bi-arrow-right"></i>
                            </a>
                        </div>-->


            <!-- /Product List Section -->

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


    </body>

</html>
