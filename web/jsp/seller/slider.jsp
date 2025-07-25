<%-- 
    Document   : slider
    Created on : Jun 18, 2025, 12:35:31 AM
    Author     : chinh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Seller Dashboard</title>
    </head>
    <body>
        <div class="sidebar-menu">
            <ul class="menu">
                <li class="sidebar-title">Menu</li>

                <li class="sidebar-item active ">
                    <a href="${pageContext.request.contextPath}/seller/seller-dashboard" class='sidebar-link'>
                        <i class="bi bi-grid-fill"></i>
                        <span>Dashboard</span>
                    </a>
                </li>

                <li class="sidebar-item active ">
                    <a href="${pageContext.request.contextPath}/requests" class='sidebar-link'>
                        <i class="bi bi-grid-fill"></i>
                        <span>Request Admin</span>
                    </a>
                </li>


                <li class="sidebar-item active ">
                    <a href="${pageContext.request.contextPath}/CategoriesURL" class='sidebar-link'>
                        <i class="bi bi-grid-fill"></i>
                        <span>List Categories</span>
                    </a>
                </li>

                
                 <li class="sidebar-item active ">
                    <a href="${pageContext.request.contextPath}/BlogURL" class='sidebar-link'>
                        <i class="bi bi-grid-fill"></i>
                        <span>List Blogs</span>
                    </a>
                </li>
                

                <li class="sidebar-item active ">
                    <a href="${pageContext.request.contextPath}/seller/list-customer" class='sidebar-link'>
                        <i class="bi bi-grid-fill"></i>
                        <span>List Customers</span>
                    </a>
                </li>

                <li class="sidebar-item active ">
                    <a href="${pageContext.request.contextPath}/seller/list-order" class='sidebar-link'>
                        <i class="bi bi-grid-fill"></i>
                        <span>List Order</span>
                    </a>
                </li>
                
                <li class="sidebar-item active ">
                    <a href="${pageContext.request.contextPath}/seller/products" class='sidebar-link'>
                        <i class="bi bi-grid-fill"></i>
                        <span>List Product</span>
                    </a>
                </li>
                
                <li class="sidebar-item active ">
                    <a href="${pageContext.request.contextPath}/seller/feedback" class='sidebar-link'>
                        <i class="bi bi-grid-fill"></i>
                        <span>List Feedback</span>
                    </a>
                </li>
                
                <li class="sidebar-item active ">
                    <a href="${pageContext.request.contextPath}/seller/list-voucher" class='sidebar-link'>
                        <i class="bi bi-grid-fill"></i>
                        <span>List Voucher</span>
                    </a>
                </li>
                <li class="sidebar-item active ">
                    <a href="${pageContext.request.contextPath}/seller/seller-profile" class='sidebar-link'>
                        <i class="iconly-boldShow"></i>
                        <span>View Profile</span>
                    </a>
                </li>
                <li class="sidebar-item active ">
                    <a href="${pageContext.request.contextPath}/seller/seller-password" class='sidebar-link'>
                        <i class="bi bi-lock-fill"></i>
                        <span>Change Password</span>
                    </a>
                </li>

                <li class="sidebar-item">
                    <a href="${pageContext.request.contextPath}/LogoutAccount" class='sidebar-link'>
                        <i class="bi bi-box-arrow-right"></i>
                        <span>Logout</span>
                    </a>
                </li>

            </ul>
        </div>
    </body>
</html>
