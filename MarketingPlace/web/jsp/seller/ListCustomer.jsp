<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>List Customer by Seller</title>

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
                background-color: #f8f9fa;
            }

            .search-box {
                display: flex;
                flex-wrap: wrap;
                gap: 10px;
                margin-bottom: 20px;
            }

            .search-box input {
                flex-grow: 1;
                max-width: 300px;
            }

            .btn-status {
                min-width: 100px;
            }

            .table th, .table td {
                vertical-align: middle;
            }

            h2.title {
                background-color: #435EBE;
                color: white;
                padding: 15px 30px;
                border-radius: 10px;
                margin: 0 auto 25px auto;
                max-width: 400px;
                text-align: center;
                font-weight: bold;
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
                <h2 class="text-center title">List Customer</h2>
                <form class="search-box justify-content-center" action="${pageContext.request.contextPath}/seller/list-customer" method="get">
                    <input type="text" name="keyword" placeholder="Search by ID or Name..." class="form-control"/>
                    <button type="submit" class="btn btn-primary">Search</button>
                    <a href="${pageContext.request.contextPath}/seller/list-customer" class="btn btn-secondary">View All</a>
                </form>
                <c:if test="${not empty sessionScope.statusMessage}">
                    <div class="alert alert-success alert-dismissible fade show text-center" role="alert">
                        ${sessionScope.statusMessage}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                    <c:remove var="statusMessage" scope="session"/>
                </c:if>
                <div class="table-responsive">
                    <table class="table table-bordered table-hover bg-white shadow-sm">
                        <thead class="table-primary text-center">
                            <tr>
                                <th>STT</th>
                                <th>ACCOUNT ID</th>
                                <th>FULLNAME</th>
                                <th>STATUS</th>
                                <th>DESCRIPTION</th>
                                <th>ACTION</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="customer" items="${customerList}" varStatus="loop">
                            <tr>
                                <td class="text-center">${loop.count}</td>
                                <td class="text-center">
                                    <a href="${pageContext.request.contextPath}/seller/list-customer-detail?id=${customer.accountID}" class="text-decoration-none">
                                        ${customer.accountID}
                                    </a>
                                </td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/seller/list-customer-detail?id=${customer.accountID}" class="text-decoration-none">
                                        ${customer.fullName}
                                    </a>
                                </td>
                                <td class="text-center">
                                    <span class="badge
                                          <c:choose>
                                          <c:when test="${customer.status}">bg-success</c:when>
                                        <c:otherwise>bg-secondary</c:otherwise>
                                        </c:choose>">
                                        <c:choose>
                                            <c:when test="${customer.status}">Active</c:when>
                                            <c:otherwise>Inactive</c:otherwise>
                                        </c:choose>
                                    </span>
                                </td>
                                <td>${customer.description}</td>
                                <td class="text-center">
                                    <form action="${pageContext.request.contextPath}/seller/list-customer/change-customer-status" method="post">
                                        <input type="hidden" name="accountId" value="${customer.accountID}" />
                                        <button type="submit" class="btn btn-status
                                                <c:choose>
                                                <c:when test="${customer.status}">btn-danger</c:when>
                                            <c:otherwise>btn-success</c:otherwise>
                                            </c:choose>">
                                            <c:choose>
                                                <c:when test="${customer.status}">Inactive</c:when>
                                                <c:otherwise>Active</c:otherwise>
                                            </c:choose>
                                        </button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty customerList}">
                            <tr>
                                <td colspan="6" class="text-center">No found Customer</td>
                            </tr>
                        </c:if>
                        </tbody>
                    </table>
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