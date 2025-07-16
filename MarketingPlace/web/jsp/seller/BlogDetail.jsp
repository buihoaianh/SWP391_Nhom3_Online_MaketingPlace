<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Categories" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>List Categories</title>

        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/bootstrap.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/vendors/iconly/bold.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/vendors/perfect-scrollbar/perfect-scrollbar.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/vendors/bootstrap-icons/bootstrap-icons.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/app.css">
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/asset/images/favicon.svg" type="image/x-icon">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
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

    <body>
        <div id="app">
            <div id="sidebar" class="active">
                <div class="sidebar-wrapper active">
                    <div class="logo d-flex align-items-center">
                        <a href="saller-dashboard">
                            <img src="${pageContext.request.contextPath}/asset/images/logo/logo.png" alt="Logo"
                                 style="max-width: 180px; height: auto;">
                        </a>
                    </div>
                    <jsp:include page="slider.jsp"/>
                    <button class="sidebar-toggler btn x"><i data-feather="x"></i></button>
                </div>
            </div>

            <div id="main">
                <div class="container">
                    <div class="row clearfix">
                        <div class="col-lg-8 col-md-12 left-box">
                            <div class="card single_post">
                                <div class="body">
                                    <h3><a href="BlogDetailURL?service=blogDetail&id=${blog.blogID}">Ttile: ${blog.title}</a></h3>
                                    <p>Author: ${blog.authorID}</p>
                                    <p>Create date ${blog.createdAt}</p>
                                </div>                        
                            </div>
                            <div class="card single_post">
                                <div class="body">
                                    <div class="img-post">
                                        <img class="d-block img-fluid" src="${blog.thumbnailURL}" alt="First slide">
                                    </div>
<!--                                    <h3><a href="blog-details.html">${blog.title}</a></h3>-->
                                    <p> ${blog.content}</p>
                                </div>                        
                            </div>
                            <!--                            <div class="card">
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
                                                        </div>-->
                            <!--                            <div class="card">
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
                                                        </div>-->
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
                            <!--                            <div class="card">
                                                            <div class="header">
                                                                <h2>Categories Clouds</h2>
                                                            </div>
                                                            <div class="body widget">
                                                                <ul class="list-unstyled categories-clouds m-b-0">
                                                                    <li><a href="javascript:void(0);">eCommerce</a></li>
                                                                    <li><a href="javascript:void(0);">Microsoft Technologies</a></li>
                                                                    <li><a href="javascript:void(0);">Creative UX</a></li>
                                                                    <li><a href="javascript:void(0);">Wordpress</a></li>
                                                                    <li><a href="javascript:void(0);">Angular JS</a></li>
                                                                    <li><a href="javascript:void(0);">Enterprise Mobility</a></li>
                                                                    <li><a href="javascript:void(0);">Website Design</a></li>
                                                                    <li><a href="javascript:void(0);">HTML5</a></li>
                                                                    <li><a href="javascript:void(0);">Infographics</a></li>
                                                                    <li><a href="javascript:void(0);">Wordpress Development</a></li>
                                                                </ul>
                                                            </div>
                                                        </div>-->
                            <div class="card">
                                <div class="header">
                                    <h2>Categories</h2>
                                </div>
                                <div class="body widget">
                                    <ul class="list-unstyled categories-clouds m-b-0">
                                        <c:forEach var="cat" items="${categorys}">
                                            <li>
                                                <a href="BlogDetailURL?service=listByCategory&id=${cat.categoryId}">
                                                    ${cat.categoryName}
                                                </a>    
                                            </li>
                                        </c:forEach>
                                    </ul>
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
        </div>

        <script src="${pageContext.request.contextPath}/asset/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
        <script src="${pageContext.request.contextPath}/asset/js/bootstrap.bundle.min.js"></script>
        <script src="${pageContext.request.contextPath}/asset/vendors/apexcharts/apexcharts.js"></script>
        <script src="${pageContext.request.contextPath}/asset/js/pages/dashboard.js"></script>
        <script src="${pageContext.request.contextPath}/asset/js/main.js"></script>
    </body>

</html>