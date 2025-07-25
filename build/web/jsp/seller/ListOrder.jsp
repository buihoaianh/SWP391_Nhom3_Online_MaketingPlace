<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>List Orders by Seller</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/bootstrap.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/vendors/bootstrap-icons/bootstrap-icons.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/app.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/list-orders.css">
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/asset/images/favicon.svg" type="image/x-icon">
        <!-- DataTables CSS -->
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css">

        <style>
            /* General body styling */
            body {
                background-color: #f5f7fa;
                font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;
                color: #2d3748;
                margin: 0;
                line-height: 1.5;
            }

            /* Main container */
            #main {
                padding: 20px;
                min-height: 100vh;
            }

            /* Title styling */
            h2.title {
                background: linear-gradient(135deg, #435EBE 0%, #677ce4 100%);
                color: #ffffff;
                padding: 20px 40px;
                border-radius: 12px;
                margin: 30px auto 40px auto;
                max-width: 600px;
                text-align: center;
                font-weight: 700;
                font-size: 2rem;
                box-shadow: 0 6px 14px rgba(0, 0, 0, 0.1);
                transition: transform 0.3s ease, box-shadow 0.3s ease;
            }

            h2.title:hover {
                transform: translateY(-4px);
                box-shadow: 0 8px 18px rgba(0, 0, 0, 0.15);
            }

            /* Sidebar styling */
            #sidebar .sidebar-wrapper {
                background-color: #ffffff;
                border-right: 1px solid #e2e8f0;
                box-shadow: 0 2px 12px rgba(0, 0, 0, 0.05);
                transition: transform 0.3s ease;
            }

            #sidebar.active .sidebar-wrapper {
                transform: translateX(0);
            }

            .logo-img {
                max-width: 200px;
                height: auto;
                transition: transform 0.3s ease;
            }

            .logo-img:hover {
                transform: scale(1.1);
            }

            .sidebar-toggler {
                background: #435EBE;
                color: white;
                border: none;
                border-radius: 8px;
                padding: 8px;
                transition: background 0.2s ease;
            }

            .sidebar-toggler:hover {
                background: #677ce4;
            }

            /* Table container */
            .table-responsive {
                padding: 0 20px;
                margin-bottom: 40px;
            }

            /* Table styling */
            .table {
                border-radius: 10px;
                overflow: hidden;
                box-shadow: 0 6px 20px rgba(0, 0, 0, 0.08);
                background-color: #ffffff;
                border-collapse: collapse; /* Changed to collapse for proper border rendering */
            }

            .table thead {
                background: linear-gradient(135deg, #435EBE 0%, #677ce4 100%); /* Matches h2.title */
                color: #ffffff;
                text-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
            }

            .table th {
                font-weight: 600;
                padding: 16px;
                text-transform: uppercase;
                font-size: 0.95rem;
                letter-spacing: 0.6px;
                border: 1px solid #d1d7e0; /* Added border for header cells */
                text-align: center;
            }

            .table td {
                padding: 14px 16px;
                font-size: 0.95rem;
                border: 1px solid #d1d7e0; /* Added border for body cells */
                transition: background-color 0.2s ease;
                text-align: center;
            }

            .table tbody tr {
                transition: background-color 0.3s ease;
            }

            .table tbody tr:hover {
                background-color: #f1f5f9;
            }

            /* Badge styling */
            .badge {
                font-size: 0.9rem;
                padding: 8px 14px;
                border-radius: 50px;
                font-weight: 500;
                transition: transform 0.2s ease, box-shadow 0.2s ease;
            }

            .badge:hover {
                transform: translateY(-2px);
                box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
            }

            /* Specific badge colors */
            .badge.bg-warning {
                background-color: #f6c107 !important;
                color: #1a202c !important;
            }

            .badge.bg-success {
                background-color: #2ea44f !important;
            }

            .badge.bg-danger {
                background-color: #e53e3e !important;
            }

            .badge.bg-secondary {
                background-color: #718096 !important;
            }

            .badge.bg-primary {
                background-color: #3182ce !important;
            }

            .badge.bg-light {
                background-color: #edf2f7 !important;
                color: #2d3748 !important;
            }

            /* Alert styling */
            .alert {
                max-width: 700px;
                margin: 20px auto;
                border-radius: 10px;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
                font-size: 1rem;
                background: #e6fffa;
                border: 1px solid #b2f5ea;
                color: #2d3748;
            }

            .alert .btn-close {
                padding: 14px;
                opacity: 0.8;
                transition: opacity 0.2s ease;
            }

            .alert .btn-close:hover {
                opacity: 1;
            }

            /* Responsive adjustments */
            @media (max-width: 992px) {
                .table-responsive {
                    padding: 0 15px;
                }

                h2.title {
                    font-size: 1.75rem;
                    padding: 15px 30px;
                    max-width: 90%;
                }

                .table th, .table td {
                    font-size: 0.9rem;
                    padding: 12px;
                }

                .logo-img {
                    max-width: 160px;
                }
            }

            @media (max-width: 768px) {
                #main {
                    padding: 15px;
                }

                h2.title {
                    font-size: 1.5rem;
                    padding: 12px 25px;
                }

                .table th, .table td {
                    font-size: 0.85rem;
                    padding: 10px;
                }
            }

            @media (max-width: 576px) {
                h2.title {
                    font-size: 1.25rem;
                    padding: 10px 20px;
                }

                .table th, .table td {
                    font-size: 0.8rem;
                    padding: 8px;
                }

                .badge {
                    font-size: 0.8rem;
                    padding: 6px 10px;
                }

                .alert {
                    font-size: 0.9rem;
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
                            <img src="${pageContext.request.contextPath}/asset/images/logo/logo.png" alt="Logo" class="logo-img">
                        </a>
                    </div>
                    <jsp:include page="slider.jsp" />
                    <button class="sidebar-toggler btn x"><i data-feather="x"></i></button>
                </div>
            </div>
            <div id="main">
                <h2 class="text-center title">List Orders</h2>

                <c:if test="${not empty sessionScope.statusMessage}">
                    <div class="alert alert-success alert-dismissible fade show text-center" role="alert">
                        ${sessionScope.statusMessage}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                    <c:remove var="statusMessage" scope="session"/>
                </c:if>

                <div class="table-responsive">
                    <table id="orderTable" class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>Order ID</th>
                                <th>Customer Name</th>
                                <th>Total Amount</th>
                                <th>Order Date</th>
                                <th>Status</th>
                                <th>Action</th> <!-- Cột mới -->
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="order" items="${orders}" varStatus="loop">
                                <tr>
                                    <td>${order.orderId}</td>
                                    <td>${order.customerName}</td>
                                    <td class="text-end">${order.totalAmount} ₫</td>
                                    <td>${order.orderDate}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${order.orderStatusName == 'Waiting for delivery'}">
                                                <span class="badge bg-warning text-dark">${order.orderStatusName}</span>
                                            </c:when>
                                            <c:when test="${order.orderStatusName == 'Success'}">
                                                <span class="badge bg-success">${order.orderStatusName}</span>
                                            </c:when>
                                            <c:when test="${order.orderStatusName == 'Cancel'}">
                                                <span class="badge bg-danger">${order.orderStatusName}</span>
                                            </c:when>
                                            <c:when test="${order.orderStatusName == 'Wait for confirmation'}">
                                                <span class="badge bg-secondary">${order.orderStatusName}</span>
                                            </c:when>
                                            <c:when test="${order.orderStatusName == 'Delivered'}">
                                                <span class="badge bg-primary">${order.orderStatusName}</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge bg-light text-dark">${order.orderStatusName}</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <form action="${pageContext.request.contextPath}/seller/update-order-status" method="post" class="text-center">
                                            <input type="hidden" name="orderId" value="${order.orderId}" />

                                            <c:choose>
                                                <c:when test="${order.orderStatusName == 'Wait for confirmation'}">
                                                    <button name="status" value="6" class="btn btn-sm btn-warning" title="Confirm Deliver">
                                                        Confirm Deliver
                                                    </button>
                                                </c:when>

                                                <c:when test="${order.orderStatusName == 'Waiting for delivery'}">
                                                    <button name="status" value="8" class="btn btn-sm btn-primary" title="Mark as Delivered">
                                                        Mark as Delivered
                                                    </button>
                                                </c:when>

                                                <c:when test="${order.orderStatusName == 'Payment Received'}">
                                                    <button name="status" value="2" class="btn btn-sm btn-success" title="Received Payment">
                                                        Received Payment
                                                    </button>
                                                </c:when>

                                                <c:when test="${order.orderStatusName == 'Success'}">
                                                    <span class="text-success fw-bold">Completed</span>
                                                </c:when>

                                                <c:when test="${order.orderStatusName == 'Out For Delivery'}">
                                                    <span class="text-secondary">Wait User Confirm</span>
                                                </c:when>

                                                <c:otherwise>
                                                    <span class="text-secondary"></span>
                                                </c:otherwise>
                                            </c:choose>
                                        </form>
                                    </td>

                                </tr>
                            </c:forEach>
                            <c:if test="${empty orders}">
                                <tr>
                                    <td colspan="8" class="text-center">No orders found</td>
                                </tr>
                            </c:if>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <script src="${pageContext.request.contextPath}/asset/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
        <script src="${pageContext.request.contextPath}/asset/js/bootstrap.bundle.min.js"></script>
        <script src="${pageContext.request.contextPath}/asset/js/main.js"></script>
        <!-- jQuery -->
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <!-- DataTables JS -->
        <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>
        <script>
            let table = $('#orderTable').DataTable({
                order: [[0, 'desc']], // ✅ Sắp xếp theo OrderID giảm dần
                pageLength: 10,
                lengthChange: false,
                ordering: true,
                autoWidth: false,
                responsive: true,
                language: {
                    search: "🔍 Search:",
                    zeroRecords: "No matching orders found",
                    paginate: {
                        previous: "⬅ Prev",
                        next: "Next ➡"
                    },
                    info: "Showing _START_ to _END_ of _TOTAL_ orders",
                    infoEmpty: "No orders to show"
                }
            });

// 👉 Thêm bộ lọc trạng thái bên cạnh ô tìm kiếm
            $('#orderTable_filter').append(`
    <select id="statusFilter" class="form-select form-select-sm ms-3 w-auto d-inline-block">
    <option value="">All Status</option>
    <option value="Wait for confirmation">Wait for confirmation</option>
    <option value="Waiting for delivery">Waiting for delivery</option>
    <option value="Delivered - COD pending">Delivered - COD pending</option>
    <option value="Success">Success</option>
    <option value="Cancel">Cancel</option>
    <option value="Out For Delivery">Out For Delivery</option>
    <option value="Payment Received">Payment Received</option>
</select>

`);

// 👉 Bắt sự kiện lọc theo trạng thái
            $('#statusFilter').on('change', function () {
                table.column(4).search(this.value).draw(); // Cột 4 là cột status
            });
        </script>

    </body>
</html>