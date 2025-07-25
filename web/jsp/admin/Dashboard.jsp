<%-- 
    Document   : Dashboard
    Created on : May 27, 2025, 9:25:13 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>DASHBOARD</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="${pageContext.request.contextPath}/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
        <!-- Flatpickr CSS -->
        <link href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css" rel="stylesheet">

        <style>

            body {
                overflow-x: hidden;
            }

            .content {
                border: 1px solid #ccc;
                border-radius: 10px;
                padding: 20px;
                margin-left: 300px;
                width: 80%;
            }

            h6.mb-4 {
                text-align: center;
                font-size: 20px;
                font-weight: bold;
            }

            ul {
                list-style-type: none;
                padding: 0;
                margin: 0;
            }

            ul li {
                display: flex;
                justify-content: space-between;
                padding: 8px 0;
                font-size: 16px;
            }

            ul li strong {
                color: #333;
                font-weight: bold;
            }

            ul li {
                font-size: 18px;
                color: #000;
            }

            ul li .category-name {
                flex: 1;
            }

            ul li .category-revenue {
                text-align: right;
                font-weight: normal;
                color: #000;
            }
            #chart {
                width: 100%;
                height: 400px;
            }



        </style>
    </head>

    <body>
        <div class="container-xxl position-relative bg-white d-flex p-0">
            <!-- Spinner Start -->
            <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
                <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                    <span class="sr-only">Loading...</span>
                </div>
            </div>
        </div>
        <!-- Spinner End -->


        <%@ include file="../../components/sidebarAdmin.jsp" %>


        <!-- Content Start -->
        <div class="content">
            <!-- Navbar Start -->
            <nav class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0">
                <div class="navbar-nav align-items-center ms-auto">
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                            <img class="rounded-circle" 
                                 src="${pageContext.request.contextPath}/img/Admin.jpg" 
                                 alt="Admin Image" 
                                 style="width: 40px; height: 50px;">
                            <span class="d-none d-lg-inline-flex">e Store Admin</span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                            <a href="LogoutAccount" class="dropdown-item">Log Out</a>
                        </div>
                    </div>
                </div>
            </nav>
            <!-- Navbar End -->


            <!-- Sale & Revenue Start -->

            <div class="container-fluid pt-4 px-4">
                <div class="row g-4">
                    <div class="col-sm-6 col-xl-3">
                        <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                            <i class="fa fa-chart-line fa-3x text-primary "></i>
                            <div class="ms-3">
                                <p class="mb-2">Total Sellers</p>
                                <h6 class="mb-0">${totalSellers}</h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-xl-3">
                        <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                            <i class="fa fa-chart-bar fa-3x text-primary"></i>
                            <div class="ms-3">
                                <p class="mb-2">Total Customers</p>
                                <h6 class="mb-0">${totalCustomers}</h6> 
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-xl-3">
                        <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                            <i class="fa fa-box fa-3x text-primary"></i>
                            <div class="ms-3">
                                <p class="mb-2">Today Products</p>
                                <h6 class="mb-0">${totalProducts}</h6>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-6 col-xl-3">
                        <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                            <i class="fa fa-chart-line fa-3x text-primary"></i>
                            <div class="ms-3">
                                <p class="mb-2">Total Revenue</p>
                                <h6 class="mb-0">
                                    <c:out value="${totalRevenue}" />
                                </h6>
                            </div>
                        </div>
                    </div>



                </div>
            </div>
            <!-- Sale & Revenue End -

            <!-- Sales Chart End -->


            <!-- Top Sellers & Customers Charts Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="row">
                    <div class="col-md-6">
                        <div class="bg-light rounded p-4">
                            <div id="topSellersChart" style="height: 450px; width: 100%;"></div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="bg-light rounded p-4">

                            <div id="topCustomersChart" style="height: 450px; width: 100%;"></div>

                        </div>
                    </div>
                </div>
            </div>
            <!-- Top Sellers & Customers Charts End -->



            <!-- Widgets Start -->

<!--            <div class="container-fluid pt-4 px-4">
                <div class="row g-4">
                     Biểu đồ số lượng sản phẩm theo Category 
                    <div class="col-sm-12 col-md-8">
                        <div class="bg-light rounded p-4">
                            <h6 class="mb-4">Số lượng sản phẩm theo Category</h6>
                            <div id="chart1"></div>  Đổi id 
                        </div>
                    </div>

                     Lịch chiếm 4 phần 
                    <div class="col-sm-12 col-md-4">
                        <div class="bg-light rounded p-4">
                            <h6 class="mb-4">Calendar</h6>
                            <div id="inlineCalendar"></div>
                        </div>
                    </div>

                    <div class="col-12">
                        <div class="bg-light rounded p-4">
                            <h6 class="mb-4">Số lượng sản phẩm theo Category</h6>
                            <div id="chart2"></div>  Đổi id 
                        </div>
                    </div>
                </div>
            </div>-->

            <!-- Widgets End -->


            <!-- Footer Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="bg-light rounded-top p-4">
                    <div class="row">
                        <div class="col-12 col-sm-6 text-center text-sm-start">
                            &copy; <a href="#">e Store</a>, All Right Reserved. 
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <!-- Content End -->
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/lib/chart/chart.min.js"></script>
    <script src="${pageContext.request.contextPath}/lib/easing/easing.min.js"></script>
    <script src="${pageContext.request.contextPath}/lib/waypoints/waypoints.min.js"></script>
    <script src="${pageContext.request.contextPath}/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/lib/tempusdominus/js/moment.min.js"></script>
    <script src="${pageContext.request.contextPath}/lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="${pageContext.request.contextPath}/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="${pageContext.request.contextPath}/js/main.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/echarts/dist/echarts.min.js"></script>

    <!-- Flatpickr JS -->
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <script src="${pageContext.request.contextPath}/js/main.js"></script>

<!--    <script>
        const chartDom = document.getElementById('chart1');  // Đảm bảo id chính xác
        const myChart = echarts.init(chartDom);

        const categoryNames = [<c:forEach items="${productCountByCategory}" var="entry">${entry.key},</c:forEach>];
        const productCounts = [<c:forEach items="${productCountByCategory}" var="entry">${entry.value},</c:forEach>];

        const option = {
            title: {
                text: 'Số lượng sản phẩm theo Category',
                left: 'center',
            },
            tooltip: {},
            xAxis: {
                type: 'category',
                data: categoryNames,
            },
            yAxis: {},
            series: [{
                    data: productCounts,
                    type: 'bar',
                    label: {show: true, position: 'top'},
                }],
        };

        myChart.setOption(option);

        </script>-->
<!--        <script>
            // Calendar initialization (Flatpickr or any other library)
            flatpickr("#inlineCalendar", {
                inline: true,
                defaultDate: "today",
                dateFormat: "Y-m-d"
            });
        </script>-->


        <script>
            const topSellersChart = echarts.init(document.getElementById('topSellersChart'));
            const topCustomersChart = echarts.init(document.getElementById('topCustomersChart'));

            const sellerNames = [<c:forEach items="${topSellers}" var="entry" varStatus="loop">${loop.index > 0 ? ',' : ''}'${entry.key}'</c:forEach>];
            const sellerRevenue = [<c:forEach items="${topSellers}" var="entry" varStatus="loop">${loop.index > 0 ? ',' : ''}${entry.value}</c:forEach>];

            const customerNames = [<c:forEach items="${topCustomers}" var="entry" varStatus="loop">${loop.index > 0 ? ',' : ''}'${entry.key}'</c:forEach>];
            const customerSpent = [<c:forEach items="${topCustomers}" var="entry" varStatus="loop">${loop.index > 0 ? ',' : ''}${entry.value}</c:forEach>];

            const watermarkOption = (title, xData, yData) => ({
                    title: {
                        text: title,
                        left: 'center'
                    },

                    tooltip: {
                        trigger: 'item',
                        formatter: function (params) {
                            return params.name + "<br/>" + Number(params.value).toLocaleString() + " ₫";
                        }

                    },

                    grid: {
                        left: '3%',
                        right: '3%',
                        bottom: '10%',
                        containLabel: true
                    },

                    xAxis: {
                        type: 'category',
                        data: xData,
                        axisLabel: {
                            rotate: 30,
                            interval: 0,
                            fontSize: 12
                        }
                    },

                    yAxis: {
                        type: 'value',
                        axisLabel: {
                            formatter: value => value.toLocaleString() + ' ₫'
                        }
                    },

                    series: [{
                            data: yData,
                            type: 'bar',
                            itemStyle: {color: '#009CFF'}
                        }],
                    graphic: {
                        type: 'text',
                        left: 'center',
                        top: 'center',
                        style: {
                            text: 'Online Marketing',
                            font: 'bold 24px sans-serif',
                            fill: 'rgba(0,0,0,0.1)'
                        }
                    }
                });
            window.addEventListener('resize', () => {
                topSellersChart.resize();
                topCustomersChart.resize();
            });


            topSellersChart.setOption(watermarkOption('Top Sellers by Revenue', sellerNames, sellerRevenue));
            topCustomersChart.setOption(watermarkOption('Top Customers by Spending', customerNames, customerSpent));
    </script>



</body>

</html>