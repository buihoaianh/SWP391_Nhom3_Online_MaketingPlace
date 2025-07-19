<%-- 
    Document   : SellerDashboard
    Created on : Jun 18, 2025, 12:00:31 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Dashboard - Mazer Admin Dashboard</title>

        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/bootstrap.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/vendors/iconly/bold.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/vendors/perfect-scrollbar/perfect-scrollbar.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/vendors/bootstrap-icons/bootstrap-icons.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/app.css">
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/asset/images/favicon.svg" type="image/x-icon">
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
                <header class="mb-3">
                    <a href="#" class="burger-btn d-block d-xl-none">
                        <i class="bi bi-justify fs-3"></i>
                    </a>
                </header>

                <div class="page-heading">
                    <h3>Profile Statistics</h3>
                </div>
                <div class="page-content">
                    <section class="row">
                        <div class="col-12 col-lg-9">
                            <div class="row">
                                <div class="col-6 col-lg-3 col-md-6">
                                    <div class="card">
                                        <div class="card-body px-3 py-4-5">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <div class="stats-icon blue">
                                                        <i class="iconly-boldWallet"></i>
                                                    </div>
                                                </div>
                                                <div class="col-md-8">
                                                    <h6 class="text-muted font-semibold">Total Revenue</h6>
                                                    <h6 class="font-extrabold mb-0">
                                                        <fmt:formatNumber value="${totalRevenue}" type="number" groupingUsed="true"/> ₫
                                                    </h6>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-6 col-lg-3 col-md-6">
                                    <div class="card">
                                        <div class="card-body px-3 py-4-5">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <div class="stats-icon blue">
                                                        <i class="iconly-boldProfile"></i>
                                                    </div>
                                                </div>
                                                <div class="col-md-8">
                                                    <h6 class="text-muted font-semibold">Total Feedback</h6>
                                                    <h6 class="font-extrabold mb-0">183.000</h6>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-6 col-lg-3 col-md-6">
                                    <div class="card">
                                        <div class="card-body px-3 py-4-5">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <div class="stats-icon green">
                                                        <i class="iconly-boldBag"></i> <!-- Icon tiền -->
                                                    </div>
                                                </div>
                                                <div class="col-md-8">
                                                    <h6 class="text-muted font-semibold">Total Order</h6>
                                                    <h6 class="font-extrabold mb-0">
                                                        <fmt:formatNumber value="${totalOrders}" type="number" groupingUsed="true" />
                                                    </h6>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-6 col-lg-3 col-md-6">
                                    <div class="card">
                                        <div class="card-body px-3 py-4-5">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <div class="stats-icon red">
                                                        <i class="iconly-boldBookmark"></i>
                                                    </div>
                                                </div>
                                                <div class="col-md-8">
                                                    <h6 class="text-muted font-semibold">Total Product</h6>
                                                    <h6 class="font-extrabold mb-0">
                                                        <c:out value="${totalProducts}" />
                                                    </h6>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12">
                                    <div class="card">
                                        <div class="card-header">
                                            <h4>Monthly Revenue (VNĐ)</h4>
                                        </div>
                                        <div class="card-body">
                                            <div id="chart-profile"></div>

                                            <c:set var="labels" value="" />
                                            <c:set var="values" value="" />
                                            <c:forEach var="entry" items="${stats}">
                                                <c:set var="labels" value="${labels}'${entry.key}'," />
                                                <c:set var="values" value="${values}${entry.value}," />
                                            </c:forEach>
                                            <c:set var="labels" value="${fn:substring(labels, 0, fn:length(labels) - 1)}" />
                                            <c:set var="values" value="${fn:substring(values, 0, fn:length(values) - 1)}" />

                                            <script>
                                                document.addEventListener("DOMContentLoaded", function () {
                                                    // Chuyển values từ JSP sang biến JavaScript
                                                    var dataValues = [${values}];
                                                    var maxValue = Math.max(...dataValues);
                                                    var yMax = Math.ceil(maxValue * 1.2 / 100000) * 100000; // tăng thêm 20%, làm tròn theo 100k

                                                    var optionsProfileVisit = {
                                                        chart: {
                                                            type: 'bar',
                                                            height: 350
                                                        },
                                                        series: [{
                                                                name: 'Revenue',
                                                                data: dataValues
                                                            }],
                                                        xaxis: {
                                                            categories: [${labels}]
                                                        },
                                                        yaxis: {
                                                            max: yMax,
                                                            tickAmount: 6,
                                                            labels: {
                                                                formatter: function (val) {
                                                                    return new Intl.NumberFormat('vi-VN', {
                                                                        style: 'currency',
                                                                        currency: 'VND'
                                                                    }).format(val);
                                                                }
                                                            }
                                                        },
                                                        tooltip: {
                                                            y: {
                                                                formatter: function (val) {
                                                                    return new Intl.NumberFormat('vi-VN', {
                                                                        style: 'currency',
                                                                        currency: 'VND'
                                                                    }).format(val);
                                                                }
                                                            }
                                                        },
                                                        dataLabels: {
                                                            enabled: true,
                                                            formatter: function (val) {
                                                                return new Intl.NumberFormat('vi-VN').format(val);
                                                            },
                                                            style: {
                                                                colors: ['#fff'] // màu chữ trên cột
                                                            }
                                                        }
                                                    };

                                                    var chartProfileVisit = new ApexCharts(document.querySelector("#chart-profile"), optionsProfileVisit);
                                                    chartProfileVisit.render();
                                                });
                                            </script>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-xl-12">
                                    <div class="card">
                                        <div class="card-header">
                                            <h4>Latest Comments</h4>
                                        </div>
                                        <div class="card-body">
                                            <div class="table-responsive">
                                                <table class="table table-hover table-lg">
                                                    <thead>
                                                        <tr>
                                                            <th>Name</th>
                                                            <th>Comment</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td class="col-3">
                                                                <div class="d-flex align-items-center">
                                                                    <div class="avatar avatar-md">
                                                                        <img src="${pageContext.request.contextPath}/asset/images/faces/5.jpg">
                                                                    </div>
                                                                    <p class="font-bold ms-3 mb-0">Si Cantik</p>
                                                                </div>
                                                            </td>
                                                            <td class="col-auto">
                                                                <p class=" mb-0">Congratulations on your graduation!</p>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="col-3">
                                                                <div class="d-flex align-items-center">
                                                                    <div class="avatar avatar-md">
                                                                        <img src="${pageContext.request.contextPath}/asset/images/faces/2.jpg">
                                                                    </div>
                                                                    <p class="font-bold ms-3 mb-0">Si Ganteng</p>
                                                                </div>
                                                            </td>
                                                            <td class="col-auto">
                                                                <p class=" mb-0">Wow amazing design! Can you make another
                                                                    tutorial for
                                                                    this design?</p>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-lg-3">
                            <div class="card">
                                <div class="card-body py-4 px-5">
                                    <div class="d-flex align-items-center">
                                        <img src="${pageContext.request.contextPath}/${sessionScope.user.imageURL}"
                                             alt="User Avatar"
                                             style="
                                             width: 80px;
                                             height: 80px;
                                             border-radius: 50%;
                                             border: 2px solid #ddd;
                                             object-fit: cover;
                                             flex-shrink: 0;
                                             ">
                                        <div class="ms-3 name" style="min-width: 0; flex: 1;">
                                            <h5 class="font-bold mb-1" style="font-size: 1rem; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
                                                <c:out value="${sessionScope.user.fullName}" />
                                            </h5>
                                            <h6 class="text-muted mb-0" style="font-size: 0.875rem; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
                                                <c:out value="${sessionScope.user.email}" />
                                            </h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-header">
                                    <h4>Top Customer</h4>
                                </div>
                                <c:forEach var="c" items="${topCustomers}">
                                    <div class="recent-message d-flex align-items-center px-4 py-3" style="border-bottom: 1px solid #f0f0f0;">
                                        <div class="avatar" style="width: 70px; height: 70px; border-radius: 50%; overflow: hidden;">
                                            <img src="${pageContext.request.contextPath}/${c.imageURL}" alt="${c.fullName}" style="width: 100%; height: 100%; object-fit: cover;">
                                        </div>
                                        <div class="name ms-4">
                                            <h5 class="mb-1 fw-bold" style="font-size: 1.2rem;">${c.fullName}</h5>
                                            <h6 class="text-muted mb-0" style="font-size: 0.95rem;">${c.email}</h6>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                            <div class="card">
                                <div class="card-header">
                                    <h4>Order Status</h4>
                                </div>
                                <div class="card-body text-center">
                                    <div id="order-status-chart"></div>
                                </div>
                            </div>

                            <c:set var="labels" value="" />
                            <c:set var="values" value="" />
                            <c:forEach var="entry" items="${orderStatusStats}">
                                <!-- Convert Vietnamese labels to English -->
                                <c:choose>
                                    <c:when test="${entry.key == 'Thành công'}">
                                        <c:set var="labels" value="${labels}'Success'," />
                                    </c:when>
                                    <c:when test="${entry.key == 'Đã hủy'}">
                                        <c:set var="labels" value="${labels}'Cancelled'," />
                                    </c:when>
                                    <c:otherwise>
                                        <c:set var="labels" value="${labels}'${entry.key}'," />
                                    </c:otherwise>
                                </c:choose>
                                <c:set var="values" value="${values}${entry.value}," />
                            </c:forEach>
                            <c:set var="labels" value="${fn:substring(labels, 0, fn:length(labels) - 1)}" />
                            <c:set var="values" value="${fn:substring(values, 0, fn:length(values) - 1)}" />

                            <script>
                                document.addEventListener("DOMContentLoaded", function () {
                                    var options = {
                                        chart: {
                                            type: 'donut',
                                            width: '100%',
                                        },
                                        labels: [${labels}],
                                        series: [${values}],
                                        colors: ['#28a745', '#dc3545'],
                                        plotOptions: {
                                            pie: {
                                                donut: {
                                                    size: '30%' // Dày hơn: vòng to, lỗ nhỏ
                                                }
                                            }
                                        },
                                        dataLabels: {
                                            formatter: function (val, opts) {
                                                return val.toFixed(1) + "%";
                                            },
                                            style: {
                                                fontSize: '16px',
                                                fontWeight: 'bold',
                                            }
                                        },
                                        legend: {
                                            position: 'bottom',
                                            markers: {
                                                width: 10,
                                                height: 10
                                            }
                                        },
                                        tooltip: {
                                            y: {
                                                formatter: function (val) {
                                                    return new Intl.NumberFormat('en-US').format(val) + " orders";
                                                }
                                            }
                                        }
                                    };

                                    var chart = new ApexCharts(document.querySelector("#order-status-chart"), options);
                                    chart.render();
                                });
                            </script>

                        </div>
                    </section>
                </div>

                <footer>
                    <div class="footer clearfix mb-0 text-muted">
                        <p>Create by Vu Ngoc Chinh<span class="text-danger">&nbsp;<i class="bi bi-heart"></i></span></p>
                    </div>
            </div>
        </footer>
    </div>
</div>
<script src="${pageContext.request.contextPath}/asset/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="${pageContext.request.contextPath}/asset/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/asset/vendors/apexcharts/apexcharts.js"></script>
<script src="${pageContext.request.contextPath}/asset/js/pages/dashboard.js"></script>
<script src="${pageContext.request.contextPath}/asset/js/main.js"></script>
</body>

</html>