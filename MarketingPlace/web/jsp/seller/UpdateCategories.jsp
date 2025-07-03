<%-- 
    Document   : UpdateCategories
    Created on : Jun 18, 2025, 2:21:02 AM
    Author     : Admin
--%>
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
            form {
                background-color: white;
                padding: 40px 50px;
                border-radius: 12px;
                box-shadow: 0 4px 30px rgba(0, 0, 0, 0.05);
                max-width: 800px;
                margin: 60px auto;
                font-family: 'Segoe UI', sans-serif;
            }

            h1 {
                color: #435EBE;
                font-size: 36px;
                margin-bottom: -48px;
                text-align: center;
                font-weight: 800;
            }


            table {
                width: 100%;
                border-collapse: collapse;
            }

            td {
                padding: 16px 10px;
                vertical-align: middle;
                color: #435EBE;
                font-size: 15px;
            }

            td:first-child {
                width: 180px;
                font-weight: 700;
                font-size: 16px;
                white-space: nowrap;
                text-align: right;
                padding-right: 12px;
                vertical-align: middle;
            }

            input[type="text"],
            input[type="file"] {
                width: 100%;
                padding: 12px 16px;
                font-size: 16px;
                font-weight: 400;
                box-sizing: border-box;
                border: 1px solid #ccc;
                border-radius: 6px;
            }


            input[type="text"]:focus,
            input[type="file"]:focus {
                border-color: #435EBE;
                outline: none;
                box-shadow: 0 0 4px rgba(67, 94, 190, 0.3);
            }

            .img-link {
                font-size: 13px;
                background-color: #f1f3f5;
                border: 1px solid #d0d0d0;
                padding: 6px 8px;
                border-radius: 4px;
                display: inline-block;
                width: 100%;
                box-sizing: border-box;
                color: #333;
            }

            .img-preview {
                max-width: 140px;
                height: auto;
                margin-top: 6px;
                border: 1px solid #ccc;
                border-radius: 6px;
                box-shadow: 0 0 6px rgba(0, 0, 0, 0.1);
            }

            .image-cell {
                display: flex;
                align-items: center;
                gap: 20px;
            }

            td[colspan="2"] {
                text-align: center;
                padding-top: 20px;
            }

            button {
                background-color: #435EBE;
                color: white;
                padding: 10px 28px;
                border: none;
                border-radius: 6px;
                font-size: 16px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            button:hover {
                background-color: #324ab2;
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
                <div class="main-content-card animate-fade-in" >
                    <h1 class="form-fade-in">Update Category</h1>
                    <form action="CategoriesURL" method="post" enctype="multipart/form-data" class="form-fade-in">
                        <input type="hidden" name="service" value="updateCategory"/>
                        <input type="hidden" name="categoryID" value="${category.categoryID}"/>

                        <table>
                            <tr>
                                <td>Category Name</td>
                                <td><input type="text" name="categoryName" value="${category.categoryName}" required></td>
                            </tr>
                            <tr>
                                <td>Current Image</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${fn:startsWith(category.imageURL, 'http')}">
                                            <div class="img-link">${category.imageURL}</div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="img-link">${pageContext.request.contextPath}/${category.imageURL}</div>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>

                            <tr>
                                <td></td>
                                <td class="image-cell">
                                    <c:choose>
                                        <c:when test="${fn:startsWith(category.imageURL, 'http')}">
                                            <img class="img-preview" src="${category.imageURL}" alt="Image"/>
                                        </c:when>
                                        <c:otherwise>
                                            <img class="img-preview" src="${pageContext.request.contextPath}/${category.imageURL}" alt="Image"/>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                            <tr>
                                <td>Upload New Image</td>
                                <td>

                                    <input type="file" name="imageFile" accept="image/*" style="margin-top: 10px;">
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><img id="newImagePreview" class="img-preview" style="display:none; margin-top: 6px;" /></td>
                            </tr>



                            <tr>
                                <td>Description</td>
                                <td><input type="text" name="description" value="${category.description}"></td>
                            </tr>

                            <tr>
                                <td colspan="2"><button type="submit">Update</button></td>
                            </tr>
                        </table>
                    </form>

                    <script>
                        document.querySelector('input[name="imageFile"]').addEventListener('change', function (e) {
                            const file = e.target.files[0];
                            if (file) {
                                const reader = new FileReader();
                                reader.onload = function (evt) {
                                    const img = document.getElementById('newImagePreview');
                                    img.src = evt.target.result;
                                    img.style.display = 'block';

                                    const link = document.getElementById('previewLink');
                                    link.textContent = file.name;
                                    link.style.display = 'block';
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

