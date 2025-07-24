<%@page contentType="text/html;charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Statistic</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Fonts & Icons -->
        <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries -->
        <link href="${pageContext.request.contextPath}/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

        <!-- Bootstrap & Template CSS -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/list-seller.css" rel="stylesheet">

        <!-- ECharts -->
        <script src="https://cdn.jsdelivr.net/npm/echarts/dist/echarts.min.js"></script>

        <style>
            .chart-container {
                flex: 1;
                padding: 30px;
                background-color: #f5f7fa;
            }

            #chart {
                width: 100%;
                height: 500px;
                background-color: #ffffff;
                border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0,0,0,0.1);
                padding: 20px;
            }

            .button-group {
                display: flex;
                justify-content: center;
                gap: 15px;
                margin-top: 30px;
            }

            .button-group a {
                min-width: 150px;
                text-align: center;
                font-weight: 600;
                border-radius: 30px;
                padding: 10px 18px;
                font-size: 15px;
                transition: all 0.3s ease;
                box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
            }

            .button-group a.btn-outline-primary:hover {
                background-color: #4e73df;
                color: #fff;
            }

            .button-group a.btn-outline-success:hover {
                background-color: #1cc88a;
                color: #fff;
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
            <!-- Spinner End -->

            <!-- Sidebar -->
            <%@ include file="../../components/sidebarAdmin.jsp" %>

            <!-- Main Chart Content -->
            <div class="content chart-container">
                <h3 class="mb-4 text-primary">Chart of product quantity by category</h3>
                <div id="chart"></div>
                <div class="button-group">
                    <a href="${pageContext.request.contextPath}/admin/statistic/StatisticController?sort=asc" class="btn btn-outline-primary">
                        <i class="fas fa-sort-amount-up-alt me-1"></i> Sort Ascending
                    </a>

                    <a href="${pageContext.request.contextPath}/admin/statistic/StatisticController?sort=desc" class="btn btn-outline-primary">
                        <i class="fas fa-sort-amount-down-alt me-1"></i> Sort Descending
                    </a>

                    <a href="${pageContext.request.contextPath}/admin/statistic/statisticCategoryAdmin" class="btn btn-outline-success">
                        <i class="fas fa-file-alt me-1"></i> View Report
                    </a>
                </div>


            </div>
        </div>

        <!-- Chart Script -->
        <script>
            const params = new URLSearchParams(window.location.search);
            const sortParam = params.get('sort') || 'asc';

            fetch(`<%= request.getContextPath() %>/admin/statistic/StatisticController?sort=${sortParam}`)
                        .then(response => response.json())
                        .then(data => {
                            const chartDom = document.getElementById('chart');
                            const myChart = echarts.init(chartDom);
                            const option = {
                                title: {
                                    text: 'Number of products by category',
                                    left: 'center',
                                    textStyle: {
                                        fontSize: 18
                                    }
                                },
                                tooltip: {},
                                dataset: {
                                    source: data.categories.map((cat, index) => [cat, data.values[index]])
                                },
                                xAxis: {type: 'category'},
                                yAxis: {},
                                series: [{
                                        type: 'bar',
                                        encode: {x: 0, y: 1},
                                        label: {show: true, position: 'top'},
                                        itemStyle: {color: '#4e73df'}
                                    }],
                                dataZoom: [{type: 'inside'}, {type: 'slider'}]
                            };
                            myChart.setOption(option);
                        });

        </script>


        <!-- JS Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="${pageContext.request.contextPath}/lib/chart/chart.min.js"></script>
        <script src="${pageContext.request.contextPath}/lib/easing/easing.min.js"></script>
        <script src="${pageContext.request.contextPath}/lib/waypoints/waypoints.min.js"></script>
        <script src="${pageContext.request.contextPath}/lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="${pageContext.request.contextPath}/lib/tempusdominus/js/moment.min.js"></script>
        <script src="${pageContext.request.contextPath}/lib/tempusdominus/js/moment-timezone.min.js"></script>
        <script src="${pageContext.request.contextPath}/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

        <!-- Template Main JS -->
        <script src="${pageContext.request.contextPath}/js/main.js"></script>
    </body>
</html>
