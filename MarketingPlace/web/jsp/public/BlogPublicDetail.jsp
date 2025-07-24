

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
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
                background-color: #f4f7f6;
                margin-top:20px;
            }
            .card {
                background: #fff;
                transition: .5s;
                border: 0;
                margin-bottom: 30px;
                border-radius: .55rem;
                position: relative;
                width: 100%;
                box-shadow: 0 1px 2px 0 rgb(0 0 0 / 10%);
            }
            .card .body {
                color: #444;
                padding: 20px;
                font-weight: 400;
            }
            .card .header {
                color: #444;
                padding: 20px;
                position: relative;
                box-shadow: none;
            }
            .single_post {
                -webkit-transition: all .4s ease;
                transition: all .4s ease
            }

            .single_post .body {
                padding: 30px
            }

            .single_post .img-post {
                position: relative;
                overflow: hidden;
                max-height: 500px;
                margin-bottom: 30px
            }

            .single_post .img-post>img {
                -webkit-transform: scale(1);
                -ms-transform: scale(1);
                transform: scale(1);
                opacity: 1;
                -webkit-transition: -webkit-transform .4s ease, opacity .4s ease;
                transition: transform .4s ease, opacity .4s ease;
                max-width: 100%;
                filter: none;
                -webkit-filter: grayscale(0);
                -webkit-transform: scale(1.01)
            }

            .single_post .img-post:hover img {
                -webkit-transform: scale(1.02);
                -ms-transform: scale(1.02);
                transform: scale(1.02);
                opacity: .7;
                filter: gray;
                -webkit-filter: grayscale(1);
                -webkit-transition: all .8s ease-in-out
            }

            .single_post .img-post:hover .social_share {
                display: block
            }

            .single_post .footer {
                padding: 0 30px 30px 30px
            }

            .single_post .footer .actions {
                display: inline-block
            }

            .single_post .footer .stats {
                cursor: default;
                list-style: none;
                padding: 0;
                display: inline-block;
                float: right;
                margin: 0;
                line-height: 35px
            }

            .single_post .footer .stats li {
                border-left: solid 1px rgba(160, 160, 160, 0.3);
                display: inline-block;
                font-weight: 400;
                letter-spacing: 0.25em;
                line-height: 1;
                margin: 0 0 0 2em;
                padding: 0 0 0 2em;
                text-transform: uppercase;
                font-size: 13px
            }

            .single_post .footer .stats li a {
                color: #777
            }

            .single_post .footer .stats li:first-child {
                border-left: 0;
                margin-left: 0;
                padding-left: 0
            }

            .single_post h3 {
                font-size: 20px;
                text-transform: uppercase
            }

            .single_post h3 a {
                color: #242424;
                text-decoration: none
            }

            .single_post p {
                font-size: 16px;
                line-height: 26px;
                font-weight: 300;
                margin: 0
            }

            .single_post .blockquote p {
                margin-top: 0 !important
            }

            .single_post .meta {
                list-style: none;
                padding: 0;
                margin: 0
            }

            .single_post .meta li {
                display: inline-block;
                margin-right: 15px
            }

            .single_post .meta li a {
                font-style: italic;
                color: #959595;
                text-decoration: none;
                font-size: 12px
            }

            .single_post .meta li a i {
                margin-right: 6px;
                font-size: 12px
            }

            .single_post2 {
                overflow: hidden
            }

            .single_post2 .content {
                margin-top: 15px;
                margin-bottom: 15px;
                padding-left: 80px;
                position: relative
            }

            .single_post2 .content .actions_sidebar {
                position: absolute;
                top: 0px;
                left: 0px;
                width: 60px
            }

            .single_post2 .content .actions_sidebar a {
                display: inline-block;
                width: 100%;
                height: 60px;
                line-height: 60px;
                margin-right: 0;
                text-align: center;
                border-right: 1px solid #e4eaec
            }

            .single_post2 .content .title {
                font-weight: 100
            }

            .single_post2 .content .text {
                font-size: 15px
            }

            .right-box .categories-clouds li {
                display: inline-block;
                margin-bottom: 5px
            }

            .right-box .categories-clouds li a {
                display: block;
                border: 1px solid;
                padding: 6px 10px;
                border-radius: 3px
            }

            .right-box .instagram-plugin {
                overflow: hidden
            }

            .right-box .instagram-plugin li {
                float: left;
                overflow: hidden;
                border: 1px solid #fff
            }

            .comment-reply li {
                margin-bottom: 15px
            }

            .comment-reply li:last-child {
                margin-bottom: none
            }

            .comment-reply li h5 {
                font-size: 18px
            }

            .comment-reply li p {
                margin-bottom: 0px;
                font-size: 15px;
                color: #777
            }

            .comment-reply .list-inline li {
                display: inline-block;
                margin: 0;
                padding-right: 20px
            }

            .comment-reply .list-inline li a {
                font-size: 13px
            }

            @media (max-width: 640px) {
                .blog-page .left-box .single-comment-box>ul>li {
                    padding: 25px 0
                }
                .blog-page .left-box .single-comment-box ul li .icon-box {
                    display: inline-block
                }
                .blog-page .left-box .single-comment-box ul li .text-box {
                    display: block;
                    padding-left: 0;
                    margin-top: 10px
                }
                .blog-page .single_post .footer .stats {
                    float: none;
                    margin-top: 10px
                }
                .blog-page .single_post .body,
                .blog-page .single_post .footer {
                    padding: 30px
                }
            }

            .tag-label {
                display: inline-block;
                background-color: #e0e0e0;
                border-radius: 15px;
                padding: 5px 10px;
                margin: 2px;
                font-size: 14px;
            }
        </style>
    </head>

    <body class="index-page">
        <%
            ArrayList<Cart> cart = (ArrayList<Cart>) session.getAttribute("cart");
        %>
        <jsp:include page="Header.jsp"></jsp:include>

        <main class="main">

            <div id="main-content" class="blog-page">
                <div class="container">
                    <div class="row clearfix">
                        <!--                <div class="col-lg-8 col-md-12 left-box">
                                            <div class="card single_post">
                                                <div class="body">
                                                    <div class="img-post">
                                                        <img class="d-block img-fluid" src="https://www.bootdey.com/image/800x280/87CEFA/000000" alt="First slide">
                                                    </div>
                                                    <h3><a href="blog-details.html">All photographs are accurate</a></h3>
                                                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
                                                </div>                        
                                            </div>
                                            <div class="card">
                                                    <div class="header">
                                                        <h2>Comments 3</h2>
                                                    </div>
                                                    <div class="body">
                                                        <ul class="comment-reply list-unstyled">
                                                            <li class="row clearfix">
                                                                <div class="icon-box col-md-2 col-4"><img class="img-fluid img-thumbnail" src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="Awesome Image"></div>
                                                                <div class="text-box col-md-10 col-8 p-l-0 p-r0">
                                                                    <h5 class="m-b-0">Gigi Hadid </h5>
                                                                    <p>Why are there so many tutorials on how to decouple WordPress? how fast and easy it is to get it running (and keep it running!) and its massive ecosystem. </p>
                                                                    <ul class="list-inline">
                                                                        <li><a href="javascript:void(0);">Mar 09 2018</a></li>
                                                                        <li><a href="javascript:void(0);">Reply</a></li>
                                                                    </ul>
                                                                </div>
                                                            </li>
                                                            <li class="row clearfix">
                                                                <div class="icon-box col-md-2 col-4"><img class="img-fluid img-thumbnail" src="https://bootdey.com/img/Content/avatar/avatar3.png" alt="Awesome Image"></div>
                                                                <div class="text-box col-md-10 col-8 p-l-0 p-r0">
                                                                    <h5 class="m-b-0">Christian Louboutin</h5>
                                                                    <p>Great tutorial but few issues with it? If i try open post i get following errors. Please can you help me?</p>
                                                                    <ul class="list-inline">
                                                                        <li><a href="javascript:void(0);">Mar 12 2018</a></li>
                                                                        <li><a href="javascript:void(0);">Reply</a></li>
                                                                    </ul>
                                                                </div>
                                                            </li>
                                                            <li class="row clearfix">
                                                                <div class="icon-box col-md-2 col-4"><img class="img-fluid img-thumbnail" src="https://bootdey.com/img/Content/avatar/avatar4.png" alt="Awesome Image"></div>
                                                                <div class="text-box col-md-10 col-8 p-l-0 p-r0">
                                                                    <h5 class="m-b-0">Kendall Jenner</h5>
                                                                    <p>Very nice and informative article. In all the years I've done small and side-projects as a freelancer, I've ran into a few problems here and there.</p>
                                                                    <ul class="list-inline">
                                                                        <li><a href="javascript:void(0);">Mar 20 2018</a></li>
                                                                        <li><a href="javascript:void(0);">Reply</a></li>
                                                                    </ul>
                                                                </div>
                                                            </li>
                                                        </ul>                                        
                                                    </div>
                                                </div>
                                                <div class="card">
                                                    <div class="header">
                                                        <h2>Leave a reply <small>Your email address will not be published. Required fields are marked*</small></h2>
                                                    </div>
                                                    <div class="body">
                                                        <div class="comment-form">
                                                            <form class="row clearfix">
                                                                <div class="col-sm-6">
                                                                    <div class="form-group">
                                                                        <input type="text" class="form-control" placeholder="Your Name">
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-6">
                                                                    <div class="form-group">
                                                                        <input type="text" class="form-control" placeholder="Email Address">
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-12">
                                                                    <div class="form-group">
                                                                        <textarea rows="4" class="form-control no-resize" placeholder="Please type what you want..."></textarea>
                                                                    </div>
                                                                    <button type="submit" class="btn btn-block btn-primary">SUBMIT</button>
                                                                </div>                                
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                        </div>-->
                        <div class="col-lg-8 col-md-12 left-box">
                            <div class="card single_post">
                                <div class="body">
                                    <div class="img-post">
                                        <img class="d-block img-fluid" src="${blog.thumbnailURL}" alt="First slide">
                                    </div>
                                    <h3><a href="blog-details.html">${blog.title}</a></h3>
                                    <p> ${blog.content}</p>
                                </div>                        
                            </div>
                            <div class="card">
                                <div class="header">
                                    <h2>Comments 3</h2>
                                </div>
                                <div class="body">
                                    <ul class="comment-reply list-unstyled">
                                        <li class="row clearfix">
                                            <div class="icon-box col-md-2 col-4"><img class="img-fluid img-thumbnail" src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="Awesome Image"></div>
                                            <div class="text-box col-md-10 col-8 p-l-0 p-r0">
                                                <h5 class="m-b-0">Gigi Hadid </h5>
                                                <p>Why are there so many tutorials on how to decouple WordPress? how fast and easy it is to get it running (and keep it running!) and its massive ecosystem. </p>
                                                <ul class="list-inline">
                                                    <li><a href="javascript:void(0);">Mar 09 2018</a></li>
                                                    <li><a href="javascript:void(0);">Reply</a></li>
                                                </ul>
                                            </div>
                                        </li>
                                        <li class="row clearfix">
                                            <div class="icon-box col-md-2 col-4"><img class="img-fluid img-thumbnail" src="https://bootdey.com/img/Content/avatar/avatar3.png" alt="Awesome Image"></div>
                                            <div class="text-box col-md-10 col-8 p-l-0 p-r0">
                                                <h5 class="m-b-0">Christian Louboutin</h5>
                                                <p>Great tutorial but few issues with it? If i try open post i get following errors. Please can you help me?</p>
                                                <ul class="list-inline">
                                                    <li><a href="javascript:void(0);">Mar 12 2018</a></li>
                                                    <li><a href="javascript:void(0);">Reply</a></li>
                                                </ul>
                                            </div>
                                        </li>
                                        <li class="row clearfix">
                                            <div class="icon-box col-md-2 col-4"><img class="img-fluid img-thumbnail" src="https://bootdey.com/img/Content/avatar/avatar4.png" alt="Awesome Image"></div>
                                            <div class="text-box col-md-10 col-8 p-l-0 p-r0">
                                                <h5 class="m-b-0">Kendall Jenner</h5>
                                                <p>Very nice and informative article. In all the years I've done small and side-projects as a freelancer, I've ran into a few problems here and there.</p>
                                                <ul class="list-inline">
                                                    <li><a href="javascript:void(0);">Mar 20 2018</a></li>
                                                    <li><a href="javascript:void(0);">Reply</a></li>
                                                </ul>
                                            </div>
                                        </li>
                                    </ul>                                        
                                </div>
                            </div>
                            <div class="card">
                                <div class="header">
                                    <h2>Leave a reply <small>Your email address will not be published. Required fields are marked*</small></h2>
                                </div>
                                <div class="body">
                                    <div class="comment-form">
                                        <form class="row clearfix">
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <input type="text" class="form-control" placeholder="Your Name">
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <input type="text" class="form-control" placeholder="Email Address">
                                                </div>
                                            </div>
                                            <div class="col-sm-12">
                                                <div class="form-group">
                                                    <textarea rows="4" class="form-control no-resize" placeholder="Please type what you want..."></textarea>
                                                </div>
                                                <button type="submit" class="btn btn-block btn-primary">SUBMIT</button>
                                            </div>                                
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-12 right-box">
                            <div class="card">
                                <div class="body search">
                                    <div class="input-group m-b-0">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"><i class="fa fa-search"></i></span>
                                        </div>
                                        <input type="text" class="form-control" placeholder="Search...">                                    
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="header">
                                    <h2>Categories</h2>
                                </div>
                                <div class="body widget">
                                    <ul class="list-unstyled categories-clouds m-b-0">
                                        <c:forEach var="cat" items="${categorys}">
                                            <li>
                                                <a href="Blog?service=listByCategory&id=${cat.categoryId}">
                                                    ${cat.categoryName}
                                                </a>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>
                            <div class="card">
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
                            </div>

                            <div class="card">
                                <div class="header">
                                    <h2>Tags</h2>
                                </div>
                                <div class="body widget">
                                    <ul class="list-unstyled categories-clouds m-b-0">
                                        <c:forEach var="tag" items="${tags}">
                                            <li>
                                                <span class="tag-label">${tag.tagName}</span>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

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
