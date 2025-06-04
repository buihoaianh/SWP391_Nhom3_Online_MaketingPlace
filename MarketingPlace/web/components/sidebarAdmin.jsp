<%-- 
    Document   : sidebarAdmin
    Created on : Jun 3, 2025, 8:09:41 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Sidebar Start -->
<div class="sidebar bg-light text-dark pe-4 pb-3">
    <nav class="navbar bg-light navbar-light text-dark">
        <a href="${pageContext.request.contextPath}/admin" class="navbar-brand mx-4 mb-3">
            <h3 class="text-primary">Online Store</h3>
        </a>
        <div class="d-flex align-items-center ms-4 mb-4">
            <div class="position-relative">
                <img class="rounded-circle" src="img/Anhdaidien.jpg" alt="" style="width: 40px; height: 40px;">
                <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
            </div>
            <div class="ms-3">
                <h6 class="mb-0">F5 Refresh</h6>
                <span>Admin</span>
            </div>
        </div>
        <div class="navbar-nav w-100 text-dark">
            <a href="${pageContext.request.contextPath}/admin"
               class="nav-item nav-link text-dark
               ${pageContext.request.requestURI.endsWith("/admin") ? "active" : ""}">
                <i class="fas fa-home text-dark"></i>Dashboard
            </a>
            <div class="nav-item text-dark">
                <a href="${pageContext.request.contextPath}/admin/list-seller" class="nav-link text-dark">
                    <i class="fas fa-regular fa-user text-dark"></i>List Seller</a>
            </div>
            <div class="nav-item text-dark">
                <a href="${pageContext.request.contextPath}/admin/list-seller" class="nav-link text-dark">
                    <i class="fas fa-user-circle text-dark"></i>List Customer</a>
            </div>

            <a href="widget.html" class="nav-item nav-link text-dark"><i class="fa fa-th me-2 text-dark"></i>Widgets</a>
            <a href="table.html" class="nav-item nav-link text-dark"><i class="fa fa-table me-2 text-dark"></i>Tables</a>
            <a href="chart.html" class="nav-item nav-link text-dark"><i class="fa fa-chart-bar me-2 text-dark"></i>Charts</a>
        </div>
    </nav>
</div>
<!-- Sidebar End -->
