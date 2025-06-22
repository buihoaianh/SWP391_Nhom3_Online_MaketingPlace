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
    </head>

    <body>
        <div id="app">
            <div id="sidebar" class="active">
                <div class="sidebar-wrapper active">
                    <div class="logo d-flex align-items-center">
                        <a href="#">
                            <img src="${pageContext.request.contextPath}/asset/images/logo/logo.png" alt="Logo" style="max-width: 180px; height: auto;">
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
                    <h3>Seller Profile</h3>
                </div>

                <div class="content">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-8">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="card-title">Edit Profile</h4>
                                    </div>
                                    <div class="card-body">
                                        <form action="update-seller-profile" method="post" enctype="multipart/form-data">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <label>Full Name</label>
                                                    <input type="text" class="form-control" name="fullName" value="${account.fullName}" />
                                                </div>
                                                <div class="col-md-6">
                                                    <label>Email</label>
                                                    <input type="email" class="form-control" name="email" value="${account.email}" />
                                                </div>
                                            </div>

                                            <div class="row mt-3">
                                                <div class="col-md-6">
                                                    <label>Phone Number</label>
                                                    <input type="text" class="form-control" name="phoneNumber" value="${account.phoneNumber}" />
                                                </div>
                                                <div class="col-md-6">
                                                    <label>Address</label>
                                                    <input type="text" class="form-control" name="address" value="${account.address}" />
                                                </div>
                                            </div>

                                            <div class="row mt-3">
                                                <div class="col-md-12">
                                                    <label>Description</label>
                                                    <textarea class="form-control" name="description" rows="4">${account.description}</textarea>
                                                </div>
                                            </div>

                                            <div class="row mt-3 align-items-center">
                                                <div class="col-md-4">
                                                    <label>Upload Avatar</label>
                                                    <input type="file" name="avatar" class="form-control" accept="image/*" onchange="previewImage(this)" />
                                                </div>
                                                <div class="col-md-4 d-flex align-items-center justify-content-center">
                                                    <div class="text-center">
                                                        <img id="preview"
                                                             src="${pageContext.request.contextPath}/${account.imageURL}"
                                                             alt="Avatar Preview"
                                                             style="width: 120px; height: 120px; object-fit: cover; border-radius: 50%; border: 2px solid #ccc;">
                                                        <p class="mt-2 text-muted" style="font-size: 0.9rem;">Current Avatar</p>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mt-4">
                                                <div class="col-md-4">
                                                    <button type="submit" class="btn btn-primary w-100">Update Profile</button>
                                                </div>
                                                <div class="col-md-4">
                                                    <a href="${pageContext.request.contextPath}/saller-dashboard" class="btn btn-secondary w-100">Back to Dashboard</a>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="card card-user">
                                    <div class="card-image">
                                        <img src="https://ununsplash.imgix.net/photo-1431578500526-4d9613015464?fit=crop&fm=jpg&h=300&q=75&w=400" alt="background" style="width: 100%; height: 150px; object-fit: cover;">
                                    </div>
                                    <div class="card-body text-center" style="margin-top: -60px;">
                                        <img 
                                            class="avatar border-gray rounded-circle" 
                                            src="${pageContext.request.contextPath}/${account.imageURL}" 
                                            alt="User Avatar"
                                            style="width: 120px; height: 120px; object-fit: cover; border: 4px solid #fff;">
                                        <h5 class="title mt-3">${account.fullName}</h5>
                                        <p class="description">${account.email}</p>
                                        <p class="description">${account.phoneNumber}</p>
                                    </div>
                                    <hr>
                                    <div class="button-container text-center mb-3">
                                        <a href="#" class="btn btn-outline-primary btn-sm mx-1"><i class="bi bi-facebook"></i></a>
                                        <a href="#" class="btn btn-outline-info btn-sm mx-1"><i class="bi bi-twitter"></i></a>
                                        <a href="#" class="btn btn-outline-danger btn-sm mx-1"><i class="bi bi-google"></i></a>
                                    </div>
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
