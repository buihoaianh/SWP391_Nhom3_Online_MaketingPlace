<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Categories" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>List Categories</title>

        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/bootstrap.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/vendors/iconly/bold.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/vendors/perfect-scrollbar/perfect-scrollbar.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/vendors/bootstrap-icons/bootstrap-icons.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/app.css">
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/asset/images/favicon.svg" type="image/x-icon">
        <style>
            .img-preview {
                max-width: 150px;
                height: auto;
                margin-top: 4px;
                border: 1px solid #ccc;
                border-radius: 4px;
                display: none;
            }
            td {
                padding-bottom: 10px;
                vertical-align: top;
            }
            input[type="text"], input[type="file"] {
                width: 100%;
                box-sizing: border-box;
            }

            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background-color: #f4f6f8;
                margin: 40px;
            }

            h1 {
                text-align: center;
                color: #435EBE;
                margin-bottom: 30px;
                font-size: 36px;
                font-weight: 700;
            }

            form {
                width: 500px;
                margin: 0 auto;
                background-color: #ffffff;
                padding: 25px 30px;
                border-radius: 8px;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            }

            table {
                width: 100%;
            }

            td {
                padding-bottom: 15px;
                vertical-align: top;
                color: #435EBE;
                font-weight: 700;
            }

            input[type="text"], input[type="file"] {
                width: 100%;
                padding: 8px 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                box-sizing: border-box;
                font-size: 14px;
                transition: border-color 0.2s ease-in-out;
            }

            input[type="text"]:focus, input[type="file"]:focus {
                border-color: #007bff;
                outline: none;
            }

            button[type="submit"] {
                background-color: #435EBE;
                color: white;
                padding: 10px 18px;
                border: none;
                border-radius: 5px;
                font-size: 16px;
                cursor: pointer;
                width: 100%;
                transition: background-color 0.2s ease;
                
            }

            button[type="submit"]:hover {
                background-color: #0056b3;
                
            }

            .img-preview {
                max-width: 150px;
                height: auto;
                margin-top: 8px;
                border: 1px solid #ccc;
                border-radius: 4px;
                display: none;
            }
            .main-content-card {
                background-color: #fff;
                border: 1px solid #dee2e6;
                border-radius: 10px;
                padding: 30px 40px;
                box-shadow: 0 0 20px rgba(0,0,0,0.05);
                animation: fadeIn 0.6s ease-in-out;
            }

            @keyframes fadeIn {
                from {
                    opacity: 0;
                    transform: translateY(15px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            .animate-fade-in {
                animation: fadeIn 0.5s ease;
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
                <div class="main-content-card animate-fade-in">
                    <h1 class="form-fade-in">Insert New Category</h1>

                    <form action="CategoriesURL" method="post" enctype="multipart/form-data" class="form-fade-in">
                        <input type="hidden" name="service" value="insertCategory"/>
                        <table>
                            <tr>
                                <td>Category Name</td>
                                <td><input type="text" name="categoryName" required></td>
                            </tr>

                            <tr>
                                <td>Image File</td>
                                <td>
                                    <input type="file" name="imageFile" accept="image/*" required>
                                    <br/>
                                    <img id="imagePreview" class="img-preview" />
                                </td>
                            </tr>

                            <tr>
                                <td>Description</td>
                                <td><input type="text" name="description"></td>
                            </tr>

                            <tr>
                                <td colspan="2"><button type="submit">Add Category</button></td>
                            </tr>
                        </table>
                    </form>

                    <script>
                        document.querySelector('input[name="imageFile"]').addEventListener('change', function (e) {
                            const file = e.target.files[0];
                            if (file) {
                                const reader = new FileReader();
                                reader.onload = function (evt) {
                                    const img = document.getElementById('imagePreview');
                                    img.src = evt.target.result;
                                    img.style.display = 'block';
                                };
                                reader.readAsDataURL(file);
                            }
                        });
                    </script>



                </div>
            </div>

            <script src="${pageContext.request.contextPath}/asset/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
            <script src="${pageContext.request.contextPath}/asset/js/bootstrap.bundle.min.js"></script>
            <script src="${pageContext.request.contextPath}/asset/vendors/apexcharts/apexcharts.js"></script>
            <script src="${pageContext.request.contextPath}/asset/js/pages/dashboard.js"></script>
            <script src="${pageContext.request.contextPath}/asset/js/main.js"></script>
    </body>

</html>
