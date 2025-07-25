<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Seller Profile</title>

        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/bootstrap.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/vendors/iconly/bold.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/vendors/perfect-scrollbar/perfect-scrollbar.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/vendors/bootstrap-icons/bootstrap-icons.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/app.css">
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/asset/images/favicon.svg" type="image/x-icon">

        <style>
            html, body {
                height: 100%;
                margin: 0;
                display: flex;
                flex-direction: column;
            }

            #app {
                flex: 1;
                display: flex;
                flex-direction: column;
            }

            #main-content {
                flex: 1;
                display: flex;
                flex-direction: column;
            }

            .page-content {
                flex: 1;
            }

            footer {
                margin-top: auto;
            }

            .container {
                padding-left: 2rem;
            }

            .page-heading h3 {
                font-weight: 700;
                margin-left: 2rem;
                margin-top: 1rem;
            }

            .form-group label {
                font-weight: 600;
                margin-bottom: 0.5rem;
            }

            .form-control {
                border-radius: 0.5rem;
                padding: 0.75rem;
                font-size: 1rem;
            }

            .btn-primary {
                border-radius: 0.5rem;
                font-size: 1.1rem;
                padding: 0.6rem;
            }

            .alert-info {
                font-size: 0.95rem;
                padding: 0.75rem 1rem;
                border-radius: 0.5rem;
            }
        </style>
    </head>

    <body>
        <div id="app">
            <div id="sidebar" class="active">
                <div class="sidebar-wrapper active">
                    <div class="logo d-flex align-items-center">
                        <a href="#">
                            <img src="${pageContext.request.contextPath}/asset/images/logo/logo.png" alt="Logo"
                                 style="max-width: 180px; height: auto;">
                        </a>
                    </div>
                    <jsp:include page="slider.jsp" />
                    <button class="sidebar-toggler btn x"><i data-feather="x"></i></button>
                </div>
            </div>

            <div id="main" class="layout-navbar">
                <div id="main-content">
                    <div class="page-heading">
                        <h3>Change Password</h3>
                    </div>
                    <div class="page-content">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-6 col-md-8">
                                    <c:if test="${not empty success}">
                                        <div class="alert alert-success">${success}</div>
                                    </c:if>
                                    <c:if test="${not empty error}">
                                        <div class="alert alert-danger">${error}</div>
                                    </c:if>


                                    <form action="${pageContext.request.contextPath}/seller/seller-password" method="post">
                                        <div class="form-group mb-3">
                                            <label for="currentPassword">Current Password</label>
                                            <input type="password" class="form-control" name="currentPassword" required>
                                        </div>
                                        <div class="form-group mb-3">
                                            <label for="newPassword">New Password</label>
                                            <input type="password" class="form-control" name="newPassword" required>
                                        </div>
                                        <div class="form-group mb-3">
                                            <label for="confirmPassword">Confirm New Password</label>
                                            <input type="password" class="form-control" name="confirmPassword" required>
                                        </div>
                                        <button type="submit" class="btn btn-primary w-100">Change Password</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <script>
            function previewImage(input) {
                if (input.files && input.files[0]) {
                    const reader = new FileReader();
                    reader.onload = function (e) {
                        document.getElementById('preview').src = e.target.result;
                    };
                    reader.readAsDataURL(input.files[0]);
                }
            }
        </script>
    </body>

</html>
