<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Request Admin</title>

        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/bootstrap.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/vendors/iconly/bold.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/vendors/perfect-scrollbar/perfect-scrollbar.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/vendors/bootstrap-icons/bootstrap-icons.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/app.css">
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/asset/images/favicon.svg" type="image/x-icon">
        <style>
    body {
        font-family: 'Nunito', sans-serif;
        background-color: #f5f7fa;
    }

    .main-content-card {
        padding: 30px;
        background-color: #ffffff;
        border-radius: 10px;
        margin: 30px;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
    }

    .page-title {
        padding: 25px 30px;
        background-color: #f0f4f8;
        border-bottom: 1px solid #e3e3e3;
        border-radius: 10px 10px 0 0;
        margin-bottom: 20px;
    }

    .page-title h1 {
        font-weight: 700;
        font-size: 28px;
        color: #2c3e50;
    }

    .breadcrumbs {
        font-size: 14px;
    }

    .breadcrumbs ol {
        margin: 0;
        padding: 0;
        list-style: none;
        display: flex;
        gap: 5px;
    }

    .breadcrumbs li {
        color: #6c757d;
    }

    .breadcrumbs li a {
        text-decoration: none;
        color: #0d6efd;
    }

    .breadcrumbs li.current {
        font-weight: bold;
        color: #495057;
    }

    .button-group {
        display: flex;
        flex-wrap: wrap;
        gap: 10px;
        margin-bottom: 20px;
    }

    .button-group .btn {
        font-weight: 600;
        padding: 8px 16px;
        border-radius: 6px;
    }

    .alert-info {
        background-color: #d1ecf1;
        color: #0c5460;
        border: 1px solid #bee5eb;
        border-radius: 6px;
        padding: 10px 15px;
        font-weight: 500;
    }

    table.table {
        border: 1px solid #dee2e6;
        border-radius: 8px;
        overflow: hidden;
        background-color: #fff;
    }

    table thead th {
        background-color: #f1f3f5;
        color: #343a40;
        font-weight: 700;
        font-size: 14px;
    }

    table tbody td {
        vertical-align: middle;
        font-size: 14px;
        color: #212529;
    }

    table tr:hover {
        background-color: #f9f9f9;
    }

    /* Optional animation fade-in if you're using animate.css or custom */
    .animate-fade-in {
        animation: fadeIn 0.5s ease-in;
    }

    @keyframes fadeIn {
        from {
            opacity: 0;
            transform: translateY(10px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

</style>

    </head>

    <body>
        <div id="app">
            <div id="sidebar" class="active">
                <div class="sidebar-wrapper active">
                    <div class="logo d-flex align-items-center">
                        <a href="seller-dashboard">
                            <img src="${pageContext.request.contextPath}/asset/images/logo/logo.png"
                                 alt="Logo"
                                 style="max-width: 180px; height: auto;">
                        </a>
                    </div>
                    <jsp:include page="slider.jsp" />
                    <button class="sidebar-toggler btn x"><i data-feather="x"></i></button>
                </div>
            </div>
            <div id="main">
                <div class="main-content-card animate-fade-in">
                    <div class="page-title light-background">
        <div class="container d-lg-flex justify-content-between align-items-center">
            <h1 class="mb-2 mb-lg-0">Requests</h1>
            
        </div>
    </div> 

    
    <section id="contact-2" class="contact-2 section">
        <div class="container" data-aos="fade-up" data-aos-delay="100">

            <c:if test="${not hasApproved}">
                <div class="button-group">
                    <form action="${pageContext.request.contextPath}/create-request" method="post">
                        <button type="submit" class="btn btn-primary">Send Request To Be a Seller</button>
                    </form>
                    <form action="${pageContext.request.contextPath}/seller/seller-dashboard" method="get">
                        <button type="submit" class="btn btn-primary">Go to Seller Dashboard</button>
                    </form>
                </div>
            </c:if>

            <c:if test="${hasApproved}">
                <div class="alert alert-info mt-3">
                    Bạn đã được phê duyệt làm người bán. Không thể gửi thêm yêu cầu.
                </div>
                <form action="${pageContext.request.contextPath}/seller/seller-dashboard" method="get" class="mt-2">
                    <button type="submit" class="btn btn-primary">Go to Seller Dashboard</button>
                </form>
            </c:if>

            <div class="row gy-4 mt-1">
                <div class="col-12" data-aos="fade-up" data-aos-delay="300">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Request Date</th>
                                <th>Status</th>
                                <th>Reviewed By</th>
                                <th>Review Date</th>
                                <th>Reject Reason</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${requests}" var="po">
                                <tr>
                                    <td>${po.requestId}</td>
                                    <td>${po.requestDate}</td>
                                    <td>${po.status}</td>
                                    <td>${po.reviewedBy}</td>
                                    <td>${po.reviewDate}</td>
                                    <td>${po.rejectReason}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

        </div>
    </section> 



                </div>
            </div>

            <script src="${pageContext.request.contextPath}/asset/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
            <script src="${pageContext.request.contextPath}/asset/js/bootstrap.bundle.min.js"></script>
            <script src="${pageContext.request.contextPath}/asset/vendors/apexcharts/apexcharts.js"></script>
            <script src="${pageContext.request.contextPath}/asset/js/pages/dashboard.js"></script>
            <script src="${pageContext.request.contextPath}/asset/js/main.js"></script>
    </body>

</html>

