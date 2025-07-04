<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Customer Detail</title>

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
                background-color: #f8f9fc;
                font-family: 'Nunito', sans-serif;
            }

            h1 {
                font-weight: 700;
                color: #4e73df;
                text-align: center;
            }

            .profile-card {
                display: flex;
                background: white;
                border-radius: 10px;
                box-shadow: 0 0 15px rgba(0,0,0,0.05);
                max-width: 1000px;
                margin: 40px auto;
                padding: 30px 40px;
            }

            .profile-left {
                flex: 1;
                text-align: center;
                border-right: 1px solid #dee2e6;
                padding-right: 20px;
            }

            .profile-left img {
                width: 180px;
                height: 220px;
                object-fit: cover;
                border-radius: 10px;
                border: 3px solid #e3e6f0;
            }

            .profile-left h4 {
                margin-top: 15px;
                font-weight: 600;
                color: #1f2d3d;
            }

            .profile-left small {
                color: #858796;
            }

            .profile-right {
                flex: 2;
                padding-left: 30px;
            }

            .info-row {
                margin-bottom: 15px;
                display: flex;
                align-items: center;
            }

            .info-label {
                font-weight: 600;
                color: #4e73df;
                width: 150px;
                flex-shrink: 0;
            }

            .badge-status {
                font-size: 0.85rem;
                padding: 5px 12px;
                border-radius: 10px;
                font-weight: 600;
            }

            .badge-status.bg-success {
                background-color: #1cc88a;
                color: #fff;
            }

            .badge-status.bg-secondary {
                background-color: #858796;
                color: #fff;
            }

            .btn-back {
                background-color: #6c757d;
                color: #fff;
                padding: 8px 16px;
                border-radius: 6px;
                text-decoration: none;
                font-size: 0.9rem;
                margin-top: 10px;
            }

            .btn-back:hover {
                background-color: #5a6268;
                color: #fff;
            }

            .profile-card {
                display: flex;
                background: #ffffff;
                border-radius: 12px;
                border: 1px solid #dee2e6;
                box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
                max-width: 1000px;
                margin: 40px auto;
                padding: 30px 40px;
                transition: all 0.3s ease-in-out;
            }
            .profile-card:hover {
                box-shadow: 0 6px 30px rgba(0, 0, 0, 0.08);
                transform: translateY(-3px);
            }

        </style>


    </head>

    <body>
        <div id="app">
            <div id="sidebar" class="active">
                <div class="sidebar-wrapper active">
                    <div class="logo d-flex align-items-center">
                        <a href="saller-dashboard">
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
                <h1 class="mt-4 mb-4">Customer Detail</h1>
                <div class="profile-card">
                    <div class="d-flex justify-content-center">
                        <div class="profile-left">
                            <img src="${customerDetail.imageURL}" alt="Customer Image" />
                            <h4 class="mt-3 mb-0">${customerDetail.fullName}</h4>
                            <small class="text-muted">Account ID: ${customerDetail.accountID}</small>
                        </div>
                        <div class="profile-right text-start">
                            <div class="info-row"><span class="info-label">Email:</span> ${customerDetail.email}</div>
                            <div class="info-row"><span class="info-label">Phone Number:</span> ${customerDetail.phoneNumber}</div>
                            <div class="info-row"><span class="info-label">Address:</span> ${customerDetail.address}</div>
                            <div class="info-row">
                                <span class="info-label">Create Date:</span> 
                                <fmt:formatDate value="${createDateAsDate}" pattern="EEE MMM dd HH:mm:ss z yyyy" />
                            </div>
                            <div class="info-row">
                                <span class="info-label">Status:</span>
                                <c:choose>
                                    <c:when test="${customerDetail.status}">
                                        <span class="badge bg-success badge-status">Active</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="badge bg-secondary badge-status">Inactive</span>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="info-row"><span class="info-label">Description:</span> ${customerDetail.description}</div>

                            <a href="${pageContext.request.contextPath}/seller/list-customer" class="btn-back mt-3">&larr; Back to List</a>

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