<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Sidebar Start -->
<div class="sidebar pe-4 pb-3">
    <nav class="navbar bg-light navbar-light">
        <a href="${pageContext.request.contextPath}/admin" class="navbar-brand mx-4 mb-3">
            <h3 class="text-primary">Online Store</h3>
        </a>
        <div class="d-flex align-items-center ms-4 mb-4">
            <div class="position-relative">
                <img class="rounded-circle" src="img/pictureAdmin.jpg" alt="" style="width: 40px; height: 40px;">
                <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
            </div>
            <div class="ms-3">
                <h6 class="mb-0">Hoài Anh</h6>
                <span>Admin</span>
            </div>
        </div>
        <div class="navbar-nav w-100">
            <a href="${pageContext.request.contextPath}/admin"
               class="nav-item nav-link
               ${pageContext.request.requestURI.endsWith("/admin") ? "active" : ""}">
                <i class="fas fa-home"></i>Dashboard
            </a>
            <div class="nav-item">
                <a href="${pageContext.request.contextPath}/admin/list-seller" class="nav-link">
                    <i class="fas fa-regular fa-user"></i>List Seller</a>
            </div>
            <div class="nav-item">
                <a href="${pageContext.request.contextPath}/admin/list-seller" class="nav-link">
                    <i class="fas fa-user-circle"></i>List Customer</a>
            </div>

            <a href="widget.html" class="nav-item nav-link"><i class="fa fa-th me-2"></i>Widgets</a>
            <a href="table.html" class="nav-item nav-link"><i class="fa fa-table me-2"></i>Tables</a>
            <a href="chart.html" class="nav-item nav-link"><i class="fa fa-chart-bar me-2"></i>Charts</a>
        </div>
    </nav>
</div>
<!-- Sidebar End -->